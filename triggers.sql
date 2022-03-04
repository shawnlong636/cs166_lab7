--CREATE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION addPartNo () 
RETURNS "trigger" AS
$BODY$
BEGIN
	New.part_number:=nextval('part_number_seq');
	Return NEW;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER insertPart BEFORE INSERT ON part_nyc
	FOR EACH ROW EXECUTE PROCEDURE  addPartNo();
