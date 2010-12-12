-- un goro crater fixes

-- fix quest 9051
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '6498' WHERE `entry` =9051;
DELETE FROM `creature_ai_scripts` WHERE `id` =649802;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES
('649802', '6498', '8', '100', '1', '7211', '-1', '33', '6498', '6', 'Quest Credit for Quest 9051'); 

-- fix NPC 28601 & quest 12547
DELETE FROM `creature` WHERE `guid` =200041;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
('200041', '28601', '1', '-6027.365723', '-1250.199097', '-146.764404', '3.122257', '300');

DELETE FROM `creature_loot_template` WHERE `entry` = 28601 AND `item` = 38708;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(28601, 38708, -100, 0, 1, 1, 0, 0, 0);

UPDATE `creature_template` SET `minlevel` = '78', `maxlevel` = '78', `minhealth` = '11770', `maxhealth` = '11770', `minmana` = '7618', `maxmana` = '7618', `faction_A` = '21', `faction_H` = '21', `lootid` = '28601', `questItem1` = '0' WHERE `entry` =28601; 
