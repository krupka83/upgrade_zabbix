# upgrade_zabbix

Problém s verzí zabbix-proxy 


![image](https://user-images.githubusercontent.com/46448228/219659784-6c5af7be-f251-489d-a19c-1fc6da9f5887.png)

Postup instalace:

1. nainstalovat:
apt install curl git (Debian, Ubuntu, ...)
apt install curl git (CentOS, Redhat, ...)

2. cd /tmp
3. git clone https://github.com/krupka83/upgrade_zabbix.git
4. bash upgrade_zabbix/bin/run.sh
5. 6.3 #(zjistit jakou verzi potřebujete, skript umí nainstalovat jakou koliv verzi, ale musí zabbix podporovat - https://www.zabbix.com/download)
6. /tmp/upgrade_zabbix

![image](https://user-images.githubusercontent.com/46448228/219662287-6bf3becc-2af6-4e2a-9614-b099ca800f82.png)


Testováno
1. UPGRADE-ZABBIX-PROXY-DEBIAN-MYSQL - připraveno
2. UPGRADE-ZABBIX-PROXY-DEBIAN-PG - připraveno
3. UPGRADE-ZABBIX-PROXY-UBUNTU-MYSQL - připraveno
4. UPGRADE-ZABBIX-PROXY-UBUNTU-PG - připraveno
5. UPGRADE-ZABBIX-PROXY-CENTOS-MYSQL - install 5.4
6. UPGRADE-ZABBIX-PROXY-CENTOS-MYSQL - install 5.4
7. U
8. U


