import sqlite3

db = "db/db.db"


def exec_sql(sql):
    print("Executing %s" % sql)

    conn = sqlite3.connect(db)

    conn.cursor().execute(sql)

    conn.commit()
