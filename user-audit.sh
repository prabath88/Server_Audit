#!/bin/bash


rm avg Employees group-members-tmp Groups groups-tmp mem Members rr User-groups Usernames -rf

for file in $(ls -la /var/log/sa/* | grep sa[0-9] | awk '{print $9}')
do
        sar -f $file | head -n 1
        sar -u -f $file | grep Average: | awk -F " " '{sum = (100 - $8) } END { print sum "%" }'| awk -F% '{ print $1 }' >> avg
        sar -r -f $file | grep Average | awk -F " " '{ sum = ($3-$5-$6)/($2+$3) * 100   } END { print sum "%" }'| awk -F% '{ print $1 }' >> mem

done

rm groups-tmp Employees Usernames User-groups -rf
file="/etc/passwd"
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
  group=$(id $f1)
  echo $group >> groups-tmp
  echo $f5 >> Employees
  echo $f1 >> Usernames

done <"$file"

awk -F= '{print $4}' ./groups-tmp >> User-groups


#==================================================
rm group-members-tmp -rf
cut -d: -f1 /etc/group > Groups
file3="./Groups"
while  read line
do

getent group $line >> group-members-tmp

done <"$file3"
#==============================================
rm ./Members -rf
file4="./group-members-tmp"
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do

echo $f4 >> ./Members

done <"$file4"
#==============================
