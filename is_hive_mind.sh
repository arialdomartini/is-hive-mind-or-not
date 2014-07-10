#!/bin/bash

user_name=$1
user_email=`python get-email.py $user_name`
repositories=`python get-repositories.py $user_name`
for repository in $repositories
do
    echo "Analyzing $repository"
    ./analyze.sh $user_name $user_email $repository
done
echo "Done"
