#!/bin/bash

#copy dan ubah isi file
for i in {1..5}
do
    if [[ $i > 1 ]]; then
        cp text1.txt text$i.txt
        sed -i -e "s/text1/text$i/g" text$i.txt
    fi
done