CREATE TABLE tblAlbum (
    album_id STRING PRIMARY KEY,
    name STRING,
    release_date DATE,
    total_tracks NUMBER,
    url STRING
);

CREATE TABLE tblArtist (
    artist_id STRING PRIMARY KEY,
    artist_name STRING,
    external_url STRING
);

CREATE TABLE tblSongs (
    song_id STRING PRIMARY KEY,
    song_name STRING,
    duration_ms NUMBER,
    url STRING,
    popularity NUMBER,
    song_added STRING,
    album_id STRING,
    artist_id STRING
);

CREATE OR REPLACE STAGE spotify_stage
URL = 's3://spotify-etl-project-dnyanda/transformed_data/'
CREDENTIALS = (
  AWS_KEY_ID = 'YOUR_AWS_ID'
  AWS_SECRET_KEY = 'YOUR_SECRET_KEY'
)
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);

LIST @spotify_stage;

CREATE OR REPLACE PIPE album_pipe
AUTO_INGEST = TRUE
AS
COPY INTO tblAlbum
FROM @spotify_stage/album_data/
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1)
ON_ERROR = CONTINUE;

CREATE OR REPLACE PIPE artist_pipe
AUTO_INGEST = TRUE
AS
COPY INTO tblArtist
FROM @spotify_stage/artist_data/
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1)
ON_ERROR = CONTINUE;

CREATE OR REPLACE PIPE song_pipe
AUTO_INGEST = TRUE
AS
COPY INTO tblSongs
FROM @spotify_stage/songs_data/
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1)
ON_ERROR = CONTINUE;

-- Manually trigger the pipes
ALTER PIPE album_pipe REFRESH;
ALTER PIPE artist_pipe REFRESH;
ALTER PIPE song_pipe REFRESH;

SELECT * FROM tblAlbum ORDER BY release_date DESC LIMIT 10;
SELECT * FROM tblArtist LIMIT 10;
SELECT * FROM tblSongs ORDER BY popularity DESC LIMIT 10;


SHOW PIPES;

SELECT * FROM tblAlbum ORDER BY release_date DESC LIMIT 5;
SELECT * FROM tblArtist LIMIT 5;
SELECT * FROM tblSongs ORDER BY popularity DESC LIMIT 5;


SELECT * FROM tblAlbum ORDER BY release_date DESC LIMIT 5;
SELECT * FROM tblArtist LIMIT 5;
SELECT * FROM tblSongs ORDER BY popularity DESC LIMIT 5;







