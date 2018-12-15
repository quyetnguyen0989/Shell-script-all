#/bin/bash
if ping 192.168.1.1 -c 70 >/dev/null; then
   echo "host alive"
else
   shutdown -h
fi
