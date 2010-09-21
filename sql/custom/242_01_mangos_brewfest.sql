-- brewfest fixes

-- spawn some brewfest NPCs
DELETE FROM `creature` WHERE `guid` BETWEEN 900050 AND 900056;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('900050', '27215', '0', '1', '1', '0', '0', '-5133.053223', '-619.561096', '398.656982', '2.361994', '120', '5', '0', '1', '0', '0', '0'),
('900051', '26719', '230', '1', '1', '0', '0', '854.119080', '-183.445175', '-49.755642', '1.967724', '120', '5', '0', '1', '0', '0', '0'),
('900052', '28329', '1', '1', '1', '0', '0', '771.058350', '-4549.744629', '4.017702', '6.005769', '120', '5', '0', '1', '0', '0', '0'),
('900053', '27584', '0', '1', '1', '0', '0', '-5618.082520', '-507.740997', '403.737823', '0.993043', '120', '5', '0', '1', '0', '0', '0'),
('900054', '23872', '230', '1', '1', '0', '0', '888.573', '-172.031', '-43.9241', '3.77057', '86400', '1200', '0', '1', '0', '0', '0'),
('900055', '27216', '1', '1', '1', '0', '0', '1209.018677', '-4268.148926', '22.328518', '4.146745', '120', '5', '0', '1', '0', '0', '0'),
('900056', '24495', '1', '1', '1', '0', '0', '1171.6308597', '-4293.015625', '21.274490', '0.007695', '120', '5', '0', '1', '0', '0', '0');
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN 900050 AND 900056 OR `guid` IN (89128,104369,90193,104780);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES 
('900050', '26'),
('900051', '26'),
('900052', '26'),
('900053', '26'),
('900054', '26'),
('900055', '26'),
('900056', '26'),
('89128', '26'),
('104369', '26'),
('90193', '26'),
('104780', '26');
DELETE FROM `creature_questrelation` WHERE `id` = 28329 AND `quest` = 12318;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('28329', '12318');

-- update Coren Direbrew and mobs
UPDATE `creature_template` SET `AIName` = "", `ScriptName` = "boss_coren_direbrew", lootid = 23872, `unit_flags` = 33554434, mechanic_immune_mask = 617299803, flags_extra = 0, `faction_A` = 735, `faction_H` = 735 WHERE `entry` = 23872;
UPDATE `creature_template` SET `faction_A` = 674, `faction_H` = 674, `dmg_multiplier` = 3, `flags_extra` = 0 WHERE `entry` = 23795;
-- add eventAI for Coren Direbrew mobs
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (26764,26776,26822);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (26764,26776,26822);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
('2676401','26764','0','0','100','3','1000','1000','4000','7000','11','47333','1','0','Ilsa Direbrew - Send First Mug'),
('2682201','26822','0','0','100','3','1000','1000','9000','15000','11','47442','1','0','Ursula Direbrew - Barreled'),
('2677601','26776','4','0','100','2','0','0','0','0','11','50313','1','16','Direbrew minion - Mole Machine Emerge');
-- add loot for Coren Direbrew
DELETE FROM `creature_loot_template` WHERE `entry` = 23872;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES
(23872,38280,100,0,1,1,0,0,0),
(23872,49078,0,1,1,1,0,0,0),
(23872,49080,0,1,1,1,0,0,0),
(23872,49076,0,1,1,1,0,0,0),
(23872,49074,0,1,1,1,0,0,0),
(23872,49116,0,1,1,1,0,0,0),
(23872,49118,0,1,1,1,0,0,0),
(23872,37863,4,2,1,1,0,0,0),
(23872,48663,4,2,1,1,0,0,0),
(23872,49120,4,2,1,1,0,0,0),
(23872,33977,2,3,1,1,0,0,0),
(23872,37828,2,3,1,1,0,0,0);
