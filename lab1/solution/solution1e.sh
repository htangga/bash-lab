#!/bin/bash

#ziping all files to 5.zip
for i in {5..1}
do
    cp text1.txt text$i.txt
    sed -i -e "s/text1/text$i/g" text$i.txt
    zip 5.zip text${i}.txt
done

#zipping recursively from 1.zip to 5.zip
for i in {5..1}
do
 if [[ $i<5 ]]
    then
        zip ${i}.zip $((i+1)).zip
    fi
done

# cleanup temp files
for i in {5..1}
do
    if [[ $i>1 ]]
    then
        rm -rf ${i}.zip text${i}.txt
    fi
done