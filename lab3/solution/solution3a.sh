#!/bin/bash

# input
until [[ $coba =~ ^[0-9]+\.?[0-9]*$ ]]
do
    read -r -p "kompress berapa kali ? " coba
done

a=1
b=1

for ((i=1; i<=$coba; i++))
do
    echo -n "$a,"
    #zip ${b}.zip ${a}.zip
    c=$((a+b))
    a=$b
    b=$c
done