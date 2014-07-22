#!/bin/bash
set -e

user_name=$1
user_email=`python get-email.py $user_name`
#user_email=tj@vision-media.ca
python get-repositories.py $user_name > repositories
#repositories=`cat repositories`


for repository in $repositories
do
#    echo "Cloning $repository"
#    ./clone.sh $user_name $user_email $repository

    echo "Extracting $repository"
    ./extract.sh $user_name $user_email $repository

    echo "Importing username:$user_name email: $user_email repository:$repository"
    python ./import.py $user_name $user_email $repository

done

echo "Producing a big commits log"

echo "insert into contribs_ordered select * from contribs order by committed_on_ticks asc;" | sqlite3 db/db.db
echo "insert into contribs_next(project_name, hash, committed_on, committed_on_ticks, prev_ticks, next_ticks) select *, (select committed_on_ticks from contribs_ordered c2 WHERE c2.committed_on_ticks < c.committed_on_ticks order by c2.committed_on_ticks DESC limit 1) as next, (select committed_on_ticks from contribs_ordered c3 where c3.committed_on_ticks > c.committed_on_ticks order by c3.committed_on_ticks ASC LIMIT 1) as next_tick from contribs_ordered c;" | sqlite3 db/db.db

echo "insert into contribs_spent(project_name , hash , committed_on , committed_on_ticks , prev_ticks, next_ticks , time_spent_before, time_spent_after ) select project_name , hash , committed_on , committed_on_ticks , prev_ticks , next_ticks ,  committed_on_ticks - prev_ticks as time_spent_before, next_ticks - committed_on_ticks as time_spent_after from contribs_next;"  | sqlite3 db/db.db
#echo "select committed_on, project_name, hash from contribs order by committed_on desc;" | sqlite3 db/db.db > all.txt    
echo "Done"
