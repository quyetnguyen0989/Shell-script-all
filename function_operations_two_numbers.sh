#!/bin/bash

input(){
    read -p "Enter first integer:" int1
    read -p "Enter Second intger:" int2
}
#functu
exitPrompt(){
    read -p "Do you want continue [y]es or [n]O :" ans
    if [ ans == 'n' ] 
    then
    printf "Have nice day!"
    break
    else
    continue
    fi 
}

while(true)
    do
    clear 
    printf "enter operations following\n"
    printf "[a]Addition\n[b]Subtraction\n[c]Mutiplication\n[d]Division\n"
    printf "##########################\n"
    read -p "your choice numbers: " choice
    case $choice in

    [aA])
    input
    res=$((int1+int2))
    ;;

    [bB])
    intput
    res=$((int1-int2))
    ;;
    
    [cC])
    input
    res=$((int1*int2))
    ;;

    [dD])
    input
    res=$((int1/int2))
    ;; 
    *)

    res=0
    echo "wrong choice!"
    esac
    
    echo "your resultis: " $res
    exitPrompt
done    
    
