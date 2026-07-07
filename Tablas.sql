-- Creaciones de tablas -- 

DROP TABLE IF EXISTS Persona CASCADE;
DROP  TABLE  IF EXISTS Usuario CASCADE;
DROP TYPE IF EXISTS tipo_plan;
DROP TABLE IF EXISTS Artista CASCADE;
DROP TABLE IF EXISTS Playlist CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Cancion CASCADE;
DROP TABLE IF EXISTS Archivo_Audio CASCADE;
DROP TABLE IF EXISTS Escucha CASCADE;
DROP TABLE IF EXISTS Contiene CASCADE;

CREATE TABLE Persona(
	id_persona smallint NOT NULL,
	email varchar(60),
	contrasenia  varchar(30),
	fecha_registro date,
	fecha_nacimiento date,
	nombre varchar(20),

	PRIMARY KEY(id_persona)
);

CREATE TYPE tipo_plan AS ENUM('Premium','Gratis');

CREATE TABLE Usuario(
	id_usuario smallint NOT NULL,
	tipo tipo_plan,

	PRIMARY KEY(id_usuario),
	FOREIGN KEY(id_usuario) REFERENCES  Persona(id_persona)
);

CREATE TABLE Artista(
	id_artista smallint NOT NULL,
	biografia text,

	PRIMARY KEY(id_artista),
	FOREIGN KEY(id_artista) REFERENCES Persona(id_persona)
);

CREATE TABLE Playlist(
	id_playlist smallint NOT NULL,
	nombre varchar(20),
	descripcion text,

	PRIMARY KEY(id_playlist)
);


CREATE TABLE Album(
	id_album smallint NOT NULL,
	id_artista_album smallint NOT NULL,
	titulo varchar(20),
	fecha_lanzamiento date,

	PRIMARY KEY(id_album),
	FOREIGN KEY(id_artista_album) REFERENCES Artista(id_artista)
);

CREATE TABLE Cancion(
	id_cancion smallint NOT NULL,
	id_album_cancion smallint NOT NULL,
	titulo varchar(20),
	genero varchar(20),
	duracion_seg smallint,

	PRIMARY KEY(id_cancion),
	FOREIGN KEY(id_album_cancion) REFERENCES Album(id_album)
);

CREATE TABLE Archivo_Audio(
	id_audio smallint NOT NULL,
	id_cancion_audio smallint NOT NULL,
	URL text,
	tamanio decimal,
	formato varchar(10),
	ubicacion text,
	calidad text,

	PRIMARY KEY(id_audio,id_cancion_audio),
	FOREIGN KEY(id_cancion_audio) REFERENCES Cancion(id_cancion)
);

CREATE TABLE Escucha(
	id_usuario_escucha smallint NOT NULL,
	id_playlist_escucha smallint NOT NULL,

	PRIMARY KEY(id_usuario_escucha, id_playlist_escucha),
	FOREIGN KEY(id_usuario_escucha) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
	FOREIGN KEY(id_playlist_escucha) REFERENCES Playlist(id_playlist) ON DELETE CASCADE
);


CREATE TABLE Contiene(
	id_playlist_contiene smallint NOT NULL,
	id_cancion_contiene smallint NOT NULL, 
	orden smallint NOT NULL,
	
	PRIMARY KEY(id_playlist_contiene, id_cancion_contiene),
	FOREIGN KEY(id_playlist_contiene) REFERENCES Playlist(id_playlist) ON DELETE CASCADE,
	FOREIGN KEY(id_cancion_contiene) REFERENCES Cancion(id_cancion) ON DELETE CASCADE
);

---Triggers---

-- Usuario Gratis sin mas de 3 playlist -- 
DROP TRIGGER IF EXISTS verificar_cantidad_playlist_usuario_gratis ON Escucha;
CREATE OR REPLACE FUNCTION verificar_cantidad_playlist_usuario_gratis()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS
$$ 
DECLARE
	cantidadplaylist int;
	tipousuario tipo_plan;
