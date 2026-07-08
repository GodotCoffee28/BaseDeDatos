---Datos pertenecientes a las tablas---

---id_persona smallint NOT NULL, 
    --email varchar(60),
    --contrasenia  varchar(30),
	--fecha_registro date,
	--fecha_nacimiento date,
	--nombre varchar(20),
-- Inserts persona
    -- Usuarios
    INSERT INTO Persona VALUES (1, 'aaroncordobarivas@gmail.com', 'HolaOscar123456', '2024-08-16', '2007-09-17', 'Ramses Cordoba');
    INSERT INTO Persona VALUES (2, 'genesis.ngo0@gmail.com', 'TeOdioRamses.*%', '2024-02-21', '2007-09-21', 'Genesis Noriega');
    INSERT INTO Persona VALUES (3, 'elempleado@gmail.com', 'DaIgual12345_', '2024-07-15', '2007-12-17', 'Gabriel Castillo');
    INSERT INTO Persona VALUES (4, 'elesclavo@gmail.com', 'contraseña_$', '2025-12-21', '2005-11-22','Alejandro Rondón');
    INSERT INTO Persona VALUES (5, 'nosoyramses@hotmail.com', 'nosequiensoy_#2', '2023-04-13', '2006-07-07', 'Sebastián Cordoba');
    INSERT INTO Persona VALUES (6, 'vendedoradesardinas@gmail.com', 'rupertoelchivo67', '2024-11-05', '2005-04-02', 'Daymar Zuzunaga');
    INSERT INTO Persona VALUES (7, 'elsinoficio@gmail.com', 'deadspace1234', '2023-12-21', '2007-01-07', 'Javier Gascue');
    INSERT INTO Persona VALUES (8, 'nosoyunsim@gmail.com', 'cienmilsimoleones2', '2025-04-05', '1976-09-09', 'Elvira Lápida');
    INSERT INTO Persona VALUES (9, 'mejorprofAyED@hotmail.com', 'unpositivo1234', '2024-12-12', '1985-04-12', 'Gary Romero' );
    INSERT INTO Persona VALUES (10, 'asesinadepollos@gmail.com', 'uncuartodepollo_', '2023-12-14', '2007-01-20', 'Valentina Almeida');

    -- Mixtos
    INSERT INTO Persona VALUES (11,'ajrbrothers@gmail.com','wh0kknows','2021/11/05','1990/08/27','Adam Met');
    INSERT INTO Persona VALUES (12,'davidparedes@gmail.com','leoparedesdeladrillo','2026-04-16','1995-06-28','David Paredes');
    INSERT INTO Persona VALUES (13,'VicenteFernández456@gmail.com','vIceNtE_vincente','2026-12-24','1940 -02-17','Vicente Fernández');
    INSERT INTO Persona VALUES (14,'petemarssss@gmail.com','petethehorseishere','2026-10-21','1985-10-08','Peter Hernandez');
    INSERT INTO Persona VALUES (15,'zupermanalejandra@gmail.com','mejordelaclase++','2025-09-11','1991-04-30','Jacques Webster');
    INSERT INTO Persona VALUES (16,'prest0yelvis@gmail.com','%2134052%','2024-09-11','1958-08-29','Michael Jackson');
    INSERT INTO Persona VALUES (17,'r1basm4r123@gmail.com','Miguel Martos .%*','2024-07-15','1991-02-01','Miguel Martos');
    INSERT INTO Persona VALUES (18,'corderocorderito@gmail.com','$&alaparrilla&$','2024-02-01','1992-03-13','Juan Ozuna');
    INSERT INTO Persona VALUES (19,'cabellitorosita@gmail.com','krlgnzl.*%','2025-07-31','1965-02-18','Andre Young');
    INSERT INTO Persona VALUES (20,'nosoyshakira@gmail.com','5123524','2025-07-25','1977-03-24','Javier Gutiérrez');

    --Artistas
    INSERT INTO Persona VALUES (21,'wakawakaeheh@gmail.com','saminaminaeheh123','2026-07-07','2000-05-03', 'Shakira  Mebarak');
    INSERT INTO Persona VALUES (22,'boywithuke@gmail.com','0nlyUke','2022/06/30','2002/08/25','Charley Yang');
    INSERT INTO Persona VALUES (23,'residente321321@gmail.com','13calle13','2022/04/12','1978/02/23','René Pérez');
    INSERT INTO Persona VALUES (24,'ramonayalajuanes@gmail.com','blackCamisa123','2022/09/08','1977/02/03','Ramón Ayala');
    INSERT INTO Persona VALUES (25,'invisibleraro@gmail.com','21091962','2022/12/25','1962/09/22','Roberto Musso');
    INSERT INTO Persona VALUES (26,'anticristo666@gmail.com','AbraKadabra','2023/02/17','1972/10/17','Marshall Mathers III');
    INSERT INTO Persona VALUES (27,'imaginedragons123@gmil.com','Squiz0fr3nia','2023/05/03','1987/07/14','Dan Reynolds');
    INSERT INTO Persona VALUES (28,'JuanCamisaNegra@gmail.com','123321Abc','2023/07/29','1972/08/09','Juan Aristizába');
    INSERT INTO Persona VALUES (29,'PickeyPickey@gmail.com','pikipiki','2023/10/11', '1982/05/03','Edgardo Miranda');
    INSERT INTO Persona VALUES (30,'AlejandroFrki@gmail.com','FreakForeber','2024-01-04', '1998-05-06', 'Alejandro Torres'); 


