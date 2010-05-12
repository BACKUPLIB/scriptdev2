UPDATE creature_template SET lootid=24048, mingold=2546, maxgold=3432 WHERE entry=24048;

DELETE FROM creature_loot_template WHERE entry=24048;
INSERT INTO creature_loot_template VALUES
	(24048, 33187, -100, 0, 1, 1, 0, 0, 0), -- Whisper Gulch Gem
	(24048, 33188, -100, 1, 1, 1, 0, 0, 0), -- Whisper Gulch Ore Fragment
	(24048, 33447, 7, 2, 1, 1, 0, 0, 0), -- Runic Healing Potion
	(24048, 24231, 14, 2, 1, 1, 0, 0, 0); -- Coarse Snuff

DELETE FROM creature WHERE id=24048;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
	(24048, 571, 1, 1, 0, 1, 1758.436890, -3337.399658, 80.453804, 2.559472, 300, 0, 0, 9291, 0, 0, 0);