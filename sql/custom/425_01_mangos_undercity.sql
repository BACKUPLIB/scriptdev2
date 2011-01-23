-- map undercity fixes

-- spawn the Portal to Blasted Lands in undercity 
DELETE FROM gameobject WHERE id=195142 AND map = 0;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(160010, 195142, 0, 1749.424216, 85.231865, -62.268955, 2.328349, 180, 255, 1);
