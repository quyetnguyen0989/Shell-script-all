#!/bin/bash
    for i in 1 2 3 4 5
    do
    echo "print $i time"
    done

printf "Next\n"
    for i in {1..6}
    do
    echo "print $i time"
    done

printf "Print just odd, not even number"
    for i in {1..20..2}
    do
    echo "print $i time"
    done

printf "use for the same c"
    for((c=1;c <=5; c++))
    do
    echo "print $c time"
    done

printf "Print character"
    for i in {a..f}
    do
    echo "print character $i time"
    done

printf "print list name may be in the future can print var\n"
    for c in quyet wiley nguyen
    do
    echo "$c"
    done

printf "for time five times\n"
    for c in {1..2}
    do
    sleep 1
    date
    done

printf "for c current time\n"
    for c in [1..2]
    do
    echo "current time $(date +%T)"
    sleep 1
    done

# printf "Unzip many file zip"
#     for i in *zip
#     do
#     unzip $i
#     done

printf "Untar many tar.gz"
    for i in *tar.gz
    do
    tar xvzf $i
    done
    
printf "convert all avi to mp4 format\n"
    for i in *.avi
    do
    ffmpeg -i "$i" "${i%.avi}.mp4"
    done

printf "convert all flac to mp3\n"
    for i in *.flac
    do
    flac -c -d "$i" | lame -m -j -b 192 -s 44.1 - "$i%.flac.mp3"    

printf "Search log file for errors\n"
    v="/var/log"
    for i in $v/messages $v/kern.log $v/syslog
    do
    echo "Processing $i, please wait.."
    echo "-----[Start: $i @ $(date)]---" >> /tmp/error.log
    egrep -i 'warn|error|critical' "$i" >> /tmp/error.log
    echo "---[End: $i @ $(date)]---" >> /tmp/error.log
    done

printf "Print uptime list linux\n"
    servers="kirk-app"
    for s in $servers
    do
    echo "$s"
    ssh ${s} uptime
    done

    

#https://www.cyberciti.biz/faq/bash-for-loop/
#https://www.youtube.com/watch?v=ocXb3qeg7Es&feature=youtu.be