BEGIN

	-- Si es de tipo premium, no pasa nada --
	SELECT tipo INTO tipousuario
	FROM Usuario
	WHERE id_usuario = NEW.id_usuario_escucha;

	IF tipousuario = 'Premium' THEN
		RETURN NEW; -- Se retorna la nueva insersión como si nada
	END IF;

	-- Si llegamos aqui signifca que el usuario es Gratis y contaremos cuantas playlist tiene hasta ahora
	SELECT COUNT(*) INTO cantidadplaylist
	FROM Escucha -- Cada vez que aparece el id_usuario en Escucha significa que tiene una playlist asociada
	WHERE id_usuario_escucha = NEW.id_usuario_escucha;

	IF(cantidadplaylist >= 3 ) THEN
		RAISE EXCEPTION '| Error - Un usuario gratis no puede tener más de 3 playlist |';
	END IF;	
	RETURN NEW;
END;
$$;

CREATE TRIGGER verificar_cantidad_playlist_usuario_gratis
BEFORE INSERT ON Escucha
FOR EACH ROW
EXECUTE FUNCTION verificar_cantidad_playlist_usuario_gratis();


---Garantizar que solo se añadan canciones reproducibles---

DROP TRIGGER IF EXISTS verificar_cancion_reproducible ON Contiene;
CREATE OR REPLACE FUNCTION verificar_cancion_reproducible()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS
$$ 
DECLARE
	cantidad_audios int;
BEGIN

	SELECT COUNT(*) INTO cantidad_audios
	FROM Archivo_Audio
	Where id_cancion_audio = NEW.id_cancion_contiene;

	IF(cantidad_audios = 0 ) THEN
		RAISE EXCEPTION '| Error - La canción no tiene un archivo de audio asociado |';
	END IF;	
	RETURN NEW;
END;
$$;

CREATE TRIGGER verificar_cancion_reproducible
BEFORE INSERT ON Contiene
FOR EACH ROW
EXECUTE FUNCTION verificar_cancion_reproducible();


---Datos pertenecientes a las tablas---

---id_persona smallint NOT NULL, email varchar(60), contrasenia  varchar(30),
	--fecha_registro date,
	--fecha_nacimiento date,
	--nombre varchar(20),
--Usuarios
INSERT INTO Persona VALUES (1, 'aaroncordobarivas@gmail.com', 'HolaOscar123456', '2024-08-16', '2007-09-17', 'Ramses Cordoba');
INSERT INTO Persona VALUES (2, 'genesis.ngo0@gmail.com', 'TeOdioRamses.*%', '2024-02-21', '2007-09-21', 'Genesis Noriega');
INSERT INTO Persona VALUES (3, 'elempleado@gmail.com', 'DaIgual12345_', '2024-07-15', '2007-12-17', 'Gabriel Castillo');
INSERT INTO Persona VALUES (4, 'elesclavo@gmail.com', 'contraseña_$', '2025-12-21', '2005-11-22','Alejandro Rondón');
INSERT INTO Persona VALUES (5, 'nosoyramses@hotmail.com', 'nosequiensoy_#2', '2023-04-13', '2006-07-07', 'Sebastián Cordoba');
INSERT INTO Persona VALUES (6, 'vendedoradesardinas@gmail.com', 'rupertoelchivo67', '2024-11-05', '2005-04-02', 'Daymar Zuzunaga');
INSERT INTO Persona VALUES (7, 'elsinoficio@gmail.com', 'deadspace1234', '2023-12-21', '2007-01-07', 'JavierGascue');
INSERT INTO Persona VALUES (8, 'nosoyunsim@gmail.com', 'cienmilsimoleones2', '2025-04-05', '1976-09-09', 'Elvira Lápida');
INSERT INTO Persona VALUES (9, 'mejorprofAyED@hotmail.com', 'unpositivo1234' '2024-12-12', '1985-04-12', 'Gary Romero' );
INSERT INTO Persona VALUES (10, 'asesinadepollos@gmail.com', 'uncuartodepollo_', '2023-12-14', '2007-01-20', 'Valentina Almeida');
INSERT INTO Persona VALUES (11,);
INSERT INTO Persona VALUES (12,);
INSERT INTO Persona VALUES (13,);
INSERT INTO Persona VALUES (14,);
INSERT INTO Persona VALUES (15,);
INSERT INTO Persona VALUES (16,);
INSERT INTO Persona VALUES (17,);
INSERT INTO Persona VALUES (18,);
INSERT INTO Persona VALUES (19,);
INSERT INTO Persona VALUES (20,);
--Artistas
INSERT INTO Persona VALUES (21,);
INSERT INTO Persona VALUES (22,);
INSERT INTO Persona VALUES (23,);
INSERT INTO Persona VALUES (24,);
INSERT INTO Persona VALUES (25,);
INSERT INTO Persona VALUES (26,);
INSERT INTO Persona VALUES (27,);
INSERT INTO Persona VALUES (28,);
INSERT INTO Persona VALUES (29,);
INSERT INTO Persona VALUES (30,);
INSERT INTO Persona VALUES (31,);
INSERT INTO Persona VALUES (32,);
INSERT INTO Persona VALUES (33,);
INSERT INTO Persona VALUES (34,);
INSERT INTO Persona VALUES (35,);
INSERT INTO Persona VALUES (36,);
INSERT INTO Persona VALUES (37,);
INSERT INTO Persona VALUES (38,);
INSERT INTO Persona VALUES (39,);
INSERT INTO Persona VALUES (40,);
--Mixtos
INSERT INTO Persona VALUES (41,);
INSERT INTO Persona VALUES (42,);
INSERT INTO Persona VALUES (43,);
INSERT INTO Persona VALUES (44,);
INSERT INTO Persona VALUES (45,);
INSERT INTO Persona VALUES (46,);
INSERT INTO Persona VALUES (47,);
INSERT INTO Persona VALUES (48,);
INSERT INTO Persona VALUES (49,);
INSERT INTO Persona VALUES (50,);

