UPDATE creature_loot_template SET ChanceOrQuestChance=2.3 WHERE entry=30510 AND item=21524;
UPDATE creature_loot_template SET ChanceOrQuestChance=0, groupid=1 WHERE entry=29304 AND item=35584;

DELETE FROM creature_loot_template WHERE entry=29932;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount) VALUES
	(29932, 43313, 0, 1, 1, 1),
	(29932, 43311, 0, 1, 1, 1),
	(29932, 43312, 0, 1, 1, 1),
	(29932, 43310, 0, 1, 1, 1),
	(29932, 45624, 100, 2, 1, 1),
	(29932, 43228, 23.8, 0, 1, 4);

UPDATE creature_template SET lootid=29932 WHERE entry=29932;
UPDATE creature_template SET lootid=31673 WHERE entry=31673;
