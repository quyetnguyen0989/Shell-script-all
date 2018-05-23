#!/bin/sh
#fi required way to end a if" and done for "for" and esac for "case"

while(true)
do
    clear
    printf "Following operations:\n"
    printf "[a]addition\n[b]Subtraction\n[c]Multiplication\n[d]Division\n"
    printf "######################\n"
    read -p "Please choice: " choice
    case $choice in
    [aA])
        read -p "Enter first integer: " int1
        read -p "Enter second integer: " int2
        res=$((int1 + int2))
    ;;    
   

    [bB])
        read -p "Enter first integer:" int1
        read -p "Enter second integer:" int2
        res=$((int1-int2))
    ;;    


    [cC])
        read -p "Enter first integer:" int1
        read -p "Enter second integer" int2
        res=$((int1*int2))
    ;;    
  

    [dD])
        read -p "Enter first integer:" int1
        read -p "Enter second integer:" int2
        res=$((int1/int2))
    ;;
    *)         
   
   
        res=0
        echo "Please input correct!"
     esac

     echo "The result is:" $res
     read -p "Do you wish to continue ? [y]es or [n]o:" ans
     if [ $ans == 'n' ]
        then
        echo "Exiting Finish :D"
        break
     else 
        continue
     fi

done           






