#Conexion a Postgresql windows

#1. Instalacion del ambiente virtual
python -m pip install virtualenv

#2. ubicarse dentro del proyecto(directorio)
cd proyectonuevo

#3. creacion del ambiente virtual
python -m venv env

#4. ingresar al ambiente virtual
cd env/Scripts
activate

#5. instalar psycopg2 en el ambiente virtual
python -m pip install psycopg2

#6. crear test de conexion:
#=========================================
# This gist contains a direct connection to a local PostgreSQL database
# called "suppliers" where the username and password parameters are "postgres"

# This code is adapted from the tutorial hosted below:
# http://www.postgresqltutorial.com/postgresql-python/connect/

import psycopg2

# Establish a connection to the database by creating a cursor object
# The PostgreSQL server must be accessed through the PostgreSQL APP or Terminal Shell

# conn = psycopg2.connect("dbname=suppliers port=5432 user=postgres password=postgres")

# Or:
conn = psycopg2.connect(host="localhost", port = 5432, database="postgres", user="postgres", password="postgres")

# Create a cursor object
cur = conn.cursor()

# A sample query of all data from the "vendors" table in the "suppliers" database
cur.execute("""SELECT id, customer_name, co_use_cre, fe_use_cre
FROM ceadm.customers;
""")
query_results = cur.fetchall()
print(query_results)

# Close the cursor and connection to so the server can allocate
# bandwidth to other requests
cur.close()
conn.close()
#=========================================
