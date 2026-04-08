-- schema.sql
-- Schema Design Assignment
--
-- Scenario chosen: A. Music Streaming App
--
-- Instructions:
--   1. Write \c to connect to your database.
--   2. Write DROP TABLE IF EXISTS statements in reverse dependency order.
--   3. Write CREATE TABLE statements in dependency order (parent tables first).
--      Use REFERENCES other_table(other_table_id) for every foreign key.
--      Use UNIQUE (col1, col2) on your association table's two foreign key columns.
--   4. Seed each table with at least 3 rows of realistic data.
--   5. Run: psql -f schema.sql  (Mac) or  sudo -u postgres psql -f schema.sql  (WSL)
--      Run it a second time to confirm it runs cleanly.

-- ============================================================
-- Step 1: Connect to your database
-- ============================================================
DROP DATABASE IF EXISTS music_db;
CREATE DATABASE music_db;
\c music_db


-- ============================================================
-- Step 2: Drop tables in reverse dependency order
-- (most dependent first, so foreign key constraints aren't violated)
-- ============================================================

DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS artist;

-- ============================================================
-- Step 3: Create tables in dependency order
-- (parent tables first, then tables that reference them)
-- ============================================================

CREATE TABLE artist (
  artist_id   SERIAL PRIMARY KEY,
  name        TEXT   NOT NULL
);

CREATE TABLE users (
  user_id     SERIAL  PRIMARY KEY,
  first_name  TEXT    NOT NULL,
  last_name   TEXT    NOT NULL
);

CREATE TABLE song (
  song_id       SERIAL   PRIMARY KEY,
  title         TEXT     NOT NULL,
  release_date  DATE     NOT NULL,
  artist_id     INTEGER  REFERENCES artist(artist_id)
);


CREATE TABLE playlist (
  playlist_id   SERIAL    PRIMARY KEY,
  name          TEXT      NOT NULL,
  user_id       INTEGER   REFERENCES users(user_id)
);

CREATE TABLE playlist_songs (
    playlist_songs_id  SERIAL    PRIMARY KEY,
    playlist_id        INTEGER   REFERENCES playlist(playlist_id),
    song_id            INTEGER   REFERENCES song(song_id),
    UNIQUE (playlist_id, song_id)
);


-- ============================================================
-- Step 4: Seed each table with at least 3 rows
-- ============================================================

INSERT INTO artist (name) VALUES
('Jonathan Ogden'),
('BELOVED'),
('RIDERS');

INSERT INTO users (first_name, last_name) VALUES
('Amyruth', 'Rubio'),
('Amanda', 'Rubio'),
('Francis', 'Rubio');

INSERT INTO song (title, release_date, artist_id) VALUES
('Reprise', '2026-03-27', 1),
('Forever & Always', '2026-03-27', 1),
('Remember', '2026-03-27', 1);

INSERT INTO playlist (name, user_id) VALUES
('Upbeat', 1),
('Chill', 2),
('Rock', 3);

INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 3);
