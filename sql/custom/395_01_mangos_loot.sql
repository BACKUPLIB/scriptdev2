-- add item 45912 to loot_template of some creatures
DELETE FROM `creature_loot_template` WHERE `item` =45912;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
('16018', '45912', '2', '1', '1'), 
('15975', '45912', '1.2', '1', '1'), 
('30083', '45912', '1.5', '1', '1'), 
('30287', '45912', '0.4', '1', '1'), 
('26830', '45912', '0.7', '1', '1'), 
('26635', '45912', '0.5', '1', '1'), 
('24812', '45912', '1.3', '1', '1'), 
('28249', '45912', '0.5', '1', '1'), 
('29735', '45912', '0.2', '1', '1'); 