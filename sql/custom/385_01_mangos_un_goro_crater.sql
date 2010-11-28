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
