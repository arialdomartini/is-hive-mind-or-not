from sqlite_helper import exec_sql

if __name__ == "__main__":
    exec_sql("CREATE TABLE contribs(project_name TEXT, hash TEXT, committed_on datetime, committed_on_ticks int);")
    exec_sql("CREATE TABLE contribs_ordered(project_name TEXT, hash TEXT, committed_on datetime, committed_on_ticks int);")
    exec_sql("CREATE TABLE contribs_next(project_name TEXT, hash TEXT, committed_on datetime, committed_on_ticks int, prev_ticks int, next_ticks int);")
    exec_sql("CREATE TABLE contribs_spent(project_name TEXT, hash TEXT, committed_on datetime, committed_on_ticks int, prev_ticks, next_ticks int, time_spent_before int, time_spent_after int);")
