DROP TABLE genre_perfomer;
DROP TABLE perfomer_album;
DROP TABLE song_compilation;
DROP TABLE genres;
DROP TABLE performers;
DROP TABLE songs;
DROP TABLE albums;
DROP TABLE compilations;
CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS performers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_perfomer (
	genre_id INTEGER REFERENCES genres(id),
	perfomer_id INTEGER REFERENCES performers(id),
	CONSTRAINT pk_genre_perfomer PRIMARY KEY (
		genre_id,
		perfomer_id
	)
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	year_of_issue INTEGER
);

CREATE TABLE IF NOT EXISTS perfomer_album (
	perfomer_id INTEGER REFERENCES performers(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk_perfomer_album PRIMARY KEY (
		perfomer_id,
		album_id
	)
);

CREATE TABLE IF NOT EXISTS songs (
	id SERIAL PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	duration TIME,
	album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS compilations (
	id SERIAL PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	year_of_issue INTEGER
);

CREATE TABLE IF NOT EXISTS song_compilation (
	song_id INTEGER REFERENCES songs(id),
	compilation_id INTEGER REFERENCES compilations(id),
	CONSTRAINT pk_song_compilation PRIMARY KEY (
		song_id,
		compilation_id
	)
);