INSERT INTO Usuario VALUES (1, 'Gratis');
INSERT INTO Usuario VALUES (2, 'Gratis');
INSERT INTO Usuario VALUES (3, 'Gratis');
INSERT INTO Usuario VALUES (4, 'Gratis');
INSERT INTO Usuario VALUES (5, 'Gratis');
INSERT INTO Usuario VALUES (6, 'Premium');
INSERT INTO Usuario VALUES (7,'Gratis');
INSERT INTO Usuario VALUES (8,'Premium');
INSERT INTO Usuario VALUES (9,'Gratis');
INSERT INTO Usuario VALUES (10,'Premium');
INSERT INTO Usuario VALUES (11,'Gratis');
INSERT INTO Usuario VALUES (12,'Gratis');
INSERT INTO Usuario VALUES (13,'Gratis');
INSERT INTO Usuario VALUES (14,'Premium');
INSERT INTO Usuario VALUES (15,'Gratis');
INSERT INTO Usuario VALUES (16,'Premium');
INSERT INTO Usuario VALUES (17,'Gratis');
INSERT INTO Usuario VALUES (18,'Gratis');
INSERT INTO Usuario VALUES (19,'Premium');
INSERT INTO Usuario VALUES (20,'Premium');

INSERT INTO Artista VALUES (21,);
INSERT INTO Artista VALUES (22,);
INSERT INTO Artista VALUES (23,);
INSERT INTO Artista VALUES (24,);
INSERT INTO Artista VALUES (25,);
INSERT INTO Artista VALUES (26,);
INSERT INTO Artista VALUES (27,);
INSERT INTO Artista VALUES (28,);
INSERT INTO Artista VALUES (29,);
INSERT INTO Artista VALUES (30,);
INSERT INTO Artista VALUES (31,);
INSERT INTO Artista VALUES (32,);
INSERT INTO Artista VALUES (33,);
INSERT INTO Artista VALUES (34,);
INSERT INTO Artista VALUES (35,);
INSERT INTO Artista VALUES (36,);
INSERT INTO Artista VALUES (37,);
INSERT INTO Artista VALUES (38,);
INSERT INTO Artista VALUES (39,);
INSERT INTO Artista VALUES (40,);

---Mixtos
INSERT INTO Usuario VALUES (41,'Premium');
INSERT INTO Usuario VALUES (42,'Premium');
INSERT INTO Usuario VALUES (43,'Gratis');
INSERT INTO Usuario VALUES (44,'Premium');
INSERT INTO Usuario VALUES (45,'Premium');
INSERT INTO Usuario VALUES (46,'Premium');
INSERT INTO Usuario VALUES (47,'Gratis');
INSERT INTO Usuario VALUES (48,'Premium');
INSERT INTO Usuario VALUES (49,'Premium');
INSERT INTO Usuario VALUES (50,'Gratis');
INSERT INTO Artista VALUES (41,);
INSERT INTO Artista VALUES (42,);
INSERT INTO Artista VALUES (43,);
INSERT INTO Artista VALUES (44,);
INSERT INTO Artista VALUES (45,);
INSERT INTO Artista VALUES (46,);
INSERT INTO Artista VALUES (47,);
INSERT INTO Artista VALUES (48,);
INSERT INTO Artista VALUES (49,);
INSERT INTO Artista VALUES (50,);

