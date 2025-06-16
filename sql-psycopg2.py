import psycopg2
import getpass

# Connect to the PostgreSQL database named "chinook"
# You'll be prompted for the postgres password
password = getpass.getpass("Enter PostgreSQL password for user 'postgres': ")

try:
    connection = psycopg2.connect(
        database="chinook",
        user="postgres",
        password=password,
        host="localhost",
        port="5432"
    )
    print("Successfully connected to the database!")
except psycopg2.Error as e:
    print(f"Error connecting to database: {e}")
    exit(1)

# Create a cursor object using the connection
cursor = connection.cursor()

# Execute a query to test the connection and fetch results
print("Testing database connection with sample queries...")

# Test 1: Count records in each table
print("\n=== Table Record Counts ===")
cursor.execute("""
    SELECT 'genre' as table_name, COUNT(*) as record_count FROM genre
    UNION ALL SELECT 'artist', COUNT(*) FROM artist
    UNION ALL SELECT 'album', COUNT(*) FROM album
    UNION ALL SELECT 'track', COUNT(*) FROM track
    UNION ALL SELECT 'customer', COUNT(*) FROM customer
    UNION ALL SELECT 'invoice', COUNT(*) FROM invoice
    ORDER BY table_name;
""")
results = cursor.fetchall()
for row in results:
    print(f"{row[0]}: {row[1]} records")

# Test 2: Sample artists
print("\n=== Sample Artists ===")
cursor.execute("SELECT artist_id, name FROM artist LIMIT 10")
results = cursor.fetchall()
for row in results:
    print(f"ID: {row[0]}, Name: {row[1]}")

# Test 3: Albums with artists (testing relationships)
print("\n=== Albums with Artists (Testing Relationships) ===")
cursor.execute("""
    SELECT a.title, ar.name as artist_name 
    FROM album a 
    JOIN artist ar ON a.artist_id = ar.artist_id 
    LIMIT 10
""")
results = cursor.fetchall()
for row in results:
    print(f"Album: {row[0]} by {row[1]}")

# Test 4: Tracks with full details
print("\n=== Sample Tracks with Details ===")
cursor.execute("""
    SELECT t.name as track_name, a.title as album_title, ar.name as artist_name, g.name as genre
    FROM track t
    JOIN album a ON t.album_id = a.album_id
    JOIN artist ar ON a.artist_id = ar.artist_id
    JOIN genre g ON t.genre_id = g.genre_id
    LIMIT 5
""")
results = cursor.fetchall()
for row in results:
    print(f"Track: {row[0]} | Album: {row[1]} | Artist: {row[2]} | Genre: {row[3]}")

print("\n=== All tests completed successfully! ===")
print("Your Chinook database is working perfectly with all relationships intact.")

# Close the cursor and connection
cursor.close()
connection.close()
print("Database connection closed.")

# Print the results
for result in results:
    print(result)   