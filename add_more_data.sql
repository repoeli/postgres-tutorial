-- Additional data for the Chinook database
-- This script adds more tracks with specific composers

-- First, add more Queen songs to existing albums
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (31, 'Bohemian Rhapsody', 31, 1, 1, 'Queen', 354000, 11542000, 0.99),
    (32, 'We Will Rock You', 31, 1, 1, 'Queen', 121000, 3975000, 0.99),
    (33, 'We Are The Champions', 31, 1, 1, 'Queen', 179000, 5856000, 0.99),
    (34, 'Radio Ga Ga', 32, 1, 1, 'Queen', 343000, 11193000, 0.99),
    (35, 'I Want To Break Free', 32, 1, 1, 'Queen', 258000, 8400000, 0.99),
    (36, 'Another One Bites The Dust', 31, 1, 1, 'Queen', 214000, 7008000, 0.99),
    (37, 'Killer Queen', 31, 1, 1, 'Queen', 182000, 5971000, 0.99),
    (38, 'Somebody To Love', 31, 1, 1, 'Queen', 309000, 10089000, 0.99),
    (39, 'Don''t Stop Me Now', 32, 1, 1, 'Queen', 210000, 6858000, 0.99),
    (40, 'Under Pressure', 32, 1, 1, 'Queen & David Bowie', 248000, 8099000, 0.99);

-- Add Beatles songs
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (41, 'Hey Jude', 12, 1, 1, 'John Lennon, Paul McCartney', 425000, 13858000, 0.99),
    (42, 'Let It Be', 12, 1, 1, 'John Lennon, Paul McCartney', 243000, 7944000, 0.99),
    (43, 'Yesterday', 12, 1, 1, 'John Lennon, Paul McCartney', 125000, 4081000, 0.99),
    (44, 'Come Together', 12, 1, 1, 'John Lennon, Paul McCartney', 259000, 8440000, 0.99),
    (45, 'Here Comes The Sun', 12, 1, 1, 'George Harrison', 186000, 6088000, 0.99);

-- Add Led Zeppelin songs
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (46, 'Stairway To Heaven', 28, 1, 1, 'Jimmy Page, Robert Plant', 482000, 15740000, 0.99),
    (47, 'Kashmir', 28, 1, 1, 'Jimmy Page, Robert Plant', 517000, 16885000, 0.99),
    (48, 'Whole Lotta Love', 28, 1, 1, 'Jimmy Page, Robert Plant', 334000, 10929000, 0.99),
    (49, 'Black Dog', 28, 1, 1, 'Jimmy Page, Robert Plant, John Paul Jones', 296000, 9670000, 0.99),
    (50, 'Immigrant Song', 28, 1, 1, 'Jimmy Page, Robert Plant', 144000, 4720000, 0.99);

-- Add Metallica songs
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (51, 'Enter Sandman', 40, 1, 3, 'Metallica', 331000, 10828000, 0.99),
    (52, 'Master Of Puppets', 36, 1, 3, 'Metallica', 517000, 16865000, 0.99),
    (53, 'Nothing Else Matters', 40, 1, 3, 'Metallica', 388000, 12690000, 0.99),
    (54, 'One', 37, 1, 3, 'Metallica', 447000, 14598000, 0.99),
    (55, 'For Whom The Bell Tolls', 39, 1, 3, 'Metallica', 309000, 10102000, 0.99);

-- Add AC/DC songs
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (56, 'Highway to Hell', 4, 1, 1, 'AC/DC', 208000, 6770000, 0.99),
    (57, 'Back In Black', 4, 1, 1, 'AC/DC', 255000, 8330000, 0.99),
    (58, 'Thunderstruck', 4, 1, 1, 'AC/DC', 292000, 9510000, 0.99),
    (59, 'You Shook Me All Night Long', 4, 1, 1, 'AC/DC', 212000, 6917000, 0.99),
    (60, 'TNT', 4, 1, 1, 'AC/DC', 214000, 6995000, 0.99);

