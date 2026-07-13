-- Consultas
-- 1. Obtener todos los usuarios que tienen un plan "Premium" y se registraron este año.
SELECT P.*, U.tipo
FROM Persona P
INNER JOIN Usuario U ON P.id_persona = U.id_usuario
WHERE P.fecha_registro >= DATE_TRUNC('year', CURRENT_DATE) AND U.tipo = 'Premium';

-- 2. Mostrar el título de la canción, el nombre del álbum y el nombre del artista para todas las canciones de un artista en específico. 
-- (elegir el artista de su preferencia para este caso)
-- En este caso el artista Zarcort o id 17
SELECT C.titulo AS Cancion, L.titulo AS Album, P.nombre AS Artista 
FROM Artista A
INNER JOIN Persona P ON A.id_artista = P.id_persona
INNER JOIN Album L ON A.id_artista = L.id_artista_album
INNER JOIN Cancion C ON L.id_album = C.id_album_cancion
WHERE A.id_artista = 17;

-- 3. Imprimir el nombre de cada álbum y su duración total de cada álbum (en minutos)
SELECT L.titulo AS album, ROUND(SUM(C.duracion_seg) / 60.0, 2) AS Duracion_album
FROM Album L
INNER JOIN Cancion C ON L.id_album = C.id_album_cancion
GROUP BY L.id_album, L.titulo;
-- 4. Obtener el "Top 5" de los artistas más influyentes de la plataforma. 
-- Se deben listar los nombres de los 5 artistas cuyas canciones han sido añadidas a la mayor cantidad de playlists distintas, 
-- ordenados de mayor a menor cantidad de apariciones.

SELECT P.nombre AS Artista
FROM Persona P
INNER JOIN Artista A ON P.id_persona = A.id_artista
INNER JOIN Album L ON A.id_artista = L.id_artista_album
INNER JOIN Cancion C ON L.id_album = C.id_album_cancion
INNER JOIN Contiene O ON C.id_cancion = O.id_cancion_contiene
GROUP BY P.nombre, A.id_artista
ORDER BY COUNT(DISTINCT O.id_playlist_contiene) DESC LIMIT 5;