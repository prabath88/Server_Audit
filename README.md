# Server_Audit

server health check report generator. This Audit report gives you monthly average CUP and memory usage, Disk Usage and list of users and their groups. 

RUN the main.py 

$python3.6 main.py
Select your OS
* (1) Debian Family OS
  (2) Redhat Family OS
select you os type 1 or 2, type enter for Debian:
then you must select the correct OS type of your server. 

it will update the server.xlsx file with correct information of the server. Every month you can run the same main.py script to update the information in server.xlsx

prerequisites
--------------

1) You should install python Python 3.6 or latest

2) You need to install pandas,openpyxl and xlsxwriter

   $pip install xlsxwriter
   $pip install pandas
   $pip install openpyxl

3) You should install sysstat on your server

  $yum install sysstat -y

   Open “/etc/default/sysstat” using your favorite file editor and change ENABLED=”false” to ENABLED=”true”

  $vi /etc/default/sysstat

   Should sadc collect system activity informations? Valid values
   are "true" and "false". Please do not put other values, they
   will be overwritten by debconf!
   ENABLED="true"


One more thing to do, change the collection interval from every 10 minutes to every 2 minutes.

  $vi /etc/cron.d/sysstat
Change
5-55/10 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1
To
*/2 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1


Restart the service.

  $service sysstat restart



