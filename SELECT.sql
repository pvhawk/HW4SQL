SELECT COUNT(artist_id), name FROM genres 
JOIN artistsgenres ON artistsgenres.genre_id = genres.id 
GROUP BY name

SELECT COUNT(tracks.id) FROM albums  
JOIN tracks ON tracks.album_id = albums.id
WHERE albums.release >= '01.01.2019' AND albums.release < '01.01.2021' 

SELECT AVG(time), albums.name FROM albums 
JOIN tracks ON tracks.album_id = albums.id
GROUP BY albums.name

SELECT artists.name, release FROM artists 
LEFT JOIN artistsalbums ON artistsalbums.artist_id = artists.id
JOIN albums ON albums.id = artistsalbums.album_id 
WHERE EXTRACT(YEAR FROM release) <> '2020'

SELECT c.name  FROM collections c
JOIN collectionstracks ct ON ct.collection_id = c.id 
JOIN tracks t ON t.id = ct.track_id  
JOIN albums a ON  a.id = t.album_id 
JOIN artistsalbums aa ON a.id = aa.album_id 
JOIN artists ON aa.artist_id = artists.id
WHERE artists.name = 'Ария'

SELECT a.name  FROM albums a
JOIN artistsalbums a2 ON a2.album_id = a.id 
JOIN artists a3 ON a2.artist_id = a3.id 
JOIN artistsgenres ag ON ag.artist_id = a3.id 
GROUP BY a.name
HAVING COUNT(ag.artist_id) > 1

SELECT name  FROM tracks t 
LEFT JOIN collectionstracks c ON t.id= c.track_id WHERE c.track_id IS NULL

SELECT a.name, time FROM artists a 
JOIN artistsalbums aa ON a.id = aa.artist_id 
JOIN albums a2 ON  a2.id = aa.album_id 
JOIN tracks t ON t.album_id  = a2.id  
WHERE time = (SELECT MIN(time) FROM tracks)