-- Inserts Usuarios
    -- Usuarios 
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
    -- Mixtos
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

-- Inserts Artistas
    -- Mixtos
     -- Adam Met
    INSERT INTO Artista VALUES (11,'Adam Met (nacido el 27 de agosto de 1990) es un músico, educador y activista climático estadounidense. Es ampliamente conocido como el bajista y vocalista de apoyo de la exitosa banda de pop indie AJR, la cual cofundó con sus hermanos Jack y Ryan. Además de su carrera musical, posee un doctorado en derecho y es el director de la organización sin fines de lucro Planet Reimagined.');
    -- David Paredes
    INSERT INTO Artista VALUES (12, 'David Paredes  fue un icónico cantante, compositor y actor británico. Nacido el 28 de junio de 1995 en Londres, destacó como el "camaleón del rock" por su constante reinvención visual y musical. '); 
    -- Vicente Fernández
    INSERT INTO Artista VALUES (13,'Vicente Fernández (1940-2021), conocido como "El Charro de Huentitán" y "El Sinatra de las Rancheras", fue un ícono indiscutible de la música ranchera y la cultura mexicana. Vendió más de 70 millones de discos, protagonizó 25 películas y dejó un legado de himnos inmortales como "Volver, Volver".'); 
    -- Peter Hernandez
    INSERT INTO Artista VALUES (14,'Peter Gene Hernandez, conocido mundialmente como Bruno Mars, nació el 8 de octubre de 1985 en Honolulu, Hawái. Es un icónico cantautor, productor y bailarín estadounidense, famoso por su versatilidad y éxitos mundiales como "Just the Way You Are" y "Locked Out of Heaven".'); 
    -- Jacques Webster
    INSERT INTO Artista VALUES (15,'Travis Scott, nacido como Jacques Bermon Webster II el 30 de abril de 1991 en Houston, Texas, es un rapero, cantante y productor estadounidense. Famoso por su estilo psicodélico y energéticas presentaciones, fundó el sello discográfico Cactus Jack Records y ha lanzado discos icónicos como Rodeo, Astroworld y Utopia.'); 
    -- Michael Jackson
    INSERT INTO Artista VALUES (16,'Michael Joseph Jackson (1958–2009) fue un cantante, compositor y bailarín estadounidense apodado el «Rey del Pop». Comenzó su carrera musical en 1964 en The Jackson 5, logrando el estrellato mundial gracias a éxitos como ABC. Transformó la industria con álbumes como Thriller (1982) y popularizó pasos de baile como el moonwalk.'); 
    -- Miguel Martos
    INSERT INTO Artista VALUES (17,'Miguel Ángel Martos Bello, conocido artísticamente como Zarcort (nacido el 1 de febrero de 1991 en Almería, España), es un destacado rapero, compositor y creador de contenido, pionero en la creación de rap y rap-plays basados en videojuegos.'); 
    -- Juan Ozuna
    INSERT INTO Artista VALUES (18,'Juan Carlos Ozuna Rosado, conocido como Ozuna, es un famoso cantautor puertorriqueño de reguetón, trap y pop urbano. Nacido el 13 de marzo de 1992 en San Juan, Puerto Rico, saltó a la fama mundial por su distintiva voz aguda y su capacidad para fusionar estilos'); 
    -- Andre Young
    INSERT INTO Artista VALUES (19,'Dr. Dre (André Romelle Young, nacido el 18 de febrero de 1965) es un rapero, productor discográfico y empresario estadounidense nacido en Compton, California. Es una figura fundamental en la historia del hip-hop, célebre por popularizar el gangsta rap y crear el subgénero G-Funk, así como por impulsar las carreras de leyendas como Snoop Dogg y Eminem.'); 
    -- Javier Gutiérrez
    INSERT INTO Artista VALUES (20,'Mala Fe, cuyo nombre real es Javier Ignacio Gutiérrez, es un cantante, compositor y productor dominicano nacido en Puerto Plata, República Dominicana. Es reconocido internacionalmente por fusionar el merengue tradicional con ritmos urbanos. saltó a la fama mundial en 1999 con su icónico éxito bailable "La vaca".'); 
    -- Artistas
    -- Shakira  Mebarak
    INSERT INTO Artista VALUES (21,'Shakira Isabel Mebarak Ripoll (nacida en Barranquilla el 2 de febrero de 1977) es una cantautora, productora y bailarina colombiana. Conocida como la "Reina del Pop Latino", es una de las artistas más vendedoras de la historia, destacando por fusionar ritmos latinos, pop y rock.'); 
    -- Charley Yang
    INSERT INTO Artista VALUES (22, 'BoyWithUke (cuyo nombre real es Charley Yang) es un cantante, músico y compositor estadounidense nacido el 25 de agosto de 2002 en Corea del Sur y criado en Boston, Massachusetts. Saltó a la fama en TikTok gracias a sus canciones virales, donde combinaba el ukelele con ritmos pop y letras sobre crecer en la era digital.'); 
    -- René Pérez
    INSERT INTO Artista VALUES (23,'René Pérez Joglar (San Juan, 23 de febrero de 1978), conocido como [R]esidente, es un rapero, cantautor, productor y activista puertorriqueño. Fundador y vocalista de Calle 13, se ha consolidado como uno de los máximos exponentes de la música latina con un récord histórico de galardones.'); 
    -- Ramón Ayala
    INSERT INTO Artista VALUES (24,'Ramón Luis Ayala Rodríguez, conocido como Daddy Yankee, es un cantante, compositor y empresario puertorriqueño nacido el 3 de febrero de 1976 en San Juan. Ampliamente considerado como el «padre del reguetón», el artista saltó a la fama mundial con éxitos como "Gasolina" y "Despacito", antes de anunciar su retiro de la música urbana en 2023 para dedicarse a su fe cristiana'); 
    -- Roberto Musso
    INSERT INTO Artista VALUES (25,'Roberto Musso (nacido el 21 de noviembre de 1961 en Montevideo) es un músico, compositor y exingeniero en sistemas uruguayo. Es reconocido internacionalmente por ser el líder, vocalista y guitarrista de la mítica banda de rock latino El Cuarteto de Nos.'); 
    -- Marshall Mathers III
    INSERT INTO Artista VALUES (26,'Marshall Bruce Mathers III, conocido artísticamente como Eminem, es un rapero, compositor y productor estadounidense. Nacido en Misuri el 17 de octubre de 1972, creció en Detroit y superó una dura infancia para convertirse en uno de los artistas más vendidos e influyentes de todos los tiempos.'); 
    -- Dan Reynolds
    INSERT INTO Artista VALUES (27,'Daniel Coulter Reynolds (nacido el 14 de julio de 1987 en Las Vegas, Nevada) es un cantante, compositor y músico estadounidense, mundialmente famoso por ser el vocalista principal y miembro fundador de la banda de pop rock Imagine Dragons.'); 
    -- Juan Aristizába
    INSERT INTO Artista VALUES (28,'Juanes (cuyo nombre real es Juan Esteban Aristizábal Vásquez) es un cantautor y músico colombiano nacido en Medellín el 9 de agosto de 1972. Es ampliamente reconocido por fusionar el rock y el pop latino con los ritmos tradicionales colombianos, consolidándose como una de las figuras más importantes de la música en español con múltiples premios Grammy y Grammy Latinos.'); 
   -- Edgardo Miranda
    INSERT INTO Artista VALUES (29,'Joey Montana, cuyo nombre real es Edgardo Antonio Miranda Beiró, es un exitoso cantautor y productor panameño de música urbana. Nacido el 3 de mayo de 1982 en Chiriquí, Panamá, saltó a la fama internacional como miembro del icónico grupo La Factoría y luego consolidó su carrera como solista con grandes éxitos como "Picky".'); 
    -- Alejandro Torres
    INSERT INTO Artista VALUES (30,'Alejandro Torres Martín, conocido artísticamente como Keyblade, es un músico y creador de contenido español nacido el 6 de mayo de 1998 en Gran Canaria. Es una de las figuras más destacadas del "rap friki", famoso en YouTube por sus temas sobre videojuegos, anime y sus virales Épicas Batallas de Rap del Frikismo.'); 

-- Inserts Archivos_Audio
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
-- Inserts Canciones
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
-- Inserts Album
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
-- Inserts Playlist
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

--Inserts Escucha
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

-- Inserts Contiene
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
