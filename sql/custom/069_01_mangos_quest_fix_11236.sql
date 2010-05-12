UPDATE creature_template SET lootid=24018, mingold=3546, maxgold=4432 WHERE entry=24018;

DELETE FROM creature_loot_template WHERE entry=24018;
INSERT INTO creature_loot_template VALUES
	(24018, 34090, 100, 0, 1, 1, 0, 0, 0); -- Mezhen's Writings

DELETE FROM creature WHERE id=24018;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
	(24018, 571, 1, 1, 0, 1, 2601.579590, -3731.499756, 244.898254, 0.719275, 300, 0, 0, 9291, 0, 0, 0);