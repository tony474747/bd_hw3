--создаем таблицу жанр
CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	name_genre VARCHAR(80) UNIQUE NOT NULL
);

----создаем таблицу исполнитель
CREATE TABLE IF NOT EXISTS Executor (
	executor_id SERIAL PRIMARY KEY,
	name_executor VARCHAR(80) UNIQUE NOT NULL
);

--создаем таблицу зависимости жанр-исполнитель
CREATE TABLE IF NOT EXISTS GenreExecutor (
	genre_id INT,
	executor_id INT,
	PRIMARY KEY (genre_id, executor_id),
	FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
	FOREIGN KEY (executor_id) REFERENCES Executor(executor_id)
);

----создаем таблицу альбом
CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name_album VARCHAR(80) UNIQUE NOT NULL,
	year_album INT NOT NULL
);

--создаем таблицу зависимости исполнитель-альбом
CREATE TABLE IF NOT EXISTS ExecutorAlbum (
	album_id INT,
	executor_id INT,
	PRIMARY KEY (album_id, executor_id),
	FOREIGN KEY (album_id) REFERENCES Album(album_id),
	FOREIGN KEY (executor_id) REFERENCES Executor(executor_id)
);

--создаем таблицу трек
CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	name_track VARCHAR(80) NOT NULL,
	length_track int NOT NULL,
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

--создаем таблицу сборник
CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL,
	year INT NOT NULL
);

--создаем таблицу зависимости трек-сборник
CREATE TABLE IF NOT EXISTS TrackCollection (
	track_id INT,
	collection_id INT,
	PRIMARY KEY (track_id, collection_id),
	FOREIGN KEY (track_id) REFERENCES Track(track_id),
	FOREIGN KEY (collection_id) REFERENCES collection(collection_id)
);