INSERT INTO Playlist VALUES (1,);
INSERT INTO Playlist VALUES (2,);
INSERT INTO Playlist VALUES (3,);
INSERT INTO Playlist VALUES (4,);
INSERT INTO Playlist VALUES (5,);
INSERT INTO Playlist VALUES (6,);
INSERT INTO Playlist VALUES (7,);
INSERT INTO Playlist VALUES (8,);
INSERT INTO Playlist VALUES (9,);
INSERT INTO Playlist VALUES (10,);
INSERT INTO Playlist VALUES (11,);
INSERT INTO Playlist VALUES (12,);
INSERT INTO Playlist VALUES (13,);
INSERT INTO Playlist VALUES (14,);
INSERT INTO Playlist VALUES (15,);
INSERT INTO Playlist VALUES (16,);
INSERT INTO Playlist VALUES (17,);
INSERT INTO Playlist VALUES (18,);
INSERT INTO Playlist VALUES (19,);
INSERT INTO Playlist VALUES (20,);

INSERT INTO Album VALUES (1,);
INSERT INTO Album VALUES (2,);
INSERT INTO Album VALUES (3,);
INSERT INTO Album VALUES (4,);
INSERT INTO Album VALUES (5,);
INSERT INTO Album VALUES (6,);
INSERT INTO Album VALUES (7,);
INSERT INTO Album VALUES (8,);
INSERT INTO Album VALUES (9,);
INSERT INTO Album VALUES (10,);
INSERT INTO Album VALUES (11,);
INSERT INTO Album VALUES (12,);
INSERT INTO Album VALUES (13,);
INSERT INTO Album VALUES (14,);
INSERT INTO Album VALUES (15,);
INSERT INTO Album VALUES (16,);
INSERT INTO Album VALUES (17,);
INSERT INTO Album VALUES (18,);
INSERT INTO Album VALUES (19,);
INSERT INTO Album VALUES (20,);

INSERT INTO Cancion VALUES (1,);
INSERT INTO Cancion VALUES (2,);
INSERT INTO Cancion VALUES (3,);
INSERT INTO Cancion VALUES (4,);
INSERT INTO Cancion VALUES (5,);
INSERT INTO Cancion VALUES (6,);
INSERT INTO Cancion VALUES (7,);
INSERT INTO Cancion VALUES (8,);
INSERT INTO Cancion VALUES (9,);
INSERT INTO Cancion VALUES (10,);
INSERT INTO Cancion VALUES (11,);
INSERT INTO Cancion VALUES (12,);
INSERT INTO Cancion VALUES (13,);
INSERT INTO Cancion VALUES (14,);
INSERT INTO Cancion VALUES (15,);
INSERT INTO Cancion VALUES (16,);
INSERT INTO Cancion VALUES (17,);
INSERT INTO Cancion VALUES (18,);
INSERT INTO Cancion VALUES (19,);
INSERT INTO Cancion VALUES (20,);

INSERT INTO Archivo_Audio VALUES (1,);
INSERT INTO Archivo_Audio VALUES (2,);
INSERT INTO Archivo_Audio VALUES (3,);
INSERT INTO Archivo_Audio VALUES (4,);
INSERT INTO Archivo_Audio VALUES (5,);
INSERT INTO Archivo_Audio VALUES (6,);
INSERT INTO Archivo_Audio VALUES (7,);
INSERT INTO Archivo_Audio VALUES (8,);
INSERT INTO Archivo_Audio VALUES (9,);
INSERT INTO Archivo_Audio VALUES (10,);
INSERT INTO Archivo_Audio VALUES (11,);
INSERT INTO Archivo_Audio VALUES (12,);
INSERT INTO Archivo_Audio VALUES (13,);
INSERT INTO Archivo_Audio VALUES (14,);
INSERT INTO Archivo_Audio VALUES (15,);
INSERT INTO Archivo_Audio VALUES (16,);
INSERT INTO Archivo_Audio VALUES (17,);
INSERT INTO Archivo_Audio VALUES (18,);
INSERT INTO Archivo_Audio VALUES (19,);
INSERT INTO Archivo_Audio VALUES (20,);

INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();
INSERT INTO Escucha VALUES ();

INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
INSERT INTO Contiene VALUES ();
