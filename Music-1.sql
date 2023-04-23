CREATE TABLE IF NOT EXISTS Genre (
	genre_id INT PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
	executor_id INT PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreExecutor (
	genre_id INT,
	executor_id INT,
	PRIMARY KEY (genre_id, executor_id),
	FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
	FOREIGN KEY (executor_id) REFERENCES Executor(executor_id)
);

CREATE TABLE IF NOT EXISTS Albummums (
	album_id INT PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL,
	years INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ExecutorAlbum (
	album_id INT,
	executor_id INT,
	PRIMARY KEY (album_id, executor_id),
	FOREIGN KEY (album_id) REFERENCES Album(album_id),
	FOREIGN KEY (executor_id) REFERENCES Executor(executor_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id int PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	length INT NOT NULL,
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Сollection (
	collection_id INT PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL,
	years INT NOT NULL
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	track_id INT,
	collection_id INT,
	PRIMARY KEY (track_id, collection_id),
	FOREIGN KEY (track_id) REFERENCES Track(track_id),
	FOREIGN KEY (collection_id) REFERENCES Collection(collection_id)
);