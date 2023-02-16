#!/bin/bash

############################################
# Datum modify: 14.02.2023 
#
# info: Skript pro upgrade starych verzi zabbix-proxy 
# 
#
# autor: Martin Krukpa
#
# pozn: Testovano na OS REDHAT, CentOS, UBUNTU, DEBIAN 
#       $1 verze na kterou chci upgaradovat, muze se i downgrade
#       $2 Kde script lezi napr. /tmp 
#
############################################

# nacitani configurace
. config/config.cfg

# promene ktere pridava user
echo -n "Jakou verzi chcete nainstalovat: " 
read verze  
echo -n "Kde lezi script: "
read cesta

# pracovni adresar
WD=$cesta
BACKUP=$WD/backup

# nazev skriptu
SCRIPT=Upgrade_zabbix_proxy

# datum
DATE_LOG()
{
    echo `date +%y/%m/%d_%H:%M:%S` $*
}

DATE=`date +"%Y%m%d"`

# promené
OS=`cat /etc/os-release | grep -i NAME | cut -d '"' -f2 | head -n 1 | cut -d ' ' -f1`

# vyhledat yum
yum=`which yum | cut -d '/' -f4`

# podminku podle OS jestli pouzivaji yum nebo apt
if [[  $yum=yum  ]]
then
DB_yum=`yum list installed | less | grep -i zabbix-proxy | cut -d ' ' -f1`
else
DB_apt=`apt list --installed | grep -i zabbix-proxy | cut -d ' ' -f1`
fi

# Logovani
LOG=$WD/log/$DATE-$SCRIPT.$$.log

# skript jestli probehl spravne
SCRIPT=0

############################ START ############################
echo "##### $DATE_LOG : Start #####" >> $LOG

# zapise do souboru -1 zname ze skript bezi
echo -1 > $WD/run/$SCRIPT.rc

# Jaky je OS na Linuxu
echo "##### $DATE_LOG : Operacni system je $OS #####" >> $LOG

# zaloha zalohovaciho souboru
cp -rp /etc/zabbix/zabbix_proxy.conf $BACKUP/

# podle OS se provede skript
case $OS in 
  CentOS)
        # stop zabbix
	#`$zabbixstop`
	service zabbix-proxy stop
	sleep 10s
	service zabbix-proxy status
	echo "##### $DATE_LOG : Zastaveni sluzby zabbix-proxy #####" >> $LOG

	# Zaloha DB+con
	case $DB_yum in 
		$PG_ZABBIX)
			echo "##### $DATE_LOG : DB je POSTGRESQL #####" >> $LOG
	  		sudo -u postgres pg_dumpall > $BACKUP/db.sql
	 		echo "##### $DATE_LOG : Databaze jsou zalohovany #####" >> $LOG
			;;
		$MYSQL_ZABBIX) 
			echo "##### $DATE_LOG : DB je MYSQL #####" >> $LOG
		        mysqldump -u zabbix -pzabbix --all-databases > $BACKUP/db.sql
			echo "##### $DATE_LOG : Databaze jsou zalohovany #####" >> $LOG
			;;
	esac

	# Smazat Repozitar
	#echo "##### $DATE_LOG : Smazan istareho repozitare #####" >> $LOG
	#rm -r /etc/yum.repos.d/zabbix.repo
	#yum clean all
	#echo "##### $DATE_LOG : Smayani starych balicku #####" >> $LOG
	
	# pridat novy repoyitar
	OS_verze=`cat /etc/os-release | grep -i VERSION_ID | cut -d '"' -f2 | head -n 1 | cut -d ' ' -f1`
	case $OS_verze in
		8)
			if [[  $PG_ZABBIX=$DB_yum  ]]
			then
				echo "##### $DATE_LOG : Stazeny repoyitar pro CentOS $OS_verze #####" >> $LOG
				rpm -Uvh https://repo.zabbix.com/zabbix/$verze/rhel/$OS_verze/x86_64/$PG_release
		        else
				echo "mysql"
			fi
	        ;;
	        9)
			if [[  $PG_ZABBIX=$DB_yum  ]]
			then
				echo "##### $DATE_LOG : Stazeny repoyitar pro CentOS $OS_verze #####" >> $LOG
                        	rpm -Uvh https://repo.zabbix.com/zabbix/$verze/rhel/$OS_verze/x86_64/$PG_release
			else
				echo "mzsql"
			fi
		;;
        esac

	# nacist package
	yum update
	echo "##### $DATE_LOG : Pridani novych balicku #####" >> $LOG

	# zapsat do epel
	if [[  ! -f $epel  ]]
	then
		echo "##### $DATE_LOG : Soubor neexistuje $epel  #####" >> $LOG
	else
		echo "excludepkgs=zabbix*" >> $epel
		echo "##### $DATE_LOG : Zapsani do epel.repo #####" >> $LOG
	fi

	# Install Zabbix proxy
        `$zabbixproxyinstall`
	echo "##### $DATE_LOG : Nainstalovany novy zabbix-proxy #####" >> $LOG
	
	# Zabbix-proxy start
	#`$zabbixstart`
	service zabbix-proxy start
	echo "##### $DATE_LOG : Spusteni zabbix-proxy #####" >> $LOG

	# zjistit verzi
	`$findver` >> $LOG
	echo "##### $DATE_LOG : Zjisteni verze zabbix-proxy #####" >> $LOG

    ;;	
  Ubuntu) 
    echo "BSD is a good system, too"
    ;;
  RedHat)
    echo "you should consider an open source system"
    ;;
  DEBIAN)
    echo "ted"
    ;;    
  *)
    echo "##### $DATE_LOG : Server nepodporuje OS, doporucuji upgrade rucne #####" >> $LOG
    ;;
esac

# ceka na behnuti zabbix-proxy
sleep 15s

# Status sluzby
`$zabbixstatus` >> $LOG
#service zabbix-proxy status

# skript probehl spravne
echo 0 > $WD/run/$SCRIPT.rc

echo "##### $DATE_LOG : Konec #####" >> $LOG

############################ KONEC #############################
