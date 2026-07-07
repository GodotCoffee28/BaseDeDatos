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

-- Triggers --

-- Usuario Gratis sin mas de 3 playlist -- 
	--  Trigger de Escucha -- 
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

	IF tipousuario = 'Premiun' THEN
		RETURN NEW; -- Se retorna la nueva insersion como si nada
	END IF;

	-- Si llegamos aqui signifca que el usuario es Gratis y contaremos cuantas playlist tiene hasta ahora
	SELECT COUNT(*) INTO cantidadplaylist
	FROM Escucha -- Cada vez que aparece el id_usuario en Escucha significa que tiene una playlist asociada
	WHERE id_usuario = NEW.id_usuario_escucha;

	IF(cantidadplaylist >= 3 ) THEN
		RAISE EXCEPTION 'Error, un usuario Gratis no puede tener más de 3 playlist';
	END IF;	
	RETURN NEW;
END;
$$;

CREATE TRIGGER verificar_cantidad_playlist_usuario_gratis
BEFORE INSERT ON escucha
FOR EACH ROW
EXECUTE FUNCTION verificar_cantidad_playlist_usuario_gratis();


-- Usuario Gratis sin mas de 3 playlist -- 

-- Garantizar que solo se añadan canciones reproducibles --
	-- Trigger de Escucha -- 
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

-- Garantizar que solo se añadan canciones reproducibles --