-- Add Pink Floyd songs
INSERT INTO artist (artist_id, name) VALUES (51, 'Pink Floyd');
INSERT INTO album (album_id, title, artist_id) VALUES (41, 'The Dark Side of the Moon', 51);
INSERT INTO album (album_id, title, artist_id) VALUES (42, 'The Wall', 51);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (61, 'Another Brick In The Wall', 42, 1, 1, 'Pink Floyd', 315000, 10289000, 0.99),
    (62, 'Comfortably Numb', 42, 1, 1, 'Pink Floyd', 382000, 12465000, 0.99),
    (63, 'Money', 41, 1, 1, 'Pink Floyd', 382000, 12467000, 0.99),
    (64, 'Time', 41, 1, 1, 'Pink Floyd', 415000, 13563000, 0.99),
    (65, 'Wish You Were Here', 41, 1, 1, 'Pink Floyd', 334000, 10897000, 0.99);

-- Add more artists and their songs
INSERT INTO artist (artist_id, name) VALUES (52, 'The Rolling Stones');
INSERT INTO album (album_id, title, artist_id) VALUES (43, 'Sticky Fingers', 52);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (66, 'Paint It Black', 43, 1, 1, 'Mick Jagger, Keith Richards', 202000, 6595000, 0.99),
    (67, 'Satisfaction', 43, 1, 1, 'Mick Jagger, Keith Richards', 224000, 7316000, 0.99),
    (68, 'Brown Sugar', 43, 1, 1, 'Mick Jagger, Keith Richards', 228000, 7448000, 0.99),
    (69, 'Sympathy For The Devil', 43, 1, 1, 'Mick Jagger, Keith Richards', 382000, 12495000, 0.99),
    (70, 'Gimme Shelter', 43, 1, 1, 'Mick Jagger, Keith Richards', 271000, 8819000, 0.99);

-- Add modern artists
INSERT INTO artist (artist_id, name) VALUES (53, 'Coldplay');
INSERT INTO album (album_id, title, artist_id) VALUES (44, 'A Rush of Blood to the Head', 53);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (71, 'The Scientist', 44, 1, 1, 'Coldplay', 261000, 8524000, 0.99),
    (72, 'Clocks', 44, 1, 1, 'Coldplay', 308000, 10057000, 0.99),
    (73, 'Yellow', 44, 1, 1, 'Coldplay', 269000, 8768000, 0.99),
    (74, 'Viva La Vida', 44, 1, 1, 'Coldplay', 242000, 7902000, 0.99),
    (75, 'Fix You', 44, 1, 1, 'Coldplay', 294000, 9602000, 0.99);

-- Add Jazz
INSERT INTO artist (artist_id, name) VALUES (54, 'Miles Davis');
INSERT INTO album (album_id, title, artist_id) VALUES (45, 'Kind of Blue', 54);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (76, 'So What', 45, 1, 2, 'Miles Davis', 561000, 18320000, 0.99),
    (77, 'Freddie Freeloader', 45, 1, 2, 'Miles Davis', 576000, 18867000, 0.99),
    (78, 'Blue in Green', 45, 1, 2, 'Miles Davis', 327000, 10680000, 0.99),
    (79, 'All Blues', 45, 1, 2, 'Miles Davis', 693000, 22550000, 0.99),
    (80, 'Flamenco Sketches', 45, 1, 2, 'Miles Davis', 566000, 18480000, 0.99);

-- Add Classical
INSERT INTO artist (artist_id, name) VALUES (55, 'Ludwig van Beethoven');
INSERT INTO album (album_id, title, artist_id) VALUES (46, 'Beethoven: Symphonies Nos. 5 & 7', 55);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (81, 'Symphony No. 5 in C Minor, Op. 67: I. Allegro con brio', 46, 1, 5, 'Ludwig van Beethoven', 435000, 14151000, 0.99),
    (82, 'Symphony No. 5 in C Minor, Op. 67: II. Andante con moto', 46, 1, 5, 'Ludwig van Beethoven', 600000, 19568000, 0.99),
    (83, 'Symphony No. 5 in C Minor, Op. 67: III. Scherzo. Allegro', 46, 1, 5, 'Ludwig van Beethoven', 308000, 10026000, 0.99),
    (84, 'Symphony No. 5 in C Minor, Op. 67: IV. Allegro', 46, 1, 5, 'Ludwig van Beethoven', 528000, 17153000, 0.99),
    (85, 'Symphony No. 7 in A Major, Op. 92: I. Poco sostenuto - Vivace', 46, 1, 5, 'Ludwig van Beethoven', 786000, 25594000, 0.99);

