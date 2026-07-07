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