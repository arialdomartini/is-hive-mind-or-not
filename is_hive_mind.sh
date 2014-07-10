#!/bin/bash

user_name=$1
user_email=`python get-email.py $user_name`
#python get-repositories.py $user_name > repositories
repositories=`cat repositories`


for repository in $repositories
do
    echo "Cloning $repository"
    ./clone.sh $user_name $user_email $repository

    echo "Extracting $repository"
    ./extract.sh $user_name $user_email $repository

    echo "Importing $repository"
    python ./import.py $user_name $user_email $repository

done


echo "Done"
