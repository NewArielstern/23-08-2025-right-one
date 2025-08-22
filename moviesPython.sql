import psycopg2
import psycopg2.extras

try:
    conn = psycopg2.connect(
        dbname='postgres',
        user='postgres',
        password='admin',
        host='localhost',
        port='5432',
        cursor_factory=psycopg2.extras.RealDictCursor,
   )
    #         Cur declare
    cur = conn.cursor()
    # 1.
    # cur.execute('''SELECT * FROM movies;''')
    # for row in cur.fetchall():
    #     print(dict(row))

    # 2.
    # name_to_find = str(input('Insert movie to search\n'))
    # cur.execute('''SELECT * FROM movies WHERE movie_name LIKE %s;''',(f'%{name_to_find.title()}%',))
    # rows = cur.fetchall()
    # if len(rows) == 0:
    #     print("No Result")
    # for row in rows:
    #     print(dict(row))

    # 3.
    name_to_insert = input('Insert the name of the new movie')
    cur.execute('''''')



    conn.commit()
    conn.close()
    print("Connected successfully.")
except psycopg2.Error as e:
    print("Connection error:", e)

