#!/bin/bash

for i in {1..5}
do
    cp text1.txt text$i.txt
    sed -i -e "s/text1/text$i/g" text$i.txt
    zip 1.zip text$i.txt
done

for i in {1..5}
do
    if [[ $i>2 ]]; then
        zip $i.zip $((i-1)).zip
    fi
done

for i in {1..5}
do
    if [[ $i > 1 ]]; then
        rm -rf text$i.txt
    fi
done