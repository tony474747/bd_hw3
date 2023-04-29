-- Название и год выхода альбомов, вышедших в 2018 году.
SELECT name_album, year_album FROM album
WHERE year_album >= 2018;

--Название и продолжительность самого длительного трека.
SELECT name_track, length_track FROM track
ORDER BY length_track DESC
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name_track FROM track
WHERE length_track > 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collection
WHERE year>= 2018 AND year <= 2020;
--WHERE year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT name_executor FROM executor
WHERE name_executor NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT name_track FROM track
WHERE name_track LIKE '%my%' OR name_track LIKE '%мой%';