DROP DATABASE IF EXISTS music;
CREATE DATABASE music;

USE music;
-- this is a comment
/*
This is also a comment
*/

create table poor_artist (
    id INT(11),
    name TEXT,
    date DATE,
    address1 TEXT,
    city TEXT,
    state TEXT,
    phone TINYTEXT,
    member1 TEXT,
    member2 TEXT,
    billing_address1 TEXT,
    billing_city TEXT,
    billing_state TEXT
);

create table artist (
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    uuid VARCHAR(36) NOT NULL,
    name TEXT NOT NULL,
    year_formed INT(4) NOT NULL DEFAULT 2000
);

INSERT INTO artist (uuid, name, year_formed)
VALUES
    (UUID(), 'Tool', 1990),
    (UUID(), 'Vampire Weekend', 2006),
    (UUID(), 'K.Flay', 1985),
    (UUID(), 'Skillet', 1996),
    (UUID(), 'That New Band', 2019);

CREATE TABLE album (
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    uuid VARCHAR(36) NOT NULL,
    artist_id INT(11) NOT NULL,
    name TEXT NOT NULL,
    release_date DATE NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(id) ON DELETE CASCADE
);
INSERT INTO album (uuid, artist_id, name, release_date)
VALUES
    (UUID(), (SELECT id FROM artist where name = 'Tool'), 'Fear Inoculum', 20190830),
    (UUID(), (SELECT id FROM artist where name = 'Vampire Weekend'), 'Father of the Bride', 20190503),
    (UUID(), (SELECT id FROM artist where name = 'K.Flay'), 'Solutions', 20190503),
    (UUID(), (SELECT id FROM artist where name = 'Skillet'), 'Victorious', 20190802);

CREATE TABLE song (
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    uuid VARCHAR(36) NOT NULL,
    album_id INT(11) NOT NULL,
    title TEXT NOT NULL,
    track_number INT(3),
    FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE
);
CREATE TRIGGER song_insert_uuid BEFORE INSERT ON song FOR EACH ROW SET NEW.uuid = UUID();

INSERT INTO song (track_number, title, album_id)
VALUES
    (1, "Fear Inoculum", (select id from album where name = "Fear Inoculum")),
    (2, "Pneuma", (select id from album where name = "Fear Inoculum")),
    (3, "Litanie contre la peur", (select id from album where name = "Fear Inoculum")),
    (4, "Invincible", (select id from album where name = "Fear Inoculum")),
    (5, "Legion Inoculant", (select id from album where name = "Fear Inoculum")),
    (6, "Descending", (select id from album where name = "Fear Inoculum")),
    (7, "Culling Voices", (select id from album where name = "Fear Inoculum")),
    (8, "Chocolate Chip Trip", (select id from album where name = "Fear Inoculum")),
    (9, "7empest", (select id from album where name = "Fear Inoculum")),
    (10, "Mockingbeat", (select id from album where name = "Fear Inoculum")),
    (1, "Hold You Now", (select id from album where name = "Father of the Bride")),
    (2, "Harmony Hall", (select id from album where name = "Father of the Bride")),
    (3, "Bambina", (select id from album where name = "Father of the Bride")),
    (4, "This Life", (select id from album where name = "Father of the Bride")),
    (5, "Big Blue", (select id from album where name = "Father of the Bride")),
    (6, "How Long?", (select id from album where name = "Father of the Bride")),
    (7, "Unbearably White", (select id from album where name = "Father of the Bride")),
    (8, "Rich Man", (select id from album where name = "Father of the Bride")),
    (9, "Married in a Gold Rush", (select id from album where name = "Father of the Bride")),
    (10, "My Mistake", (select id from album where name = "Father of the Bride")),
    (11, "Sympathy", (select id from album where name = "Father of the Bride")),
    (12, "Sunflower", (select id from album where name = "Father of the Bride")),
    (13, "Flower Moon", (select id from album where name = "Father of the Bride")),
    (14, "2021", (select id from album where name = "Father of the Bride")),
    (15, "We Belong Together", (select id from album where name = "Father of the Bride")),
    (16, "Stranger", (select id from album where name = "Father of the Bride")),
    (17, "Snow", (select id from album where name = "Father of the Bride")),
    (18, "Jerusalem, New York, Berlin", (select id from album where name = "Father of the Bride")),
    (1, "I Like Myself (Most of the Time)", (select id from album where name = "Solutions")),
    (2, "Bad Vibes", (select id from album where name = "Solutions")),
    (3, "This Baby Don't Cry", (select id from album where name = "Solutions")),
    (4, "Sister", (select id from album where name = "Solutions")),
    (5, "Nervous", (select id from album where name = "Solutions")),
    (6, "Good News", (select id from album where name = "Solutions")),
    (7, "Ice Cream", (select id from album where name = "Solutions")),
    (8, "Not in California", (select id from album where name = "Solutions")),
    (9, "Only the Dark", (select id from album where name = "Solutions")),
    (10, "DNA", (select id from album where name = "Solutions")),
    (1, "Legendary", (select id from album where name = "Victorious")),
    (2, "You Ain't Ready", (select id from album where name = "Victorious")),
    (3, "Victorious", (select id from album where name = "Victorious")),
    (4, "This Is the Kingdom", (select id from album where name = "Victorious")),
    (5, "Save Me", (select id from album where name = "Victorious")),
    (6, "Rise Up", (select id from album where name = "Victorious")),
    (7, "Terrify the Dark", (select id from album where name = "Victorious")),
    (8, "Never Going Back", (select id from album where name = "Victorious")),
    (9, "Reach", (select id from album where name = "Victorious")),
    (10, "Anchor", (select id from album where name = "Victorious")),
    (11, "Finish Line", (select id from album where name = "Victorious")),
    (12, "Back to Life", (select id from album where name = "Victorious"));
