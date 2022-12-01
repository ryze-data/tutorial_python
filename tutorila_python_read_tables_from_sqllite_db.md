# How to read from a sqLite database using python

I would definitely recommend going the [Geeks for Geeks web page](https://www.geeksforgeeks.org/how-to-list-tables-using-sqlite3-in-python/) that shows you how to do this. It does it in a great way.
I am attaching sample code as I tweaked it very slightly

    import sqlite3

    def main(db_location):
        try:

            # Making a connection between sqlite3
            # database and Python Program
            sqliteConnection = sqlite3.connect(db_location)

            # If sqlite3 makes a connection with python
            # program then it will print "Connected to SQLite"
            # Otherwise it will show errors
            print("Connected to SQLite")

            # Getting all tables from sqlite_master
            sql_query = """SELECT name FROM sqlite_master
            WHERE type='table';"""

            # Creating cursor object using connection object
            cursor = sqliteConnection.cursor()

            # executing our sql query
            cursor.execute(sql_query)
            print("List of tables\n")

            # printing all tables list
            print(cursor.fetchall())

        except sqlite3.Error as error:
            print("Failed to execute the above query\nError: ", error,"\n")

        finally:

            # Inside Finally Block, If connection is
            # open, we need to close it
            if sqliteConnection:

                # using close() method, we will close
                # the connection
                sqliteConnection.close()

                # After closing connection object, we
                # will print "the sqlite connection is
                # closed"
                print("the sqlite connection is closed")


# Python program to use
# main for function call.
if __name__ == "__main__":
	main(db_location = "/home/user/filepath/sample.db")


# Resources
[Query SqlLite Geeks for Geeks](https://www.geeksforgeeks.org/how-to-list-tables-using-sqlite3-in-python/)
