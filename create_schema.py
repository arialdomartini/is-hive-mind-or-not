from sqlite_helper import exec_sql

if __name__ == "__main__":
    exec_sql("CREATE TABLE contribs(project_name TEXT, hash TEXT, committed_on datetime);")
