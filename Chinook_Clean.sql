-- Simple Chinook Database - Clean UTF-8 Version
-- This is a simplified version without encoding issues

-- Drop existing database connection commands that cause errors
-- CREATE DATABASE chinook;
-- \c chinook;

-- Create tables
CREATE TABLE IF NOT EXISTS genre (
    genre_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS media_type (
    media_type_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS artist (
    artist_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS album (
    album_id INTEGER PRIMARY KEY,
    title VARCHAR(160),
    artist_id INTEGER,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS track (
    track_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    album_id INTEGER,
    media_type_id INTEGER,
    genre_id INTEGER,
    composer VARCHAR(220),
    milliseconds INTEGER,
    bytes INTEGER,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (album_id) REFERENCES album(album_id),
    FOREIGN KEY (media_type_id) REFERENCES media_type(media_type_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS employee (
    employee_id INTEGER PRIMARY KEY,
    last_name VARCHAR(20),
    first_name VARCHAR(20),
    title VARCHAR(30),
    reports_to INTEGER,
    birth_date TIMESTAMP,
    hire_date TIMESTAMP,
    address VARCHAR(70),
    city VARCHAR(40),
    state VARCHAR(40),
    country VARCHAR(40),
    postal_code VARCHAR(10),
    phone VARCHAR(24),
    fax VARCHAR(24),
    email VARCHAR(60),
    FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

CREATE TABLE IF NOT EXISTS customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(20),
    company VARCHAR(80),
    address VARCHAR(70),
    city VARCHAR(40),
    state VARCHAR(40),
    country VARCHAR(40),
    postal_code VARCHAR(10),
    phone VARCHAR(24),
    fax VARCHAR(24),
    email VARCHAR(60),
    support_rep_id INTEGER,
    FOREIGN KEY (support_rep_id) REFERENCES employee(employee_id)
);

CREATE TABLE IF NOT EXISTS invoice (
    invoice_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    invoice_date TIMESTAMP,
    billing_address VARCHAR(70),
    billing_city VARCHAR(40),
    billing_state VARCHAR(40),
    billing_country VARCHAR(40),
    billing_postal_code VARCHAR(10),
    total DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS invoice_line (
    invoice_line_id INTEGER PRIMARY KEY,
    invoice_id INTEGER,
    track_id INTEGER,
    unit_price DECIMAL(10,2),
    quantity INTEGER,
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);

CREATE TABLE IF NOT EXISTS playlist (
    playlist_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS playlist_track (
    playlist_id INTEGER,
    track_id INTEGER,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);

-- Insert sample data in correct order (respecting foreign keys)

-- Genres
INSERT INTO genre (genre_id, name) VALUES
    (1, 'Rock'),
    (2, 'Jazz'),
    (3, 'Metal'),
    (4, 'Alternative & Punk'),
    (5, 'Classical');

-- Media Types
INSERT INTO media_type (media_type_id, name) VALUES
    (1, 'MPEG audio file'),
    (2, 'Protected AAC audio file'),
    (3, 'Protected MPEG-4 video file'),
    (4, 'Purchased AAC audio file'),
    (5, 'AAC audio file');

-- Artists (insert first)
INSERT INTO artist (artist_id, name) VALUES
    (1, 'AC/DC'),
    (2, 'Accept'),
    (3, 'Aerosmith'),
    (4, 'Alanis Morissette'),
    (5, 'Alice In Chains'),
    (6, 'Antonio Vivaldi'),
    (7, 'Apocalyptica'),
    (8, 'Audioslave'),
    (9, 'BackBeat'),
    (10, 'The Beatles');

-- Albums (insert after artists)
INSERT INTO album (album_id, title, artist_id) VALUES
    (1, 'For Those About To Rock We Salute You', 1),
    (2, 'Balls to the Wall', 2),
    (3, 'Restless and Wild', 2),
    (4, 'Let There Be Rock', 1),
    (5, 'Big Ones', 3),
    (6, 'Jagged Little Pill', 4),
    (7, 'Facelift', 5),
    (8, 'The Four Seasons', 6),
    (9, 'Plays Metallica By Four Cellos', 7),
    (10, 'Audioslave', 8);

-- Tracks (insert after albums, media_types, and genres)
INSERT INTO track (track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES
    (1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99),
    (2, 'Balls to the Wall', 2, 2, 1, 'U. Dirkschneider, W. Hoffmann, H. Frank, P. Baltes, S. Kaufmann, G. Hoffmann', 342562, 5510424, 0.99),
    (3, 'Fast As a Shark', 3, 2, 1, 'F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman', 230619, 3990994, 0.99),
    (4, 'Restless and Wild', 3, 2, 1, 'F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman', 252051, 4331779, 0.99),
    (5, 'Princess of the Dawn', 3, 2, 1, 'Deaffy & R.A. Smith-Diesel', 375418, 6290521, 0.99),
    (6, 'Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99),
    (7, 'Lets Get It Up', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 233926, 7636561, 0.99),
    (8, 'Inject The Venom', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 210834, 6852860, 0.99),
    (9, 'Snowballed', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 203102, 6599424, 0.99),
    (10, 'Evil Walks', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99);

-- Employees
INSERT INTO employee (employee_id, last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES
    (1, 'Adams', 'Andrew', 'General Manager', NULL, '1962-02-18 00:00:00', '2002-08-14 00:00:00', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com'),
    (2, 'Edwards', 'Nancy', 'Sales Manager', 1, '1958-12-08 00:00:00', '2002-05-01 00:00:00', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com'),
    (3, 'Peacock', 'Jane', 'Sales Support Agent', 2, '1973-08-29 00:00:00', '2002-04-01 00:00:00', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com');

-- Customers
INSERT INTO customer (customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES
    (1, 'Luis', 'Goncalves', 'Embraer - Empresa Brasileira de Aeronautica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'Sao Jose dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
    (2, 'Leonie', 'Kohler', NULL, 'Theodor-Heuss-Strasse 34', 'Stuttgart', NULL, 'Germany', '70174', '+49 0711 2842222', NULL, 'leonekohler@surfeu.de', 3),
    (3, 'Francois', 'Tremblay', NULL, '1498 rue Belanger', 'Montreal', 'QC', 'Canada', 'H2G 1A7', '+1 (514) 721-4711', NULL, 'ftremblay@gmail.com', 3);

-- Invoices
INSERT INTO invoice (invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total) VALUES
    (1, 2, '2009-01-01 00:00:00', 'Theodor-Heuss-Strasse 34', 'Stuttgart', NULL, 'Germany', '70174', 1.98),
    (2, 3, '2009-01-02 00:00:00', '1498 rue Belanger', 'Montreal', 'QC', 'Canada', 'H2G 1A7', 3.96),
    (3, 1, '2009-01-03 00:00:00', 'Av. Brigadeiro Faria Lima, 2170', 'Sao Jose dos Campos', 'SP', 'Brazil', '12227-000', 5.94);

-- Invoice Lines
INSERT INTO invoice_line (invoice_line_id, invoice_id, track_id, unit_price, quantity) VALUES
    (1, 1, 2, 0.99, 1),
    (2, 1, 4, 0.99, 1),
    (3, 2, 6, 0.99, 1),
    (4, 2, 8, 0.99, 1),
    (5, 2, 10, 0.99, 1),
    (6, 3, 1, 0.99, 1),
    (7, 3, 3, 0.99, 1),
    (8, 3, 5, 0.99, 1),
    (9, 3, 7, 0.99, 1),
    (10, 3, 9, 0.99, 1);

-- Playlists
INSERT INTO playlist (playlist_id, name) VALUES
    (1, 'Music'),
    (2, 'Movies'),
    (3, 'TV Shows'),
    (4, 'Audiobooks'),
    (5, 'Rock Music');

-- Playlist Tracks
INSERT INTO playlist_track (playlist_id, track_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (5, 1),
    (5, 3),
    (5, 4),
    (5, 6),
    (5, 7),
    (5, 8),
    (5, 9);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS album_artist_id_idx ON album(artist_id);
CREATE INDEX IF NOT EXISTS track_album_id_idx ON track(album_id);
CREATE INDEX IF NOT EXISTS track_media_type_id_idx ON track(media_type_id);
CREATE INDEX IF NOT EXISTS track_genre_id_idx ON track(genre_id);
CREATE INDEX IF NOT EXISTS invoice_customer_id_idx ON invoice(customer_id);
CREATE INDEX IF NOT EXISTS invoice_line_invoice_id_idx ON invoice_line(invoice_id);
CREATE INDEX IF NOT EXISTS invoice_line_track_id_idx ON invoice_line(track_id);
CREATE INDEX IF NOT EXISTS customer_support_rep_id_idx ON customer(support_rep_id);
CREATE INDEX IF NOT EXISTS employee_reports_to_idx ON employee(reports_to);
CREATE INDEX IF NOT EXISTS playlist_track_playlist_id_idx ON playlist_track(playlist_id);
CREATE INDEX IF NOT EXISTS playlist_track_track_id_idx ON playlist_track(track_id);
