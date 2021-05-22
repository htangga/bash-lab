#!/bin/bash

# zipping all the text and zip file recursively
for i in {1..5}
do
    if [[ $i == 1 ]]
    then
        zip ${i}.zip text1.txt
    else
        cp text1.txt text$i.txt
        sed -i -e "s/text1/text${i}/g" text${i}.txt
        zip ${i}.zip text$i.txt $((i-1)).zip
    fi
done

# cleanup temp files
for i in {1..5}
do
    if [[ $i == 1 ]]
    then
        rm -f ${i}.zip
    elif [[ $i == 5 ]]
    then
        rm -f text$i.txt
    else
        rm -rf ${i}.zip text$i.txt $((i-1)).zip
    fi
done