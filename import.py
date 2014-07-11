import sys
import csv
import os
from sqlite_helper import exec_sql

if __name__ == "__main__":
    user_name = sys.argv[1]
    user_email = sys.argv[2]
    project_name = sys.argv[3]

    project_csv = os.path.join("csv", project_name + ".csv")
    print("Analyzing the contributes of %s to project %s" % (user_email, project_name))
    with open(project_csv, 'r') as f:
        csv = csv.reader(f, delimiter = ",")
        for row in csv:
            committed_on = row[2] + row[3]
            commit_hash = row[0]
            committed_on_ticks = row[4]
            exec_sql("INSERT INTO contribs(project_name, hash, committed_on, committed_on_ticks) VALUES ('%s', '%s', '%s', %s);" % (project_name, commit_hash, committed_on, committed_on_ticks))
    
    print("OK")
