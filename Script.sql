CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY
    , Title VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers (
    id SERIAL PRIMARY KEY
    , Name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenrePerfomer (
    Genre_id INTEGER REFERENCES Genres(id)
    , Perfomer_id INTEGER REFERENCES Performers(id)
    , CONSTRAINT pk_GenrePerfomer PRIMARY KEY (
        Genre_id
        , Perfomer_id
    )
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY
    , Title VARCHAR(30) NOT NULL
    , Year_of_issue INTEGER
);

CREATE TABLE IF NOT EXISTS PerfomerAlbum (
    Perfomer_id INTEGER REFERENCES Performers(id)
    , Album_id INTEGER REFERENCES Albums(id)
    , CONSTRAINT pk_PerfomerAlbum PRIMARY KEY (
        Perfomer_id
        , Album_id
    )
);

CREATE TABLE IF NOT EXISTS Songs (
    id SERIAL PRIMARY KEY
    , Title VARCHAR(30) NOT NULL
    , Duration INTEGER
    , Album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Compilations (
    id SERIAL PRIMARY KEY
    , Title VARCHAR(30) NOT NULL
    , Year_of_issue INTEGER
);

CREATE TABLE IF NOT EXISTS SongCompilation (
    Song_id INTEGER REFERENCES Songs(id)
    , Compilation_id INTEGER REFERENCES Compilations(id)
    , CONSTRAINT pk_SongCompilation PRIMARY KEY (
        Song_id
        , Compilation_id
    )
);
