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

# promene ktere pridava user
echo -n "Jakou verzi chcete nainstalovat: " 
read verze  
echo -n "Kde lezi script: "
read cesta

# pracovni adresar
WD=$cesta
BACKUP=$WD/backup
LOG=$WD/log
RUN=$WD/run
TMP=$WD/tmp

# nacitani configurace
. $WD/config/config.cfg

# vytvorit slozky pro soubory
for i in $BACKUP $LOG $RUN $TMP
do 
	if [[  -d $i  ]]
	then
		echo "##### $DATE_LOG : Slozka jiz existuje $i #####" 
	else 
		mkdir $i
	fi	
done

# nazev skriptu
SCRIPT=Upgrade_zabbix_proxy

# datum
DATE_LOG()
{
    echo `date +%y/%m/%d_%H:%M:%S` $*
}

DATE=`date +"%Y%m%d"`

# vyhledat yum
yum=`which yum`
if [[ -f $yum  ]]
then
yum=ano
else
yum=ne
fi

# podminku podle OS jestli pouzivaji yum nebo apt
if [[  "$yum" == "ano"  ]]
then
DB_yum=`yum list installed | less | grep -i zabbix-proxy | cut -d ' ' -f1 | cut -d '.' -f1 `
else
DB_apt=`apt list --installed | grep -i zabbix-proxy | cut -d ' ' -f1 | cut -d '/' -f1`
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
  CentOS|Red)

	# zabbix sluzby
	service zabbix-proxy stop
	#sleep 10s
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
		        mysqldump -u$zabbixuser -p$zabbixpassword -d $zabbixdbname > $BACKUP/db.sql
			echo "##### $DATE_LOG : Databaze jsou zalohovany #####" >> $LOG
			;;
	esac

	case $OS_verze in
		7|8|9|10|11)
        	        # stahnout repozitar
		        release=`curl -s https://repo.zabbix.com/zabbix/$verze/rhel/$OS_verze/x86_64/ | grep -i zabbix-release | tail -n 1 | cut -d '"' -f2`
        		rpm -Uvh https://repo.zabbix.com/zabbix/$verze/rhel/$OS_verze/x86_64/$release

			;;
			*)
				echo "##### $DATE_LOG : OS verze linuxu nepodporuje tento script #####" >> $LOG        
				exit 1
	esac

	# nacist package
	#yum update
	echo "##### $DATE_LOG : Pridani novych balicku #####" >> $LOG

	# zapsat do epel
	if [[  ! -f $epel  ]]
	then
		echo "##### $DATE_LOG : Soubor neexistuje $epel  #####" >> $LOG
	else
		echo "excludepkgs=zabbix*" >> $epel
		echo "##### $DATE_LOG : Zapsani do epel.repo #####" >> $LOG
	fi

	selinux=`cat /etc/selinux/config | grep disabled | tail -n 1|  cut -d '=' -f2`
	if [[  $selinux == "disabled"  ]]
	then
                        echo "##### $DATE_LOG : SELINUX vypnuty #####" >> $LOG
	else
	                echo "##### $DATE_LOG : SELINUX je zapnuty msi se nainstalovat politika #####" >> $LOG
                        yum install -y zabbix-selinux-policy
        fi


	# Install Zabbix proxy
	if [[ "$DB_yum" == "$PG_ZABBIX"  ]]
	then
        	echo $zabbixproxyinstall_yum_pg
		yum upgrade -y zabbix-proxy-pgsql zabbix-sql-scripts	
	else
		echo $zabbixproxyinstall_yum_mysql
		yum upgrade -y zabbix-proxy-mysql zabbix-sql-scripts
	fi
	echo "##### $DATE_LOG : Nainstalovany novy zabbix-proxy #####" >> $LOG
	
	# Zabbix-proxy start
	service zabbix-proxy start
	echo "##### $DATE_LOG : Spusteni zabbix-proxy #####" >> $LOG

        # status sluzby
        /bin/systemctl status zabbix-proxy.service


    ;;	
  Ubuntu|Debian)
	DEB_release=`curl -s https://repo.zabbix.com/zabbix/$verze/debian/pool/main/z/zabbix-release/ | grep -i "$OS_verze"_all | tail -n 1 | cut -d '>' -f2 | cut -d '<' -f1`
	UBU_release=`curl -s https://repo.zabbix.com/zabbix/$verze/ubuntu/pool/main/z/zabbix-release/ | grep -i "$OS_verze".04_all | tail -n 1 | cut -d '>' -f2 | cut -d '<' -f1`
	# stop zabbix
        #`$zabbixstop`
        service zabbix-proxy stop
        #sleep 10s
        service zabbix-proxy status
        echo "##### $DATE_LOG : Zastaveni sluzby zabbix-proxy #####" >> $LOG

        # Zaloha DB+con
        case $DB_apt in
                $PG_ZABBIX)
                        echo "##### $DATE_LOG : DB je POSTGRESQL #####" >> $LOG
			pg_dump --dbname=postgresql://$zabbixuser:$zabbixpassword@$zabbixdbhost:5432/$zabbixdbname > $BACKUP/db.sql
                        echo "##### $DATE_LOG : Databaze jsou zalohovany #####" >> $LOG
                        ;;
                $MYSQL_ZABBIX)
                        echo "##### $DATE_LOG : DB je MYSQL #####" >> $LOG
		        mysqldump -u$zabbixuser -p$zabbixpassword -d $zabbixdbname > $BACKUP/db.sql
                        echo "##### $DATE_LOG : Databaze jsou zalohovany #####" >> $LOG
                        ;;
        esac

	# rozdeleni podle distribuce Debian/Ubuntu
        case $OS_verze in
                9|10|11|12|13)
                                echo "##### $DATE_LOG : Stazeny repozitar pro $OS $OS_verze #####" >> $LOG
				wget -P $WD/config/ https://repo.zabbix.com/zabbix/$verze/debian/pool/main/z/zabbix-release/$DEB_release
				dpkg -i $WD/config/$DEB_release
                ;;
                18|20|22|24|26)
                                echo "##### $DATE_LOG : Stazeny repozitar pro UBUNTU $OS_verze.04 #####" >> $LOG
				wget -P $WD/config/  https://repo.zabbix.com/zabbix/$verze/ubuntu/pool/main/z/zabbix-release/$UBU_release
				dpkg -i $WD/config/$UBU_release
                ;;
	       *)
		echo "##### $DATE_LOG : OS verze linuxu nepodporuje tento script #####" >> $LOG
		exit 1 
	;;
        esac

        # nacist package
        apt update
        echo "##### $DATE_LOG : Pridani novych balicku #####" >> $LOG

	# Install Zabbix proxy
        if [[ "$DB_apt" == "$PG_ZABBIX"  ]]
        then
                echo $zabbixproxyinstall_apt_pg
                apt upgrade -y zabbix-proxy-pgsql zabbix-sql-scripts
        else
                echo $zabbixproxyinstall_apt_mysql
                apt upgrade -y zabbix-proxy-mysql zabbix-sql-scripts
        fi
        echo "##### $DATE_LOG : Nainstalovany novy zabbix-proxy #####" >> $LOG

        # Zabbix-proxy start
        #`$zabbixstart`
        service zabbix-proxy start
        service zabbix-proxy status
        echo "##### $DATE_LOG : Spusteni zabbix-proxy #####" >> $LOG

        # zjistit verzi
        #`$findver` 
        echo "##### $DATE_LOG : Zjisteni verze zabbix-proxy #####" >> $LOG
    ;;
  RedHat)
    echo "you should consider an open source system"
    ;;
  *)
    echo "##### $DATE_LOG : Server nepodporuje OS, doporucuji upgrade rucne #####" >> $LOG
    ;;
esac

# skript probehl spravne
echo 0 > $WD/run/$SCRIPT.rc

echo "##### $DATE_LOG : Konec #####" >> $LOG

############################ KONEC #############################
