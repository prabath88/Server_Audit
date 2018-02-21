# Server_Audit
server health check report generator

RUN the main.py 

---> python main.py

it will update the server.xlsx file with correct informations. DO NOT run user-audit.sh. 
these three file should be in same directory and script (main.py) should run as root

prerequisites
--------------

1) You should install python Python 3.6.4 or latest


2) You should install sysstat on your server
---> yum install sysstat -y

Open “/etc/default/sysstat” using your favorite file editor and change ENABLED=”false” to ENABLED=”true”

---> vi /etc/default/sysstat

# Should sadc collect system activity informations? Valid values
# are "true" and "false". Please do not put other values, they
# will be overwritten by debconf!
ENABLED="true"


One more thing to do, change the collection interval from every 10 minutes to every 2 minutes.

---> vi /etc/cron.d/sysstat
Change
5-55/10 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
To
*/2 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1


Restart the service.

---> service sysstat restart

