USE v2019;

-- listar todos
-- SELECT id,nombre,contrasenya FROM usuario ORDER BY id DESC LIMIT 500;

-- busqueda por nombre
SELECT id,nombre,contrasenya FROM usuario WHERE nombre LIKE '%cas%' ORDER BY nombre ASC LIMIT 500;


-- eliminar un usuario por id
DELETE FROM usuario WHERE id = ?;

-- crear un usuario nuevo
INSERT INTO usuario ( nombre, contrasenya) VALUES ( ? , ?);

-- modificar un usuario
UPDATE usuario SET nombre= ?, contrasenya= ? WHERE id = ?;


-- numero de likes del Fary
-- SELECT COUNT(*) as 'numero_likes' FROM likes WHERE video_id = 4;

-- INNER JOIN EXPLICITA
-- mostrar los videos del usuario 'soso' por su id
SELECT 
	u.nombre as 'usuario',
    v.nombre as 'video',
    c.nombre as 'categoria'
FROM 
	usuario as u INNER JOIN video as v ON u.id = v.usuario_id 
    INNER JOIN categoria as c ON c.id = v.categoria_id 
    
WHERE
	u.id = 3;

-- INNER JOIN IMPLICITA	
-- mostrar los videos del usuario 'soso' por su id
SELECT 
	u.nombre as 'usuario',
    v.nombre as 'video',
    c.nombre as 'categoria'
FROM 
	usuario as u,
    video as v,
    categoria as c
   
WHERE
	u.id = v.usuario_id AND
    v.categoria_id = c.id;	
   

    
-- subconsulta con group by para likes ANDER
SELECT id, nombre,
 IFNULL((SELECT COUNT(*) AS 'likes_videos' FROM likes GROUP BY id_video HAVING id_video = id),0)
 AS likes FROM video ORDER BY likes DESC;


 -- vista v_videos con los datos de los videos y sus likes
SELECT v.id as 'video_id', v.nombre as 'video_nombre', codigo,
		u.id as 'usuario_id', u.nombre as 'usuario_nombre',
        c.id as 'categoria_id', c.nombre as 'categoria_nombre',
        IFNULL((SELECT COUNT(*) as 'likes_videos' FROM likes GROUP BY id_video  HAVING id_video = v.id),0) 'likes'
	FROM video as v, usuario as u , categoria as c
	WHERE v.usuario_id = u.id AND v.categoria_id = c.id 
	ORDER BY likes DESC LIMIT 500;
	
	
-- vista v_totales_videos para ver todos los videos, los visibles y los eliminados
SELECT COUNT(*) AS 'total_videos',
 (SELECT COUNT(*) FROM video v, usuario u WHERE v.usuario_id=u.id AND u.fecha_eliminacion IS NULL) AS 'total_visibles',
 (SELECT COUNT(*) FROM video v, usuario u WHERE v.usuario_id=u.id AND u.fecha_eliminacion IS NOT NULL) AS 'total_eliminados'
 FROM video;
 
-- todas las categoriass con su numero de videos
-- si pones * en el COUNT te saca 1 en los nulos, con v.id saca 0
SELECT c.id,c.nombre, COUNT(v.id) 'total' FROM video v RIGHT JOIN categoria c ON v.categoria_id = c.id GROUP BY c.id;

-- todas las categorias con su numero de likes
SELECT c.id,c.nombre, COUNT(l.id_video) 'total_likes' FROM (categoria c LEFT JOIN video v ON c.id= v.categoria_id)
LEFT JOIN likes l ON v.id= l.id_video GROUP BY c.id ;

-- todas las categorias con su numero de videos mas los likes de cada categoria. Vista v_totales_categoria_likes
SELECT c.id,c.nombre,COUNT(v.id) 'total_videos',

	 (SELECT COUNT(l.id_video) 'total_likes' FROM (categoria c2 LEFT JOIN video v ON c2.id= v.categoria_id)
	LEFT JOIN likes l ON v.id= l.id_video WHERE c2.id= c.id GROUP BY c2.id)
 
  AS 'total_likes' FROM categoria c LEFT JOIN video v 
ON c.id= v.categoria_id GROUP BY c.id;

