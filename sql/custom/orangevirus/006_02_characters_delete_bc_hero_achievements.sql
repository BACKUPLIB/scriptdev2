-- delete achievements of closed bc heros
DELETE FROM `character_achievement` WHERE `achievement` IN(667, 669, 668, 670, 673, 675, 679, 672, 676, 680, 1287);
