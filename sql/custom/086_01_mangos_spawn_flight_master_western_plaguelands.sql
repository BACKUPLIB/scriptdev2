/* Spawnt den Flugmeister in den westlichen Pestlaendern und setzt dessen flags */
UPDATE creature_Template SET npcflag=8195, unit_flags=512 WHERE entry=37888;

DELETE FROM creature WHERE id=37888;
INSERT INTO creature (id, map, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
	(37888, 0, 1943.256104, -2562.016113, 60.812122, 2.372981, 900, 31905);