#!/bin/bash
 
#limit input (only number)
until [[ $num =~ ^[1-9]+\.?[0-9]*$ ]]
do
    read -r -p 'mau berapa kali compress ? ' num 
done

#ziping all files to $num.zip
for ((i=num;i>0;i--))
do
    cp text1.txt text${i}.txt
    sed -i -e "s/text1/text${i}/g" text${i}.txt
    zip ${num}.zip text${i}.txt
done

#zipping recursively from 1.zip to $num.zip
for ((i=num;i>0;i--))
do
    if [[ $i<num ]]
    then
        zip ${i}.zip $((i+1)).zip
    fi
done

# cleanup temp files
for ((i=num;i>0;i--))
do
    if [[ $i>1 ]]
    then
        rm -rf ${i}.zip text${i}.txt
    fi
done
