from sqlalchemy import (
    create_engine, 
    Table,
    Column,
    Float,
    ForeignKey,
    Integer,
    String,
    MetaData
    )    

# executing the instructions from our localhost "chinook" database
engine = create_engine("postgresql+psycopg2://postgres:postgres@localhost:5432/chinook")

meta = MetaData()

# create variable for Artist table

artist_table = Table(
    "artist", meta,
    Column("artist_id", Integer, primary_key=True),
    Column("name", String)
)

# create variable for Album table
album_table = Table(
    "album", meta,
    Column("album_id", Integer, primary_key=True),
    Column("title", String),
    Column("artist_id", Integer, ForeignKey("artist.artist_id"))
)

# create variable for Track table
track_table = Table(
    "track", meta,
    Column("track_id", Integer, primary_key=True),
    Column("name", String),
    Column("album_id", Integer, ForeignKey("album.album_id")),
    Column("media_type_id", Integer, primary_key=False),
    Column("genre_id", Integer, primary_key=False),
    Column("composer", String),
    Column("milliseconds", Integer),
    Column("bytes", Integer),
    Column("unit_price", Float)
)

# making the connection
with engine.connect() as connection:

    # Query 1 - select all records from the "Artist" table
    # select_query = artist_table.select()    
    
    # Query 2 - select only the "Name" column from the "Artist" table
    # select_query = artist_table.select().with_only_columns(artist_table.c.name)

    # Query 3 - select only 'Queen' from the "Artist" table
    # select_query = artist_table.select().where(artist_table.c.name == "Queen")

    # Query 4 - select only by 'artist_id' #50 from the "Artist" table
    # select_query = artist_table.select().where(artist_table.c.artist_id == 50)

    # Query 5 - select only the albums with 'artist_id' #50 from the "Album" table
    # select_query = album_table.select().where(album_table.c.artist_id == 50)

    # Query 6 - select all tracks where the composer is 'Queen' from the "Track" table
    select_query = track_table.select().where(track_table.c.composer == "Queen")

    results = connection.execute(select_query).fetchall()
    print("=== All Records from Artist Table ===")
    for result in results:
        print(result)   