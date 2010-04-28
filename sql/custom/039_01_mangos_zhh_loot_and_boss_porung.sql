# Blutchwache Porung
DELETE FROM creature_loot_template WHERE entry=20923;
INSERT INTO creature_loot_template VALUES
	(20923, 29434, 100, 0,  1, 1, 0, 0, 0),
	(20923, 30709, 0, 4,  1, 1, 0, 0, 0),
	(20923, 30707, 0, 4,  1, 1, 0, 0, 0),
	(20923, 30705, 0, 4,  1, 1, 0, 0, 0),
	(20923, 30708, 0, 4,  1, 1, 0, 0, 0);

UPDATE creature_template SET lootid=20923 WHERE entry=20923;
	
# Grosshexenmeister Nethekurse
DELETE FROM creature_loot_template WHERE entry=20568;
INSERT INTO creature_loot_template VALUES
	(20568, 29434, 100, 1,  1, 1, 0, 0, 0),
	(20568, 23735, -100, 0,  1, 1, 0, 0, 0),	
	(20568, 27517, 0, 4,  1, 1, 0, 0, 0),
	(20568, 27519, 0, 4,  1, 1, 0, 0, 0),
	(20568, 27518, 0, 4,  1, 1, 0, 0, 0),
	(20568, 27521, 0, 4,  1, 1, 0, 0, 0),
	(20568, 27520, 0, 4,  1, 1, 0, 0, 0),
	(20568, 30546, 9, 3,  1, 1, 0, 0, 0),
	(20568, 30548, 9, 3,  1, 1, 0, 0, 0),
	(20568, 30547, 9, 3,  1, 1, 0, 0, 0);

UPDATE creature_template SET lootid=20568 WHERE entry=20568;

# Kriegshetzer O'mrogg
DELETE FROM creature_loot_template WHERE entry=20596;
INSERT INTO creature_loot_template VALUES
	(20596, 29434, 100, 1,  1, 1, 0, 0, 0),	
	(20596, 27525, 0, 4,  1, 1, 0, 0, 0),
	(20596, 27524, 0, 4,  1, 1, 0, 0, 0),
	(20596, 27526, 0, 4,  1, 1, 0, 0, 0),
	(20596, 27802, 0, 4,  1, 1, 0, 0, 0),
	(20596, 27868, 0, 4,  1, 1, 0, 0, 0),
	(20596, 30546, 9, 3,  1, 1, 0, 0, 0),
	(20596, 30548, 9, 3,  1, 1, 0, 0, 0),
	(20596, 30547, 9, 3,  1, 1, 0, 0, 0),
	(20596, 30829, -100, 2,  1, 1, 0, 0, 0);

UPDATE creature_template SET lootid=20596 WHERE entry=20596;

UPDATE creature SET spawnMask=2 WHERE id=20923;
