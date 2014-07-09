#!/bin/bash
user_name=$1
user_email=$2
project_name=$3

base_dir=`pwd`

github_url="git@github.com:"
user_github_url=${github_url}/${user_name}
project_github_url=${user_github_url}/${project_name}
local_project_path=projects/${project_name}

echo "Cloning the ${user_name}'s git repository: ${project_github_url} into $local_project_path"
git clone ${project_github_url} $local_project_path


#cd $local_project_path
#git log --pretty=format:'%H, %ae, %aD' --abbrev-commit --date=raw > ${base_dir}/csv/$project_name

#cd ${base_dir}


#echo "Extracting ${user_name}'s contributions"
#python import.py $user_email $project_name 
