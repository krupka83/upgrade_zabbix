# upgrade_zabbix

Problém s verzí zabbix-proxy 


![image](https://user-images.githubusercontent.com/46448228/219659784-6c5af7be-f251-489d-a19c-1fc6da9f5887.png)

Postup instalace:

1. nainstalovat:

apt install curl git (Debian, Ubuntu, ...)

yum install curl git (CentOS, Redhat, ...)

2. cd /tmp
3. git clone https://github.com/krupka83/upgrade_zabbix.git
4. bash upgrade_zabbix/bin/run.sh
5. 6.3 #(zjistit jakou verzi potřebujete, skript umí nainstalovat jakou koliv verzi, ale musí zabbix podporovat - https://www.zabbix.com/download)
6. /tmp/upgrade_zabbix

![image](https://user-images.githubusercontent.com/46448228/219662287-6bf3becc-2af6-4e2a-9614-b099ca800f82.png)

CO může nastat:
Ptaní na conf souboru jestli může přepsat? 
Potvrdit Y
![image](https://user-images.githubusercontent.com/46448228/220589867-180bb4c7-7a53-4367-8c40-fd7953f30b8f.png)



Testováno
1. UPGRADE-ZABBIX-PROXY-DEBIAN-MYSQL - ověřeno
2. UPGRADE-ZABBIX-PROXY-DEBIAN-PG - ověřeno
3. UPGRADE-ZABBIX-PROXY-UBUNTU-MYSQL - připraveno
4. UPGRADE-ZABBIX-PROXY-UBUNTU-PG - připraveno
5. UPGRADE-ZABBIX-PROXY-CENTOS-MYSQL - ověřeno
6. UPGRADE-ZABBIX-PROXY-CENTOS-PG - ověřeno
7. UPGRADE-ZABBIX-PROXY-REDHAT-MYSQL - připraveno
8. UPGRADE-ZABBIX-PROXY-REDHAT-PG - připraveno

DB požadavky:
![image](https://user-images.githubusercontent.com/46448228/220383918-bbef185d-bcaa-49a8-8429-51d6097d5cf8.png)

Návody na instalaci:

POSTGRESQL pro RHEL8/RHEL9
https://www.postgresql.r2schools.com/how-to-install-postgresql-and-pgadmin-on-rhel-9/

MYSQL pro RHEL8/RHEL9
https://computingforgeeks.com/how-to-install-mariadb-server-on-centos-rhel-linux/

POSTGRESQL pro DEBIAN/UBUNTU
https://techviewleo.com/how-to-install-postgresql-15-on-debian/

MYSQL pro DEBIAN/UBUNTU
https://computingforgeeks.com/how-to-install-mariadb-on-debian/
