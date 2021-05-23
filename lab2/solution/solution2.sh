#!/bin/bash

#input only trybers
until [[ $try =~ ^[1-9]+\.?[0-9]*$ ]]
do
    read -r -p 'coba berapa kali ? ' try
done

#unzip all files
for ((i = 1; i <= try; i++))
do
    unzip ${i}.zip
    #find . ! -iregex '.*\.\(zip\|sh\|\)$' -exec cat {} +; echo    
    for j in $(find . ! -iregex '.*\.\(zip\|sh\|\)$')
    do
        cat $j; echo
    done
done

# cleanup zip files
for ((i = 1; i <= try; i++))
do
    rm -rf text${i}.txt
    if [[ $i>1 ]]
    then
        rm -rf ${i}.zip
    fi
done