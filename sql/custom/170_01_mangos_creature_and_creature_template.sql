UPDATE creature_template SET ScriptName='boss_eck_the_ferocious' WHERE entry=29932;
UPDATE creature SET position_x=1649.685669, position_y=942.886780, position_z=107.203957 WHERE guid=127203;
DELETE FROM creature WHERE id=29932;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
	(29932, 604, 2, 1, 26644, 0, 1640.287964, 932.298462, 107.414001, 0.864934, 900000, 0, 0, 431392, 0, 0, 0);
