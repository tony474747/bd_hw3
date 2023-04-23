-- Название и год выхода альбомов, вышедших в 2018 году.
SELECT name, year FROM album
WHERE YEAR >= 2018;

--Название и продолжительность самого длительного трека.
SELECT name, length FROM track
ORDER BY length DESC
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name FROM track
WHERE length > '03:30:00';

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collection
WHERE YEAR >= 2018 AND YEAR <= 2020;
--WHERE YEAR BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT name FROM executor
WHERE name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT name FROM track
WHERE name LIKE '%my%' OR name LIKE '%мой%';