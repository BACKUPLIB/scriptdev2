-- instance culling of stratholme fixes

-- open instance "culling of stratholme"
UPDATE `instance_template` SET `ScriptName` = 'instance_culling_of_stratholme' WHERE map=595;

-- Remove old versions
-- do not know if this is needed
DELETE FROM `creature` WHERE `guid` IN (4456649,4456653,4458724,4458725,4458738,4458739,4458740,4458741,4459981,4459615);
DELETE FROM `creature` WHERE `id` IN (27731,27734,28249,27736,27915,30571,26499,26497,26528,27891,27892,27884,32273,28439);

UPDATE `creature` SET `spawntimesecs`= 36000 WHERE `id` IN (31127, 31126, 28167, 28169);
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('58825','1','27733');
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES('35481','4100','0','0','0','0','0','1','1');
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES('35480','4100','0','0','0','0','0','0','1');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('58825', '1', '27733');

UPDATE `creature_template` SET `ScriptName`='npc_mike' WHERE entry=30571;
UPDATE `creature_template` SET `ScriptName`='npc_chromi_start' WHERE entry=26527;
UPDATE `creature_template` SET `ScriptName`='npc_roger' WHERE entry=27903;
UPDATE `creature_template` SET `ScriptName`='npc_morigan' WHERE entry=27877;
UPDATE `creature_template` SET `ScriptName`='npc_stratholme_crates' WHERE entry=30996;
UPDATE `creature_template` SET `ScriptName`='npc_jena' WHERE entry=27885;
UPDATE `creature_template` SET `ScriptName`='npc_malcolm' WHERE entry=27891;
UPDATE `creature_template` SET `ScriptName`='npc_bartleby_cs' WHERE entry=27907;
UPDATE `creature_template` SET `ScriptName`='npc_chromi_middle' WHERE entry=27915;
UPDATE `creature_template` SET `ScriptName`='npc_uther' WHERE entry=26528;
UPDATE `creature_template` SET `ScriptName`='npc_arthas' WHERE entry=26499;
UPDATE `creature_template` SET `ScriptName`='npc_arthas_priest' WHERE entry=27747;
UPDATE `creature_template` SET `ScriptName`='npc_arthas_marine' WHERE entry=27745;
UPDATE `creature_template` SET `ScriptName`='npc_dark_conversion' WHERE entry IN (31127, 31126, 28167, 28169);
UPDATE `creature_template` SET `ScriptName`='npc_cs_gnoul' WHERE entry=28249;
UPDATE `creature_template` SET `ScriptName`='npc_cs_necromancer' WHERE entry=28200;
UPDATE `creature_template` SET `ScriptName`='npc_cs_field' WHERE entry=27734;
UPDATE `creature_template` SET `ScriptName`='npc_cs_acolyte' WHERE entry=27731;
UPDATE `creature_template` SET `ScriptName`='npc_cs_butcher' WHERE entry=27736;
UPDATE `creature_template` SET `ScriptName`='boss_meathook' WHERE entry=26529;
UPDATE `creature_template` SET `ScriptName`='boss_salramm' WHERE entry=26530;
UPDATE `creature_template` SET `ScriptName`='npc_salramm_gnoul' WHERE entry=27733;
UPDATE `creature_template` SET `ScriptName`='boss_lord_epoch' WHERE entry=26532;
UPDATE `creature_template` SET `ScriptName`='boss_malganis' WHERE entry=26533;
UPDATE `creature_template` SET `ScriptName`='npc_time_ri	ftCS' WHERE entry=28409;
UPDATE `creature_template` SET `ScriptName`='boss_infinite_corruptor' WHERE entry=32273;

DELETE FROM `creature` WHERE `id` IN (27915, 26499, 26497, 26528, 27891, 27892, 32273, 28439);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(230018, 27915, 595, 3, 1, 0, 0, 1812.49, 1284.81, 142.248, 4.03364, 300, 0, 0, 17010, 0, 0, 0),
(230019, 26499, 595, 3, 1, 0, 1613, 1920.87, 1287.12, 142.935, 6.25562, 43200, 0, 0, 44100, 7988, 0, 0),
(230020, 26497, 595, 3, 1, 0, 1221, 1896.39, 1292.91, 143.711, 0.016332, 25, 5, 0, 100800, 88140, 0, 0),
(230021, 26528, 595, 3, 1, 0, 1819, 1761.42, 1285.75, 139.945, 4.93874, 25, 5, 0, 126000, 59910, 0, 0),
(230022, 27891, 595, 3, 1, 0, 0, 1603.38, 805.988, 123.272, 1.90688, 25, 5, 0, 8982, 0, 0, 0),
(230023, 27892, 595, 3, 1, 0, 0, 1602.3, 809.385, 123.454, 5.02884, 25, 5, 0, 8982, 0, 0, 0),
(230024, 32273, 595, 2, 1, 0, 1839, 2330.93, 1275.59, 132.848, 3.60489, 86400, 5, 0, 417911, 0, 0, 0),
(230025, 28439, 595, 2, 1, 0, 0, 2336.56, 1277.9, 132.885, 3.47923, 25, 5, 0, 1, 0, 0, 0);

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(26529,26530,26532,26533,32273,31211,31212,31215,31217,32313);

-- some additional fixxes for last bosses chest
DELETE FROM gameobject_template WHERE entry IN (250200, 250201);
INSERT INTO gameobject_template (entry, type, displayId, name, questItem1, data0, data1, data3, data11, data12, data13, data15) VALUES 
	(250200, 3, 1387, 'Dark Runed Chest', 0, 1634, 24556, 1, 1, 0, 1, 1),
	(250201, 3, 1387, 'Dark Runed Chest', 43697, 1634, 24589, 1, 1, 0, 1, 1);

DELETE FROM gameobject WHERE guid IN (67603, 82708);

-- add creature_onkill_reputation
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN ('31201','31208','31178','31215','31184','31203','31206','32273','31202','31211','31199','31200','31188','31187','31217','31212','31180','31179');
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
('31201', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'), 
('31208', '1037', '1052', '7', '0', '2', '7', '0', '2', '1'), 
('31178', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31215', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31184', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31203', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31206', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('32273', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31202', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31211', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31199', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'), 
('31200', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'), 
('31188', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31187', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31217', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31212', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31180', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31179', '1037', '1052', '7', '0', '15', '7', '0', '15', '1');
