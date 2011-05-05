-- fixes for utgarde pinnacle

UPDATE `creature_template` SET `ScriptName` = 'npc_spectator' WHERE `entry` = '26667';
UPDATE `creature_template` SET `AIName` = 'NUllAI' WHERE `entry` = '27327';
UPDATE `gameobject_template` SET `ScriptName` = 'go_stasis_generator' WHERE `entry` = '188593';
UPDATE `gameobject_template` SET `ScriptName` = 'go_skaldi_harpoonlauncher' WHERE `entry` IN ('192175','192176','192177');

-- some spell fixes for svala fight
DELETE FROM spell_script_target WHERE entry = 48331;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES ('48331','1','27327');

DELETE FROM spell_target_position WHERE id IN ('48271','48274','48275');
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES 
('48271','575','296.2','-354.5','90.9','1.554'),
('48274','575','302.0','-354.9','90.5','2.143'),
('48275','575','290.3','-353.8','90.5','1.008');

-- additional eventAI for gortok
DELETE FROM `creature_ai_scripts` WHERE `id` IN ('2668305','2668606','2668405','2668506');
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES
('2668305','26683','4','0','100','7','28','0','16245','Frenzied Worgmen - Remove Animation Freeze Spell on Aggro'),
('2668606','26686','4','0','100','7','28','0','16245','Ferocious Rhino - Remove Animation Freeze Spell on Aggro'),
('2668405','26684','4','0','100','7','28','0','16245','Ravenous Furbolg - Remove Animation Freeze Spell on Aggro'),
('2668506','26685','4','0','100','7','28','0','16245','Massive Jormungar - Remove Animation Freeze Spell on Aggro');
-- decrease timers
UPDATE `creature_ai_scripts` SET `event_param1` = '1000',`event_param2` = '1500',`event_param3` = '5000',`event_param4` = '9000' WHERE `id` IN ('2668301','2668302','2668401','2668402','2668603','2668604');
UPDATE `creature_ai_scripts` SET `event_param1` = '500',`event_param2` = '1000',`event_param3` = '9000',`event_param4` = '12000' WHERE `id` IN ('2668403','2668501');

-- add creature_template for orb mob
INSERT IGNORE INTO `creature_template` (`entry`,`modelid_1`,`modelid_2`,`name`,`faction_A`,`faction_H`,`InhabitType`,`unit_flags`) VALUES 
('26688','18783','16925','stasis orb','35','35','4','33554434');

-- add harpoon loot for skadi mob
DELETE FROM `creature_loot_template` WHERE `item` = '37372';
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES 
('26692','37372','100','1','1');
UPDATE `creature_template` SET `lootid` = '26692' WHERE `entry` = '26692';

-- fix soul fount mob in ymiron fight
UPDATE `creature_template` SET `minlevel` = '80', `maxlevel` = '83', `unit_flags` = '2', `faction_A` = '14', `faction_H` = '14', `MovementType` = '1', `ScriptName` = 'mob_spirit_fount' WHERE `entry` = '27339';
