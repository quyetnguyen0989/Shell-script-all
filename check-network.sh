#!bin/sh
  up1="Network Mindgeek and 5th floor Viettel 172.16.10.0 is Up"
  up2="Network MI routing out Main VNPT FTTH 172.16.11.0 is Up"
  up3="Network Titan and Auvenir 172.16.12.0 is Up"
  up4="Network Server routing out Main VNPT FTTH 192.168.1.0 is Up"
  up5="Lease line 192.168.6.1 is Up"
  up6="Lease line 10.100.76.36 is Up"
  up7="Lease line 10.100.78.181 is Up"

  1down="Network Mindgeek and 5th floor Viettel 172.16.10.0 is Down"
  2down="Network MI routing out Main VNPT FTTH 172.16.11.0  is Down"
  3down="Network Titan and Auvenir 172.16.12.0 is Down"
  4down="Network Server routing out Main VNPT FTTH 192.168.1.0 192.168.1.0 is Down"
  5down="Lease line 192.168.6.1 is Down"
  6down="Lease line 10.100.76.36 is Down"
  7down="Lease line 10.100.78.181 is Down"


   if ping -I 172.16.10.3 google.com -c 3 >/dev/null; then
           echo $up1  > /home/quyetnguyen/st1.txt
   else
           echo $down1  > /home/quyetnguyen/st1.txt
   fi


   if ping -I 172.16.11.3 google.com -c 3 >/dev/null; then
           echo $up2  > /home/quyetnguyen/st2.txt
   else
           echo $down2  > /home/quyetnguyen/st2.txt
   fi


  if ping -I 172.16.12.3 google.com -c 3 >/dev/null; then
           echo $up3  > /home/quyetnguyen/st3.txt
   else
           echo $down3  > /home/quyetnguyen/st3.txt
   fi


  if ping -I 192.168.1.3 google.com -c 3 >/dev/null; then
           echo $up4  > /home/quyetnguyen/st4.txt
   else
           echo $down4  > /home/quyetnguyen/st4.txt
   fi

  
  if ping -c3 192.168.1.6  >/dev/null; then
           echo $up5  > /home/quyetnguyen/st5.txt
   else
           echo $down5  > /home/quyetnguyen/st5.txt
   fi

  if ping -I 172.16.10.3 10.100.76.36 -c 3 >/dev/null; then
           echo $up6  > /home/quyetnguyen/st6.txt
   else
           echo $down6  > /home/quyetnguyen/st6.txt
   fi

  
  if ping -I 172.16.10.3 10.100.78.181 -c 3 >/dev/null; then
           echo $up7  > /home/quyetnguyen/st7.txt
   else
           echo $down7  > /home/quyetnguyen/st7.txt
   fi

  exit 0



cat > a.txt st1.txt st2.txt st3.txt st4.txt st5.txt st6.txt st7.txt |  mail -s 'Status Network of Route GW-BK ' quyetnguyen0989@gmail.com
