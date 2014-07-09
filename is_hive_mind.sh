#!/bin/bash

user_name=$1
user_email=`python get-email.py $user_name`

./analyze.sh $user_name $user_email bytes.js

echo "Done"
