#!bin/bash
  up1="Network Mindgeek and 5th floor Viettel 172.16.10.0 is Up"
  up2="Network MI routing out Main VNPT FTTH 172.16.11.0 is Up"
  up3="Network Titan and Auvenir 172.16.12.0 is Up"
  up4="Network Server routing out Main VNPT FTTH 192.168.1.0 is Up"
  up5="Lease line 192.168.6.1 is Up"
  up6="Lease line 10.100.76.36 is Up"
  up7="Lease line 10.100.78.181 is Up"
  up8="tms.titancorpvn.com is Up"
  up9="tis.titancorpvn.com is Up"

  down1="Network Mindgeek and 5th floor Viettel 172.16.10.0 is Down"
  down2="Network MI routing out Main VNPT FTTH 172.16.11.0  is Down"
  down3="Network Titan and Auvenir 172.16.12.0 is Down"
  down4="Network Server routing out Main VNPT FTTH 192.168.1.0 192.168.1.0 is Down"
  down5="Lease line 192.168.6.1 is Down"
  down6="Lease line 10.100.76.36 is Down"
  down7="Lease line 10.100.78.181 is Down"
  down8="tms.titancorpvn.com is Down"
  down9="tis.titancorpvn.com is Down"


   if ping -I 172.16.10.2 google.com -c 3 >/dev/null; then
           echo $up1  > /home/quyetnguyen/Mindgeek-5th-floor-Viettel
   else
           echo $down1  > /home/quyetnguyen/Mindgeek-5th-floor-Viettel
   fi


   if ping -I 172.16.11.2 google.com -c 3 >/dev/null; then
           echo $up2  > /home/quyetnguyen/MI
   else
           echo $down2  > /home/quyetnguyen/MI
   fi


  if ping -I 172.16.12.2 google.com -c 3 >/dev/null; then
           echo $up3  > /home/quyetnguyen/Titan-and-Auvenir
   else
           echo $down3  > /home/quyetnguyen/Titan-and-Auvenir
   fi


  if ping -I 192.168.1.2 google.com -c 3 >/dev/null; then
           echo $up4  > /home/quyetnguyen/Server-routing-out-Main-VNPT-FTTH
   else
           echo $down4  > /home/quyetnguyen/Server-routing-out-Main-VNPT-FTTH
   fi

  
  if ping -c3 192.168.6.1  >/dev/null; then
           echo $up5  > /home/quyetnguyen/Lease-line-1
   else
           echo $down5  > /home/quyetnguyen/Lease-line-1
   fi

  if ping -I 172.16.10.2 10.100.76.36 -c 3 >/dev/null; then
           echo $up6  > /home/quyetnguyen/Lease-line-36
   else
           echo $down6  > /home/quyetnguyen/Lease-line-36
   fi

  
  if ping -I 172.16.10.2 10.100.78.181 -c 3 >/dev/null; then
           echo $up7  > /home/quyetnguyen/Lease-line-181
   else
           echo $down7  > /home/quyetnguyen/Lease-line-181
   fi

  
  curl -s --head  --request GET http://tms.titancorpvn.com/ > web8.txt
    if  cat /home/quyetnguyen/web8.txt | grep "200 OK" ; then
           
           echo $up8  > /home/quyetnguyen/Tms
   else
           echo $down8  > /home/quyetnguyen/Tms
   fi

  curl -s --head  --request GET http://tis.titancorpvn.com/ > web9.txt
    if  cat /home/quyetnguyen/web9.txt | grep "200 OK" ; then
           
           echo $up9  > /home/quyetnguyen/Tis
   else
           echo $down9  > /home/quyetnguyen/Tis
   fi
        
  echo `date` > Time; 
	tail -vn +1 Time Mindgeek-5th-floor-Viettel MI Titan-and-Auvenir Server-routing-out-Main-VNPT-FTTH Lease-line-1 Lease-line-36 Lease-line-181 Tms Tis  > sentmail.txt
 
	cat /home/quyetnguyen/sentmail.txt | mail -s "Report Daily of Router GW-PRI-01" quyetnguyen@gmail.com
 exit 0
