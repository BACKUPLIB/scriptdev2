/* Spawnt die Portale auch in den Horde-Hauptstaedten, Orgrimmar und Unterstadt */
DELETE FROM gameobject WHERE id=195142 and guid!=56764;
INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
	(195142, 1, 1465.295068, -4214.662598, 59.221451, 5.256645, 180, 255, 1),
	(195142, 0, 1749.424216, 85.231865, -62.268955, 2.328349, 180, 255, 1);