# swe-6-3-schema-design

This assignment assesses **Schema Design and Normalization**. You will design and build a normalized multi-table database schema for a scenario of your choice.

- [Scenarios](#scenarios)
  - [A. Music Streaming App](#a-music-streaming-app)
  - [B. Library System](#b-library-system)
  - [C. Sports League](#c-sports-league)
  - [D. Event Ticketing](#d-event-ticketing)
  - [E. Fitness Tracker](#e-fitness-tracker)
- [Setup](#setup)
- [Requirements](#requirements)
  - [Grading: Schema Design (20 pts)](#grading-schema-design-20-pts)

## Scenarios

Choose **one** of the following. Your schema must be able to answer the data questions listed for that scenario.

### A. Music Streaming App

Data questions to answer:
- Which artists are on the platform?
- What songs has each artist released?
- What playlists exist and who created them?
- Which songs are on each playlist?

### B. Library System

Data questions to answer:
- Which books are in the library's collection?
- Who are the authors of each book?
- Which patrons are registered with the library?
- Which books has each patron checked out?

### C. Sports League

Data questions to answer:
- Which teams are in the league?
- Which players are on each team?
- Which games have been played (and who played in them)?
- Which players participated in each game?

### D. Event Ticketing

Data questions to answer:
- Which venues host events?
- What events are scheduled (and at which venue)?
- Which attendees are registered on the platform?
- Which events has each attendee registered for?

### E. Fitness Tracker

Data questions to answer:
- Which users are registered on the platform?
- Which exercises exist in the exercise library?
- Which workouts has each user completed?
- Which exercises were included in each workout?

---

## Setup

**1. Make a draft branch:**

    ```sh
    git checkout -b draft
    ```

**2. Create your database:** Choose a name that matches your scenario (e.g., `music_db`, `library_db`).

    **Mac:**
    ```sh
    createdb your_db_name
    ```

    **Windows/WSL:**
    ```sh
    sudo -u postgres createdb your_db_name
    ```

**3. Work on your schema** by writing your SQL in `schema.sql`. When you're done, run it to verify it works:

    **Mac:**
    ```sh
    psql -f schema.sql
    ```

    **Windows/WSL:**
    ```sh
    sudo -u postgres psql -f schema.sql
    ```

**4. Run the file a second time** to confirm the `DROP TABLE IF EXISTS` statements give you a clean slate each time.

---

## Requirements

Open `schema.sql` and write your solution. The file should run from top to bottom without errors in a single `psql -f schema.sql` call.

### Grading: Schema Design (20 pts)

**Setup (4 pts)**
- [ ] The SQL file starts by connecting to the correct database with `\c`
- [ ] `DROP TABLE IF EXISTS` statements appear before all `CREATE TABLE` statements, in reverse dependency order
- [ ] `CREATE TABLE` statements appear in dependency order (parent tables before child tables)
- [ ] The file can be executed multiple times without errors

**Table Structure (8 pts)**
- [ ] Every table has a `SERIAL PRIMARY KEY` column named after the table (e.g., `artist_id`)
- [ ] All columns have appropriate data types
- [ ] At least two columns across the schema have `NOT NULL` constraints
- [ ] Foreign key columns use `REFERENCES other_table(other_table_id)` syntax

**Relationships (6 pts)**
- [ ] At least one one-to-many relationship is represented with a foreign key column
- [ ] A many-to-many relationship is represented with a dedicated association table
- [ ] The association table has a `UNIQUE (col1, col2)` constraint on its two foreign key columns

**Seed Data (2 pts)**
- [ ] At least 3 rows are inserted into each table with realistic, consistent data
