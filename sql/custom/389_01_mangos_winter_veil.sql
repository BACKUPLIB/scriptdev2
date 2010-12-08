-- fixes for winter veil event

-- fix NPC winter reveler & achievement 1687
UPDATE `creature_template` SET `ScriptName` = 'npc_winter_reveler' WHERE `entry` =15760;

-- fix winter veil gifts & achievement 1689
DELETE FROM `game_event` WHERE `entry` =50;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES
('50', '2010-12-25 05:59:36', '2020-12-30 22:59:36', '525600', '11520', '0', 'Bescherung');

DELETE FROM `gameobject` WHERE `guid` BETWEEN 190000 AND 190011;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `state`) VALUES
('190000', '180793', '0', '-4915.61', '-980.36', '501.88', '1'),
('190001', '180793', '1', '1624.81', '-4416.98', '15.26','1'),
('190002', '180743', '0', '-4917.46', '-980.76', '501.51', '1'),
('190003', '180743', '1', '1621.76', '-4415.77', '14.55', '1'),
('190004', '180747', '0', '-4919.81', '-980.70', '501.46', '1'),
('190005', '180747', '1', '1620.80', '-4413.35', '14.46', '1'),
('190006', '180746', '0', '-4921.23', '-982.20', '501.46', '1'),
('190007', '180746', '1', '1628.18', '-4413.28', '15.93', '1'),
('190008', '180748', '0', '-4914.63', '-978.01', '501.79', '1'),
('190009', '180748', '1', '1627.64', '-4415.49', '15.87', '1'), 
('190010', '187236', '0', '-4916.55', '-979.78', '501.45', '1'),
('190011', '187236', '1', '1623.08', '-4416.98', '14.80', '1');

DELETE FROM `game_event_gameobject` WHERE `event` = 50;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
('190000', '50'), ('190001', '50'), ('190002', '50'), ('190003', '50'), ('190004', '50'), ('190005', '50'),
('190006', '50'), ('190007', '50'), ('190008', '50'), ('190009', '50'), ('190010', '50'), ('190011', '50');

DELETE FROM `gameobject_questrelation` WHERE `id` IN('187236', '180746');
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
('187236', '11528'), ('180746', '8788');

DELETE FROM `gameobject_involvedrelation` WHERE `id` IN('187236', '180746');
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
('187236', '11528'), ('180746', '8788');


-- fix achievements 1685 & 1686
-- fix item 26004
DELETE FROM `spell_script_target` WHERE entry = 26004;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('26004', '1', '31261'),
('26004', '1', '5661'),
('26004', '1', '26044'),
('26004', '1', '739'),
('26004', '1', '927'),
('26004', '1', '8140'),
('26004', '1', '1444'),
('26004', '1', '5489'),
('26004', '1', '12336'),
('26004', '1', '1351'),
('26004', '1', '5484');

-- fix NPC 31216
DELETE FROM `creature` WHERE `id` = 31216;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
('260000', '31216', '571', '8243.66', '1089.81', '816.15', '3.17');

-- fix special winter veil loot for some bosses
DELETE FROM `creature_loot_template` WHERE `entry` IN (26731, 29310, 27655) AND `item` IN (21524, 21525);
INSERT INTO `creature_loot_template` (`entry`, `item`, `lootcondition`, `condition_value1`) VALUES
('26731', '21524', '12', '2'),
('29310', '21524', '12', '2'),
('27655', '21525', '12', '2');
