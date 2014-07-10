#!/bin/bash

user_name=$1
user_email=`python get-email.py $user_name`
#python get-repositories.py $user_name > repositories
repositories=`cat repositories`

if [[ false == true ]]; then
    for repository in $repositories
    do
        echo "Cloning $repository"
        ./clone.sh $user_name $user_email $repository
    done
fi

if [[ false == true ]]; then
    for repository in $repositories
    do
        echo "Extracting $repository"
        ./extract.sh $user_name $user_email $repository
    done
fi

if [[ false == true ]]; then
    for repository in $repositories
    do
        echo "Importing $repository"
        ./import.sh $user_name $user_email $repository
    done
fi



echo "Done"
