-- map orgrimmar fixes

-- spawn the Portal to Blasted Lands in orgrimmar 
DELETE FROM gameobject WHERE id=195142 AND map = 1 AND guid!=56764;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(160009, 195142, 1, 1465.295068, -4214.662598, 59.221451, 5.256645, 180, 255, 1);
