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
	contrasenia  varchar(40),
	fecha_registro date,
	fecha_nacimiento date,
	nombre varchar(40),

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
	id_usuario_creador smallint NOT NULL,
	nombre varchar(40),
	descripcion text,

	PRIMARY KEY(id_playlist),
	FOREIGN KEY (id_usuario_creador) REFERENCES Usuario(id_usuario)
);


CREATE TABLE Album(
	id_album smallint NOT NULL,
	id_artista_album smallint NOT NULL,
	titulo varchar(40),
	fecha_lanzamiento date,

	PRIMARY KEY(id_album),
	FOREIGN KEY(id_artista_album) REFERENCES Artista(id_artista)
);

CREATE TABLE Cancion(
	id_cancion smallint NOT NULL,
	id_album_cancion smallint NOT NULL,
	titulo varchar(40),
	genero varchar(40),
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
	orden varchar(40) NOT NULL,
	
	PRIMARY KEY(id_playlist_contiene, id_cancion_contiene),
	FOREIGN KEY(id_playlist_contiene) REFERENCES Playlist(id_playlist) ON DELETE CASCADE,
	FOREIGN KEY(id_cancion_contiene) REFERENCES Cancion(id_cancion) ON DELETE CASCADE);
