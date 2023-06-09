--Количество исполнителей в каждом жанре.
SELECT name_genre, count(name_genre) FROM executor e
JOIN GenreExecutor ge ON e.executor_id = ge.executor_id
JOIN genre g ON g.genre_id = ge.genre_id
GROUP BY name_genre
ORDER BY count(*) DESC;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(name_track) FROM track t
JOIN Album a ON a.album_id = t.album_id
WHERE year_album BETWEEN 2018 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT name_album, AVG(length_track) FROM track t
JOIN Album a ON a.album_id = t.album_id
GROUP BY a.name_album
ORDER BY name_album;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name_executor FROM executor e 
WHERE name_executor NOT IN ( 
    SELECT name_executor FROM executor e 
    JOIN ExecutorAlbum ea ON e.executor_id = ea.executor_id
	JOIN album a ON a.album_id = ea.album_id
    WHERE year_album = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name FROM collection c
JOIN TrackCollection tc ON c.collection_id = tc.collection_id
JOIN Track t ON t.track_id = tc.track_id
JOIN album a ON a.album_id = t.album_id
JOIN ExecutorAlbum ea ON ea.album_id = a.album_id
JOIN Executor e ON e.executor_id = ea.executor_id
WHERE name_executor = 'АББА';


--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT name_album FROM album a
JOIN ExecutorAlbum ea ON a.album_id = ea.album_id 
JOIN GenreExecutor ge ON ea.executor_id = ge.executor_id 
GROUP BY a.album_id, ge.executor_id 
HAVING COUNT(ge.genre_id) > 1; 

--Наименования треков, которые не входят в сборники.
SELECT name_track FROM Track t
LEFT JOIN TrackCollection tc ON t.track_id = tc.track_id
WHERE tc.track_id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT name_executor, length_track FROM Track t
JOIN Album a ON a.album_id = t.album_id
JOIN ExecutorAlbum ea ON ea.album_id = a.album_id
JOIN Executor e ON e.executor_id = ea.executor_id
GROUP BY name_executor, length_track
HAVING length_track = (SELECT min(length_track) FROM Track)
ORDER BY name_executor;

--Названия альбомов, содержащих наименьшее количество треков.
SELECT name_album FROM Album a
JOIN Track t ON t.album_id = a.album_id
GROUP BY a.album_id 
HAVING COUNT(t.album_id) = ( 
    SELECT COUNT(track_id) FROM Track 
    GROUP BY album_id 
    ORDER BY 1
    LIMIT 1
);