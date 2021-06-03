#!/bin/bash

until [[ $coba =~ ^[0-9]+\.?[0-9]*$ ]]
do
    read -r -p "coba berapa kali ? " coba
done

fibonacci(){
    if [[ $1 -le 1 ]]
    then
        echo $1
    else
        #echo $[ `fibonacci $[$1 -1]` + `fibonacci $[$1 -2]`]
        echo $(( $(fibonacci $(($1 - 1)) ) + $(fibonacci $(($1 - 2)) ) ))  
    fi
}

echo fibonacci sequence number $coba is $(fibonacci $coba)
gelo=$(($(fibonacci $coba)+1))
echo hasil fibonacci+1 = $gelo