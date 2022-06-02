CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release DATE	
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES albums(id),
	name VARCHAR(100) NOT NULL,
	time INTEGER check(time>0)	
);


CREATE TABLE IF NOT EXISTS collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release DATE	
);

CREATE TABLE IF NOT EXISTS artistsalbums (
	artist_id INTEGER REFERENCES artists(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk_artistalbum PRIMARY KEY (artist_id, album_id)
);


CREATE TABLE IF NOT EXISTS collectionstracks (
	collection_id INTEGER REFERENCES collections(id),
	track_id INTEGER REFERENCES tracks(id),
	CONSTRAINT pk_coltracks PRIMARY KEY (collection_id, track_id)
);

CREATE TABLE IF NOT EXISTS artistsgenres (
	artist_id INTEGER REFERENCES artists(id),
	genre_id INTEGER REFERENCES genres(id),
	CONSTRAINT pk_artistgenre PRIMARY KEY (artist_id, genre_id)
);
