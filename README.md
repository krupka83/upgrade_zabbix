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
5. 6.4 #(zjistit jakou verzi potřebujete, skript umí nainstalovat jakou koliv verzi, ale musí zabbix podporovat - https://www.zabbix.com/download)
6. /tmp/upgrade_zabbix

![image](https://user-images.githubusercontent.com/46448228/219662287-6bf3becc-2af6-4e2a-9614-b099ca800f82.png)

Co může nastat:
přivypínaní služby je zapotřebí stsknout q, aby prošel dal script
![image](https://user-images.githubusercontent.com/46448228/220590865-fb5214ed-d511-4a58-933e-2913d98d9cbc.png)


Instalace se zeptá na conf soubor jestli může přepsat nebo nechat původní? 
Potvrdit enter (default je N)
![image](https://user-images.githubusercontent.com/46448228/220591484-48a46b12-653b-4f90-ac3c-bb80753ed40e.png)

Po upgradu:
1. ve složce config bude nový soubor zabbix-release*
2. ve složce backup budou dva soubory db.sql (záloha zabbix DB) a zabbix_proxy.conf (záloha konfiguračního souboru)
3. ve složce log je všechno co skript dělal:

![image](https://user-images.githubusercontent.com/46448228/220632391-aeef2011-94a2-47c8-a789-4ebe5f35b251.png)



Testováno
1. UPGRADE-ZABBIX-PROXY-DEBIAN-MYSQL - ověřeno
2. UPGRADE-ZABBIX-PROXY-DEBIAN-PG - ověřeno
3. UPGRADE-ZABBIX-PROXY-UBUNTU-MYSQL - ověřeno
4. UPGRADE-ZABBIX-PROXY-UBUNTU-PG - ověřeno
5. UPGRADE-ZABBIX-PROXY-CENTOS-MYSQL - ověřeno
6. UPGRADE-ZABBIX-PROXY-CENTOS-PG - ověřeno
7. UPGRADE-ZABBIX-PROXY-REDHAT-MYSQL - ověřeno
8. UPGRADE-ZABBIX-PROXY-REDHAT-PG - ověřeno

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
