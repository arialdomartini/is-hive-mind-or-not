#!/bin/bash
user_name=$1
user_email=$2
project_name=$3

base_dir=`pwd`

local_project_path=projects/${project_name}

cd $local_project_path
git log --pretty=format:'%H, %ae, %aD' --abbrev-commit --date=raw | grep $user_email > ${base_dir}/csv/$project_name.csv

cd ${base_dir}


