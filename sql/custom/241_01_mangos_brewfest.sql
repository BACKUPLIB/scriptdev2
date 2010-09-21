-- brewfest fixes

-- spawn some brewfest NPCs
DELETE FROM `creature` WHERE `guid` BETWEEN 900050 AND 900056;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('900050', '27215', '0', '1', '1', '0', '0', '-5133.053223', '-619.561096', '398.656982', '2.361994', '120', '5', '0', '1', '0', '0', '0'),
('900051', '26719', '230', '1', '1', '0', '0', '854.119080', '-183.445175', '-49.755642', '1.967724', '120', '5', '0', '1', '0', '0', '0'),
('900052', '28329', '1', '1', '1', '0', '0', '771.058350', '-4549.744629', '4.017702', '6.005769', '120', '5', '0', '1', '0', '0', '0'),
('900053', '27584', '0', '1', '1', '0', '0', '-5618.082520', '-507.740997', '403.737823', '0.993043', '120', '5', '0', '1', '0', '0', '0'),
('900054', '23872', '230', '1', '1', '0', '0', '912.687073', '-158.376648', '-49.759449', '2.839149', '86400', '5', '0', '1', '0', '0', '0'),
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

-- add EventAI for NPC 23872 (Coren Direbrew)
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 23872;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 23872;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2387201,23872,0,0,100,1,0,1000,10000,15000,11,47310,1,0,"Coren Direbrew - Cast Direbrews Disarm");
