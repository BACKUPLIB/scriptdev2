-- delete achievements of closed bc heros
DELETE FROM `character_achievement` WHERE `achievement` IN(667, 669, 668, 670, 673, 675, 679, 672, 676, 680, 1287);
-- close bc heros
UPDATE `creature` SET `spawnMask` = 1 WHERE `map` IN (543, 547, 542, 546, 560, 555, 554, 558, 269, 553);
