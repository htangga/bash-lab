#!/bin/bash

#copy dan ubah isi file
for i in {1..5}
do
    if [[ $i = 1 ]]; then
        zip text.zip text1.txt
    elif [[ $i > 1 ]]; then
        cp text1.txt text$i.txt
        sed -i -e "s/text1/text$i/g" text$i.txt
        zip text.zip text$i.txt
    fi
done

# clearing unnecessery files

for i in {1..5}
do
    if [[ $i > 1 ]]; then
        rm -rf text$i.txt
    fi
done