-- Add soundtrack
INSERT INTO artist (artist_id, name) VALUES (56, 'Hans Zimmer');
INSERT INTO album (album_id, title, artist_id) VALUES (47, 'Inception (Music from the Motion Picture)', 56);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (86, 'Time', 47, 1, 10, 'Hans Zimmer', 275000, 9023000, 0.99),
    (87, 'Dream Is Collapsing', 47, 1, 10, 'Hans Zimmer', 142000, 4641000, 0.99),
    (88, 'Mombasa', 47, 1, 10, 'Hans Zimmer', 242000, 7895000, 0.99),
    (89, 'We Built Our Own World', 47, 1, 10, 'Hans Zimmer', 133000, 4347000, 0.99),
    (90, 'Dream Within A Dream', 47, 1, 10, 'Hans Zimmer', 285000, 9289000, 0.99);

-- Add some popular singles
INSERT INTO artist (artist_id, name) VALUES (57, 'Michael Jackson');
INSERT INTO album (album_id, title, artist_id) VALUES (48, 'Thriller', 57);

INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (91, 'Thriller', 48, 1, 14, 'Michael Jackson', 357000, 11680000, 0.99),
    (92, 'Billie Jean', 48, 1, 14, 'Michael Jackson', 294000, 9593000, 0.99),
    (93, 'Beat It', 48, 1, 14, 'Michael Jackson', 258000, 8391000, 0.99),
    (94, 'Smooth Criminal', 48, 1, 14, 'Michael Jackson', 258000, 8360000, 0.99),
    (95, 'Black or White', 48, 1, 14, 'Michael Jackson', 222000, 7251000, 0.99);

-- Add some tracks with identical composers for specific queries
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
    (96, 'The Show Must Go On', 31, 1, 1, 'Queen', 271000, 8868000, 0.99),
    (97, 'I Want It All', 31, 1, 1, 'Queen', 241000, 7876000, 0.99),
    (98, 'Innuendo', 31, 1, 1, 'Queen', 387000, 12664000, 0.99),
    (99, 'Who Wants To Live Forever', 31, 1, 1, 'Queen', 315000, 10267000, 0.99),
    (100, 'Flash', 31, 1, 1, 'Queen', 171000, 5568000, 0.99);

-- Update related tables for the new tracks

-- Update invoice_lines with new tracks
INSERT INTO invoice_line (invoice_line_id, invoice_id, track_id, unit_price, quantity)
VALUES 
    (51, 1, 31, 0.99, 1),
    (52, 2, 32, 0.99, 1),
    (53, 3, 33, 0.99, 1),
    (54, 4, 34, 0.99, 1),
    (55, 5, 35, 0.99, 1),
    (56, 6, 36, 0.99, 1),
    (57, 7, 37, 0.99, 1),
    (58, 8, 38, 0.99, 1),
    (59, 9, 39, 0.99, 1),
    (60, 10, 40, 0.99, 1);

-- Update playlists with new tracks
INSERT INTO playlist_track (playlist_id, track_id)
VALUES 
    (1, 31), (1, 32), (1, 33), (1, 34), (1, 35),
    (5, 31), (5, 32), (5, 33), (5, 34), (5, 35),
    (5, 36), (5, 37), (5, 38), (5, 39), (5, 40),
    (5, 41), (5, 42), (5, 43), (5, 44), (5, 45),
    (5, 46), (5, 47), (5, 48), (5, 49), (5, 50),
    (1, 51), (1, 52), (1, 53), (1, 54), (1, 55),
    (8, 51), (8, 52), (8, 53), (8, 54), (8, 55);
