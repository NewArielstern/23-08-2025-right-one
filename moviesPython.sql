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
    1.
    cur.execute('''SELECT * FROM movies;''')
    for row in cur.fetchall():
        print(dict(row))

    2.
    name_to_find = str(input('Insert movie to search\n'))
    cur.execute('''SELECT * FROM movies WHERE movie_name LIKE %s;''',(f'%{name_to_find.title()}%',))
    rows = cur.fetchall()
    if len(rows) == 0:
        print("No Result")
    for row in rows:
        print(dict(row))

    3.
    name_to_in = str(input('Insert the Name of the new movie'))
    genre_to_in = str(input('Insert the Genre of the new movie'))
    country_to_in = str(input('Insert the Country of the new movie'))
    language_to_in = str(input('Insert the Language of the new movie'))

    while True:
        try:
            year_to_in = int(input('Insert the Year of the new movie'))
            if 2008 < year_to_in < 2025:
                break
            else:
                print('this year is 2025... Try again')
        except ValueError :
            print('Must be a number')
    
    while True:
        try:
            revenue_to_in = int(input('Insert the Revenue of the new movie'))
            break
        except ValueError :
            print('Must be a number')

    data_to_in = (name_to_in,genre_to_in,country_to_in,language_to_in,year_to_in,revenue_to_in)

    cur.execute('''INSERT INTO movies (movie_name,genre,country,language,year,revenue) VALUES
     (%s,%s,%s,%s,%s,%s);''',data_to_in)



    conn.commit()
    conn.close()
    print("Connected successfully.")
except psycopg2.Error as e:
    print("Connection error:", e)

