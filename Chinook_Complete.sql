-- Complete Chinook Database with Full Data
-- This version has all tables populated with proper relationships

-- Drop existing tables if they exist
DROP TABLE IF EXISTS playlist_track CASCADE;
DROP TABLE IF EXISTS invoice_line CASCADE;
DROP TABLE IF EXISTS invoice CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS track CASCADE;
DROP TABLE IF EXISTS playlist CASCADE;
DROP TABLE IF EXISTS album CASCADE;
DROP TABLE IF EXISTS artist CASCADE;
DROP TABLE IF EXISTS media_type CASCADE;
DROP TABLE IF EXISTS genre CASCADE;

-- Create tables in dependency order
CREATE TABLE genre (
    genre_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE media_type (
    media_type_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE artist (
    artist_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE album (
    album_id INTEGER PRIMARY KEY,
    title VARCHAR(160),
    artist_id INTEGER,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE track (
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

CREATE TABLE employee (
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

CREATE TABLE customer (
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

CREATE TABLE invoice (
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

CREATE TABLE invoice_line (
    invoice_line_id INTEGER PRIMARY KEY,
    invoice_id INTEGER,
    track_id INTEGER,
    unit_price DECIMAL(10,2),
    quantity INTEGER,
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);

CREATE TABLE playlist (
    playlist_id INTEGER PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE playlist_track (
    playlist_id INTEGER,
    track_id INTEGER,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);

-- Insert data in correct dependency order

-- 1. Genres (independent table)
INSERT INTO genre (genre_id, name) VALUES
    (1, 'Rock'),
    (2, 'Jazz'),
    (3, 'Metal'),
    (4, 'Alternative & Punk'),
    (5, 'Classical'),
    (6, 'Blues'),
    (7, 'Latin'),
    (8, 'Reggae'),
    (9, 'Pop'),
    (10, 'Soundtrack'),
    (11, 'Bossa Nova'),
    (12, 'Easy Listening'),
    (13, 'Heavy Metal'),
    (14, 'R&B/Soul'),
    (15, 'Electronica/Dance'),
    (16, 'World'),
    (17, 'Hip Hop/Rap'),
    (18, 'Science Fiction'),
    (19, 'TV Shows'),
    (20, 'Sci Fi & Fantasy'),
    (21, 'Drama'),
    (22, 'Comedy'),
    (23, 'Alternative'),
    (24, 'Classical'),
    (25, 'Opera');

-- 2. Media Types (independent table)
INSERT INTO media_type (media_type_id, name) VALUES
    (1, 'MPEG audio file'),
    (2, 'Protected AAC audio file'),
    (3, 'Protected MPEG-4 video file'),
    (4, 'Purchased AAC audio file'),
    (5, 'AAC audio file');

-- 3. Artists (independent table)
INSERT INTO artist (artist_id, name) VALUES
    (1, 'AC/DC'),
    (2, 'Accept'),
    (3, 'Aerosmith'),
    (4, 'Alanis Morissette'),
    (5, 'Alice In Chains'),
    (6, 'Antonio Carlos Jobim'),
    (7, 'Apocalyptica'),
    (8, 'Audioslave'),
    (9, 'BackBeat'),
    (10, 'The Beatles'),
    (11, 'Billy Cobham'),
    (12, 'Black Label Society'),
    (13, 'Black Sabbath'),
    (14, 'Body Count'),
    (15, 'Bruce Dickinson'),
    (16, 'Buddy Guy'),
    (17, 'Caetano Veloso'),
    (18, 'Chico Science & Nacao Zumbi'),
    (19, 'Cidade Negra'),
    (20, 'Claudio Zoli'),
    (21, 'Various Artists'),
    (22, 'Led Zeppelin'),
    (23, 'Frank Zappa & Captain Beefheart'),
    (24, 'Marcos Valle'),
    (25, 'Milton Nascimento & Bebeto'),
    (26, 'Azymuth'),
    (27, 'Gilberto Gil'),
    (28, 'Joao Gilberto'),
    (29, 'Bebel Gilberto'),
    (30, 'Jorge Vercilo'),
    (31, 'Baby Consuelo'),
    (32, 'Ney Matogrosso'),
    (33, 'Luiz Melodia'),
    (34, 'Nando Reis'),
    (35, 'Pedro Luis & A Parede'),
    (36, 'O Rappa'),
    (37, 'Ed Motta'),
    (38, 'Banda Black Rio'),
    (39, 'Fernanda Porto'),
    (40, 'Os Cariocas'),
    (41, 'Elis Regina'),
    (42, 'Milton Nascimento'),
    (43, 'A Cor Do Som'),
    (44, 'Kid Abelha'),
    (45, 'Sandra De Sa'),
    (46, 'Jorge Ben'),
    (47, 'Hermeto Pascoal'),
    (48, 'Barao Vermelho'),
    (49, 'Metallica'),
    (50, 'Queen');

-- 4. Albums (depends on artists)
INSERT INTO album (album_id, title, artist_id) VALUES
    (1, 'For Those About To Rock We Salute You', 1),
    (2, 'Balls to the Wall', 2),
    (3, 'Restless and Wild', 2),
    (4, 'Let There Be Rock', 1),
    (5, 'Big Ones', 3),
    (6, 'Jagged Little Pill', 4),
    (7, 'Facelift', 5),
    (8, 'Warner 25 Anos', 6),
    (9, 'Plays Metallica By Four Cellos', 7),
    (10, 'Audioslave', 8),
    (11, 'Out Of Exile', 8),
    (12, 'BackBeat Soundtrack', 9),
    (13, 'The Best Of Billy Cobham', 11),
    (14, 'Alcohol Fueled Brewtality Live! [Disc 1]', 12),
    (15, 'Alcohol Fueled Brewtality Live! [Disc 2]', 12),
    (16, 'Black Sabbath', 13),
    (17, 'Black Sabbath Vol. 4 (Remaster)', 13),
    (18, 'Body Count', 14),
    (19, 'Chemical Wedding', 15),
    (20, 'The Best Of Buddy Guy - The Millenium Collection', 16),
    (21, 'Prenda Minha', 17),
    (22, 'Sozinho Remix Ao Vivo', 18),
    (23, 'Cidade Negra - Hits', 19),
    (24, 'Acustico Ao Vivo', 20),
    (25, 'Acustico MTV [Live]', 19),
    (26, 'Acustico MTV [Live]', 19),
    (27, 'Quanta Gente Veio Ver: Bebe Consuelo Ao Vivo', 31),
    (28, 'The Song Remains The Same (Remaster)', 22),
    (29, 'A TwoFer', 23),
    (30, 'Mais Do Mesmo', 35),
    (31, 'Greatest Hits I', 50),
    (32, 'Greatest Hits II', 50),
    (33, 'News Of The World', 50),
    (34, 'Load', 49),
    (35, 'ReLoad', 49),
    (36, 'Master Of Puppets', 49),
    (37, 'And Justice For All', 49),
    (38, 'Kill Em All', 49),
    (39, 'Ride The Lightning', 49),
    (40, 'The Black Album', 49);

-- 5. Tracks (depends on albums, media_types, and genres)
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
    (10, 'Evil Walks', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99),
    (11, 'C.O.D.', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 199836, 6566314, 0.99),
    (12, 'Breaking The Rules', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8596840, 0.99),
    (13, 'Night Of The Long Knives', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6706347, 0.99),
    (14, 'Spellbound', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 270863, 8817038, 0.99),
    (15, 'Go Down', 4, 1, 1, 'AC/DC', 331180, 10847611, 0.99),
    (16, 'Dog Eat Dog', 4, 1, 1, 'AC/DC', 215196, 7032162, 0.99),
    (17, 'Let There Be Rock', 4, 1, 1, 'AC/DC', 366654, 12021261, 0.99),
    (18, 'Bad Boy Boogie', 4, 1, 1, 'AC/DC', 267728, 8776140, 0.99),
    (19, 'Problem Child', 4, 1, 1, 'AC/DC', 325926, 10617116, 0.99),
    (20, 'Overdose', 4, 1, 1, 'AC/DC', 369529, 12066294, 0.99),
    (21, 'Hell Aint A Bad Place To Be', 4, 1, 1, 'AC/DC', 254334, 8331286, 0.99),
    (22, 'Whole Lotta Rosie', 4, 1, 1, 'AC/DC', 323761, 10547154, 0.99),
    (23, 'Walk On Water', 5, 1, 1, 'Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw', 295680, 9719579, 0.99),
    (24, 'Love In An Elevator', 5, 1, 1, 'Steven Tyler, Joe Perry', 321357, 10552051, 0.99),
    (25, 'Rag Doll', 5, 1, 1, 'Steven Tyler, Joe Perry, Jim Vallance, Holly Knight', 264698, 8675345, 0.99),
    (26, 'What It Takes', 5, 1, 1, 'Steven Tyler, Joe Perry, Desmond Child', 310622, 10144730, 0.99),
    (27, 'Dude (Looks Like A Lady)', 5, 1, 1, 'Steven Tyler, Joe Perry, Desmond Child', 264698, 8672574, 0.99),
    (28, 'Janie Is Got A Gun', 5, 1, 1, 'Steven Tyler, Tom Hamilton', 330736, 10869391, 0.99),
    (29, 'Cryin', 5, 1, 1, 'Steven Tyler, Joe Perry, Taylor Rhodes', 309225, 10136119, 0.99),
    (30, 'Amazing', 5, 1, 1, 'Steven Tyler, Richie Supa', 356519, 11616195, 0.99);

-- 6. Employees (self-referencing, insert managers first)
INSERT INTO employee (employee_id, last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES
    (1, 'Adams', 'Andrew', 'General Manager', NULL, '1962-02-18 00:00:00', '2002-08-14 00:00:00', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com'),
    (2, 'Edwards', 'Nancy', 'Sales Manager', 1, '1958-12-08 00:00:00', '2002-05-01 00:00:00', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com'),
    (3, 'Peacock', 'Jane', 'Sales Support Agent', 2, '1973-08-29 00:00:00', '2002-04-01 00:00:00', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com'),
    (4, 'Park', 'Margaret', 'Sales Support Agent', 2, '1947-09-19 00:00:00', '2003-05-03 00:00:00', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com'),
    (5, 'Johnson', 'Steve', 'Sales Support Agent', 2, '1965-03-03 00:00:00', '2003-10-17 00:00:00', '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '1 (780) 836-9987', '1 (780) 836-9543', 'steve@chinookcorp.com'),
    (6, 'Mitchell', 'Michael', 'IT Manager', 1, '1973-07-01 00:00:00', '2003-10-17 00:00:00', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com'),
    (7, 'King', 'Robert', 'IT Staff', 6, '1970-05-29 00:00:00', '2004-01-02 00:00:00', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com'),
    (8, 'Callahan', 'Laura', 'IT Staff', 6, '1968-01-09 00:00:00', '2004-03-04 00:00:00', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com');

-- 7. Customers (depends on employees)
INSERT INTO customer (customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES
    (1, 'Luis', 'Goncalves', 'Embraer - Empresa Brasileira de Aeronautica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'Sao Jose dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
    (2, 'Leonie', 'Kohler', NULL, 'Theodor-Heuss-Strasse 34', 'Stuttgart', NULL, 'Germany', '70174', '+49 0711 2842222', NULL, 'leonekohler@surfeu.de', 5),
    (3, 'Francois', 'Tremblay', NULL, '1498 rue Belanger', 'Montreal', 'QC', 'Canada', 'H2G 1A7', '+1 (514) 721-4711', NULL, 'ftremblay@gmail.com', 3),
    (4, 'Bjorn', 'Hansen', NULL, 'Ullevalsveien 14', 'Oslo', NULL, 'Norway', '0171', '+47 22 44 22 22', NULL, 'bjorn.hansen@yahoo.no', 4),
    (5, 'Frantisek', 'Wichterlova', 'JetBrains s.r.o.', 'Klanova 9/506', 'Prague', NULL, 'Czech Republic', '14700', '+420 2 4172 5555', '+420 2 4172 5555', 'frantisekw@jetbrains.com', 4),
    (6, 'Helena', 'Holy', NULL, 'Rilska 3174/6', 'Prague', NULL, 'Czech Republic', '14300', '+420 2 4177 0449', NULL, 'hholy@gmail.com', 5),
    (7, 'Astrid', 'Gruber', NULL, 'Rotenturmstrasse 4, 1010 Innere Stadt', 'Vienne', NULL, 'Austria', '1010', '+43 01 5134505', NULL, 'astrid.gruber@apple.at', 5),
    (8, 'Daan', 'Peeters', NULL, 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', '+32 02 219 03 03', NULL, 'daan_peeters@apple.be', 4),
    (9, 'Kara', 'Nielsen', NULL, 'Sønder Boulevard 51', 'Copenhagen', NULL, 'Denmark', '1720', '+453 3331 9991', NULL, 'kara.nielsen@jubii.dk', 4),
    (10, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'Sao Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4),
    (11, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'Sao Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5),
    (12, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3),
    (13, 'Fernanda', 'Ramos', NULL, 'Qe 7 Bloco G', 'Brasilia', 'DF', 'Brazil', '71020-677', '+55 (61) 3363-5547', '+55 (61) 3363-7855', 'fernadaramos4@uol.com.br', 4),
    (14, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5),
    (15, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3),
    (16, 'Frank', 'Harris', 'Google Inc.', '1600 Amphitheatre Parkway', 'Mountain View', 'CA', 'USA', '94043-1351', '+1 (650) 253-0000', '+1 (650) 253-0000', 'fharris@google.com', 4),
    (17, 'Jack', 'Smith', 'Microsoft Corporation', '1 Microsoft Way', 'Redmond', 'WA', 'USA', '98052-8300', '+1 (425) 882-8080', '+1 (425) 882-8081', 'jacksmith@microsoft.com', 5),
    (18, 'Michelle', 'Brooks', NULL, '627 Broadway', 'New York', 'NY', 'USA', '10012-2612', '+1 (212) 221-3546', '+1 (212) 221-4679', 'michelleb@aol.com', 3),
    (19, 'Tim', 'Goyer', 'Apple Inc.', '1 Infinite Loop', 'Cupertino', 'CA', 'USA', '95014', '+1 (408) 996-1010', '+1 (408) 996-1011', 'tgoyer@apple.com', 3),
    (20, 'Dan', 'Miller', NULL, '541 Del Medio Avenue', 'Mountain View', 'CA', 'USA', '94040-111', '+1 (650) 644-3358', NULL, 'dmiller@comcast.com', 4);

-- 8. Invoices (depends on customers)
INSERT INTO invoice (invoice_id, customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total) VALUES
    (1, 2, '2009-01-01 00:00:00', 'Theodor-Heuss-Strasse 34', 'Stuttgart', NULL, 'Germany', '70174', 1.98),
    (2, 4, '2009-01-02 00:00:00', 'Ullevalsveien 14', 'Oslo', NULL, 'Norway', '0171', 3.96),
    (3, 8, '2009-01-03 00:00:00', 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', 5.94),
    (4, 14, '2009-01-06 00:00:00', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', 8.91),
    (5, 23, '2009-01-11 00:00:00', '69 Salem Street', 'Boston', 'MA', 'USA', '2113', 13.86),
    (6, 37, '2009-01-19 00:00:00', 'Berger Straße 10', 'Frankfurt', NULL, 'Germany', '60316', 0.99),
    (7, 38, '2009-02-01 00:00:00', 'Barbarossastraße 19', 'Berlin', NULL, 'Germany', '10779', 1.98),
    (8, 40, '2009-02-01 00:00:00', '8, Rue Hanovre', 'Paris', NULL, 'France', '75002', 1.98),
    (9, 42, '2009-02-02 00:00:00', '9, Place Louis Barthou', 'Bordeaux', NULL, 'France', '33000', 3.96),
    (10, 46, '2009-02-03 00:00:00', '3 Chatham Street', 'Dublin', 'Dublin', 'Ireland', NULL, 5.94),
    (11, 52, '2009-02-06 00:00:00', '202 Hoxton Street', 'London', NULL, 'United Kingdom', 'N1 5LH', 8.91),
    (12, 2, '2009-02-11 00:00:00', 'Theodor-Heuss-Strasse 34', 'Stuttgart', NULL, 'Germany', '70174', 13.86),
    (13, 16, '2009-02-19 00:00:00', '1600 Amphitheatre Parkway', 'Mountain View', 'CA', 'USA', '94043-1351', 0.99),
    (14, 17, '2009-03-04 00:00:00', '1 Microsoft Way', 'Redmond', 'WA', 'USA', '98052-8300', 1.98),
    (15, 19, '2009-03-04 00:00:00', '1 Infinite Loop', 'Cupertino', 'CA', 'USA', '95014', 1.98),
    (16, 21, '2009-03-05 00:00:00', '801 W 4th Street', 'Reno', 'NV', 'USA', '89503', 3.96),
    (17, 25, '2009-03-06 00:00:00', '319 N. Frances Street', 'Madison', 'WI', 'USA', '53703', 5.94),
    (18, 31, '2009-03-09 00:00:00', '194A Chain Lake Drive', 'Halifax', 'NS', 'Canada', 'B3S 1C5', 8.91),
    (19, 40, '2009-03-14 00:00:00', '8, Rue Hanovre', 'Paris', NULL, 'France', '75002', 13.86),
    (20, 54, '2009-03-22 00:00:00', '110 Raeburn Pl', 'Edinburgh', NULL, 'United Kingdom', 'EH4 1HH', 0.99);

-- 9. Invoice Lines (depends on invoices and tracks)
INSERT INTO invoice_line (invoice_line_id, invoice_id, track_id, unit_price, quantity) VALUES
    (1, 1, 2, 0.99, 1),
    (2, 1, 4, 0.99, 1),
    (3, 2, 6, 0.99, 1),
    (4, 2, 8, 0.99, 1),
    (5, 2, 10, 0.99, 1),
    (6, 2, 12, 0.99, 1),
    (7, 3, 16, 0.99, 1),
    (8, 3, 20, 0.99, 1),
    (9, 3, 24, 0.99, 1),
    (10, 3, 28, 0.99, 1),
    (11, 3, 1, 0.99, 1),
    (12, 3, 5, 0.99, 1),
    (13, 4, 9, 0.99, 1),
    (14, 4, 13, 0.99, 1),
    (15, 4, 17, 0.99, 1),
    (16, 4, 21, 0.99, 1),
    (17, 4, 25, 0.99, 1),
    (18, 4, 29, 0.99, 1),
    (19, 4, 3, 0.99, 1),
    (20, 4, 7, 0.99, 1),
    (21, 4, 11, 0.99, 1),
    (22, 5, 15, 0.99, 1),
    (23, 5, 19, 0.99, 1),
    (24, 5, 23, 0.99, 1),
    (25, 5, 27, 0.99, 1),
    (26, 5, 2, 0.99, 1),
    (27, 5, 6, 0.99, 1),
    (28, 5, 10, 0.99, 1),
    (29, 5, 14, 0.99, 1),
    (30, 5, 18, 0.99, 1),
    (31, 5, 22, 0.99, 1),
    (32, 5, 26, 0.99, 1),
    (33, 5, 30, 0.99, 1),
    (34, 5, 4, 0.99, 1),
    (35, 5, 8, 0.99, 1),
    (36, 6, 12, 0.99, 1),
    (37, 7, 16, 0.99, 1),
    (38, 7, 20, 0.99, 1),
    (39, 8, 24, 0.99, 1),
    (40, 8, 28, 0.99, 1),
    (41, 9, 1, 0.99, 1),
    (42, 9, 5, 0.99, 1),
    (43, 9, 9, 0.99, 1),
    (44, 9, 13, 0.99, 1),
    (45, 10, 17, 0.99, 1),
    (46, 10, 21, 0.99, 1),
    (47, 10, 25, 0.99, 1),
    (48, 10, 29, 0.99, 1),
    (49, 10, 3, 0.99, 1),
    (50, 10, 7, 0.99, 1);

-- 10. Playlists (independent table)
INSERT INTO playlist (playlist_id, name) VALUES
    (1, 'Music'),
    (2, 'Movies'),
    (3, 'TV Shows'),
    (4, 'Audiobooks'),
    (5, 'Rock Music'),
    (6, 'Classical Music'),
    (7, 'Jazz'),
    (8, 'Heavy Metal'),
    (9, 'Brazilian Music'),
    (10, 'Alternative'),
    (11, 'Pop'),
    (12, 'Blues'),
    (13, 'Latin'),
    (14, 'Reggae'),
    (15, 'Electronica/Dance'),
    (16, 'World Music'),
    (17, 'Hip Hop/Rap'),
    (18, 'Grunge');

-- 11. Playlist Tracks (depends on playlists and tracks)
INSERT INTO playlist_track (playlist_id, track_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
    (1, 11), (1, 12), (1, 13), (1, 14), (1, 15),
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5),
    (5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
    (5, 15), (5, 16), (5, 17), (5, 18), (5, 19),
    (8, 1), (8, 2), (8, 3), (8, 4), (8, 5),
    (8, 6), (8, 7), (8, 8), (8, 9), (8, 10),
    (2, 11), (2, 12), (2, 13), (2, 14), (2, 15),
    (3, 16), (3, 17), (3, 18), (3, 19), (3, 20),
    (4, 21), (4, 22), (4, 23), (4, 24), (4, 25),
    (6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
    (7, 1), (7, 5), (7, 10), (7, 15), (7, 20),
    (9, 25), (9, 26), (9, 27), (9, 28), (9, 29),
    (10, 3), (10, 7), (10, 11), (10, 15), (10, 19),
    (11, 2), (11, 6), (11, 10), (11, 14), (11, 18),
    (12, 4), (12, 8), (12, 12), (12, 16), (12, 20),
    (13, 1), (13, 9), (13, 17), (13, 25), (13, 30),
    (14, 5), (14, 13), (14, 21), (14, 29), (14, 30),
    (15, 7), (15, 15), (15, 23), (15, 30), (15, 1),
    (16, 9), (16, 17), (16, 25), (16, 2), (16, 10),
    (17, 11), (17, 19), (17, 27), (17, 4), (17, 12),
    (18, 13), (18, 21), (18, 29), (18, 6), (18, 14);

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

-- Test queries to verify relationships work
-- These are some sample queries you can run to test the database:

/*
-- Count records in each table
SELECT 'genre' as table_name, COUNT(*) as record_count FROM genre
UNION ALL SELECT 'media_type', COUNT(*) FROM media_type
UNION ALL SELECT 'artist', COUNT(*) FROM artist
UNION ALL SELECT 'album', COUNT(*) FROM album
UNION ALL SELECT 'track', COUNT(*) FROM track
UNION ALL SELECT 'employee', COUNT(*) FROM employee
UNION ALL SELECT 'customer', COUNT(*) FROM customer
UNION ALL SELECT 'invoice', COUNT(*) FROM invoice
UNION ALL SELECT 'invoice_line', COUNT(*) FROM invoice_line
UNION ALL SELECT 'playlist', COUNT(*) FROM playlist
UNION ALL SELECT 'playlist_track', COUNT(*) FROM playlist_track
ORDER BY table_name;

-- Test relationships - Albums with their artists
SELECT a.title, ar.name as artist_name 
FROM album a 
JOIN artist ar ON a.artist_id = ar.artist_id 
LIMIT 10;

-- Test relationships - Tracks with albums and artists
SELECT t.name as track_name, a.title as album_title, ar.name as artist_name, g.name as genre
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
JOIN genre g ON t.genre_id = g.genre_id
LIMIT 10;

-- Test relationships - Invoice totals by customer
SELECT c.first_name, c.last_name, COUNT(i.invoice_id) as total_invoices, SUM(i.total) as total_spent
FROM customer c
LEFT JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

-- Test relationships - Employee hierarchy
SELECT e1.first_name || ' ' || e1.last_name as employee,
       e1.title,
       e2.first_name || ' ' || e2.last_name as manager
FROM employee e1
LEFT JOIN employee e2 ON e1.reports_to = e2.employee_id
ORDER BY e1.employee_id;
*/
