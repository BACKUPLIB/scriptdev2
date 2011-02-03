-- instance ulduar fixes

-- kologarn
	DELETE FROM creature WHERE id IN (32933, 32934, 232933);
	INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES (9327991, 32933, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0),
	(9327992, 32934, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0);

-- General Vezax 
	UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =33449;

-- Rubble
	UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =33908;

-- Rubble Stalker Kologarn
	UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =33942;

-- Razorscale Devouring Flame Stalker
	UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =34189;

-- Flash Freeze
	UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =33353;
