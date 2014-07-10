import sys
import csv
import os

if __name__ == "__main__":
    user_email = sys.argv[1]
    project_name = sys.argv[2]
    project_csv = os.path.join("csv", project_name + ".csv")
    print("Analyzing the contributes of %s to project %s" % (user_email, project_name))
    with open(project_csv, 'r') as f:
        csv = csv.reader(f, delimiter = ",")
        for row in csv:
            committed_on = line[2]
            commit_hash = line[1]
            print("INSERT INTO contribs(project_name, hash, committed_on_local, committed_on_absolute) VALUE()" % (project_name, commit_hash, committedon, ""))
    
    print("OK")
