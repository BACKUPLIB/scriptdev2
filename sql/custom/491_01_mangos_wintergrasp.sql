-- map wintergrasp fixes

-- Add npc 32294 in front of vault of archavon
	DELETE FROM creature WHERE guid = 240008;
	INSERT INTO creature(guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
	(240008, 32294, 571, 1, 1, 0, 0, 5383.459961, 2895.514648, 409.240356, 3.516036, 500, 1, 0, 12.600, 0, 0, 0);
