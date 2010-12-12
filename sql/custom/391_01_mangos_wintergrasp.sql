-- Add npc 32294 in front of vault of archavon
-- Need the 'mangos_npc_32294.sql' from wotlk temporary
DELETE FROM creature WHERE guid = 240008;
INSERT INTO creature(guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES(240008, 32294, 571, 1, 1, 0, 0, 5383.459961, 2895.514648, 409.240356, 3.516036, 500, 1, 0, 12.600, 0, 0, 0);

-- fix loot_template of NPC 34300
UPDATE `creature_template` SET `lootid` = '34300' WHERE `entry` =34300;

DELETE FROM `creature_loot_template` WHERE `entry` =34300;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34300', '26001', '3', '1', '-26001', '1', '0', '0', '0'),
('34300', '26002', '3', '1', '-26002', '1', '0', '0', '0'),
('34300', '26013', '1', '1', '-26013', '1', '0', '0', '0'),
('34300', '26014', '1', '1', '-26014', '1', '0', '0', '0'),
('34300', '26015', '1', '1', '-26015', '1', '0', '0', '0'),
('34300', '37704', '97.8', '0', '1', '3', '0', '0', '0'),
('34300', '44809', '-100', '0', '1', '5', '0', '0', '0'),
('34300', '43324', '-100', '0', '1', '5', '0', '0', '0'),
('34300', '44774', '79.7', '0', '1', '1', '0', '0', '0'),
('34300', '44775', '18.2', '0', '1', '1', '0', '0', '0'),
('34300', '39516', '0.2', '0', '1', '1', '0', '0', '0');
