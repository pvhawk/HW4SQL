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

SELECT c.name FROM collections c
JOIN collectionstracks ct ON ct.collection_id =c.id 
JOIN tracks t ON ct.track_id = c.id 
JOIN albums a ON t.album_id = a.id 
JOIN artistsalbums aa ON a.id = aa.album_id 
JOIN artists ON aa.artist_id = artists.id




