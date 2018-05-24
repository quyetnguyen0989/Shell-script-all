#!bin/bash
  up1="Subnet 172.16.10.0/24 route to WAN Viettel - 115.78.92.111 is Up"
  up2="Subnet 172.16.11.0/24 route to WAN VNPT - 123.21.33.153 is Up"
  up3="Subnet 172.16.12.0/24 route to WAN VNPT - 123.21.33.154 is Up"
  up4="Subnet 192.168.1.0/24 route to WAN VNPT - 123.21.33.153 is Up"
  up5="Lease line 192.168.6.1 is Up"
  up6="Lease line 10.100.76.36 is Up"
  up7="Lease line 10.100.78.181 is Up"
  up8="tms.titancorpvn.com is Up"
  up9="tis.titancorpvn.com is Up"
  allup="Today: All of Services up"

  down1="Subnet 172.16.10.0/24 route to WAN Viettel - 115.78.92.111 is Down"
  down2="Subnet 172.16.11.0/24 route to WAN VNPT - 123.21.33.153 is Down"
  down3="Subnet 172.16.12.0/24 route to WAN VNPT - 123.21.33.154 is Down"
  down4="Subnet 192.168.1.0/24 route to WAN VNPT - 123.21.33.153 is Down"
  down5="Lease line 192.168.6.1 is Down"
  down6="Lease line 10.100.76.36 is Down"
  down7="Lease line 10.100.78.181 is Down"
  down8="tms.titancorpvn.com is Down"
  down9="tis.titancorpvn.com is Down"
  https="https://tis.titancorpvn.com"
  downcase="Today: Service Errors please check bellow"
 


   if ping -I 172.16.10.2 google.com -c 3 >/dev/null; then
           echo $up1  > /home/quyetnguyen/files/Subnet-172.16.10.0-Viettel
   else
           echo $down1  > /home/quyetnguyen/files/Subnet-172.16.10.0-Viettel
   fi


   if ping -I 172.16.11.2 google.com -c 3 >/dev/null; then
           echo $up2  > /home/quyetnguyen/files/Subnet-172.16.11.0-VNPT
   else
           echo $down2  > /home/quyetnguyen/files/Subnet-172.16.11.0-VNPT
   fi


  if ping -I 172.16.12.2 google.com -c 3 >/dev/null; then
           echo $up3  > /home/quyetnguyen/files/Subnet-172.16.12.0-VNPT
   else
           echo $down3  > /home/quyetnguyen/files/Subnet-172.16.12.0-VNPT
   fi


  if ping -I 192.168.1.2 google.com -c 3 >/dev/null; then
           echo $up4  > /home/quyetnguyen/files/Subnet-192.168.1.0-VNPT
   else
           echo $down4  > /home/quyetnguyen/files/Subnet-192.168.1.0-VNPT
   fi

  
  if ping -c3 192.168.6.1  >/dev/null; then
           echo $up5  > /home/quyetnguyen/files/Lease-line-1
   else
           echo $down5  > /home/quyetnguyen/files/Lease-line-1
   fi

  if ping -I 172.16.10.2 10.100.76.36 -c 3 >/dev/null; then
           echo $up6  > /home/quyetnguyen/files/Lease-line-36
   else
           echo $down6  > /home/quyetnguyen/files/Lease-line-36
   fi

  
  if ping -I 172.16.10.2 10.100.78.181 -c 3 >/dev/null; then
           echo $up7  > /home/quyetnguyen/files/Lease-line-181
   else
           echo $down7  > /home/quyetnguyen/files/Lease-line-181
   fi

  
  curl -s --head  --request GET http://tms.titancorpvn.com/ > web8.txt
    if  cat /home/quyetnguyen/files/web8.txt | grep "200 OK" ; then
           
           echo $up8  > /home/quyetnguyen/files/Tms
   else
           echo $down8  > /home/quyetnguyen/files/Tms
   fi

  status=`curl $https -k -s -f -o /dev/null && echo "OK" || echo "ERROR"`
    echo "testing $https=$status" > /home/quyetnguyen/files/web9.txt
    if  cat /home/quyetnguyen/files/web9.txt | grep "OK" ; then
           
           echo $up9  > /home/quyetnguyen/files/Tis
   else
           echo $down9  > /home/quyetnguyen/files/Tis
   fi
        
  echo `date` > /home/quyetnguyen/files/Time;

   if
    grep -rnw '/home/quyetnguyen/files/' -e "Up" ; then
            echo $allup > /home/quyetnguyen/files/Sum
   else
            echo $downcase > /home/quyetnguyen/files/Sum   
   fi
 	
	cd /home/quyetnguyen/files/ && tail -vn +1 Time Sum Subnet-172.16.10.0-Viettel Subnet-172.16.11.0-VNPT Subnet-172.16.12.0-VNPT Subnet-192.168.1.0-VNPT Lease-line-1 Lease-line-36 Lease-line-181 Tms Tis  > /home/quyetnguyen/sentmail.txt	
    	cat /home/quyetnguyen/sentmail.txt | mail -s "Report Network Daily" it@titancorpvn.com
 exit 0
