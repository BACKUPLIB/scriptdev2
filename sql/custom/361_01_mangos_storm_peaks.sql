-- fixes for storm peak

-- fix quest 12843 (they took our men)
UPDATE `gameobject_template` SET `data2` = 191544 WHERE `entry` = 191544;
DELETE FROM `event_scripts` WHERE `id` = 191544;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES 
(191544,0,8,29466,1,"quest they took our men");
UPDATE creature_template SET ScriptName = "npc_goblin_prisoner" WHERE entry = 29466;
UPDATE gameobject_template SET Scriptname = "go_rusty_cage", data3 = 30000 WHERE entry = 191544;
-- Some goblins, who stand in their prison
UPDATE creature SET orientation = 3.8746 WHERE guid = 98286;
UPDATE creature SET orientation = 5.208 WHERE guid = 98303;

-- fix quest 12978
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29380 WHERE `entry` = 12978;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2937404,2937002);
UPDATE `creature_template` SET `KillCredit1` = 29380 WHERE `entry` IN (29370,29374);

-- fix quest 12957
UPDATE `creature_template` SET `ScriptName` = "npc_captive_mechagnome" WHERE `entry` = 29384;

-- fix npc 29757
UPDATE creature_template SET npcflag = 8192, rank = 1 WHERE entry = 29757;

-- fix npc 32491 & add its movement
UPDATE `creature_template` SET `MovementType` = '2', `InhabitType` = '4' WHERE `entry` =32491;
-- add spawn positions
DELETE FROM `creature` WHERE `id` = 32491;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(240002, 32491, 571, 1, 1, 0, 0, 6060.29, -1005.86, 569.525, 6.21674, 129600, 5, 0, 18900, 0, 0, 0),
(240003, 32491, 571, 1, 1, 0, 0, 7038.45, -238.624, 1303.42, 1.68184, 129600, 5, 0, 18900, 0, 0, 0),
(240004, 32491, 571, 1, 1, 0, 0, 7152.89, -248.941, 1294.03, 6.19788, 129600, 5, 0, 18900, 0, 0, 0),
(240005, 32491, 571, 1, 1, 0, 0, 7437.06, -62.7104, 1164.77, 5.97953, 129600, 5, 0, 18900, 0, 0, 0);
UPDATE `creature` SET `spawntimesecs` = '129600' WHERE `id` =32491;
-- add to pool, only one spawned at a time
DELETE FROM `pool_template` WHERE `entry` =1862;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('1862', '1', 'Northrend - Time-Lost Proto Drake');
DELETE FROM `pool_creature` WHERE `guid` IN ('240002', '240003', '240004', '240005');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('240002', '1862', '0', 'Northrend - Time-Lost Proto Drake - Spawn 1'),
('240003', '1862', '0', 'Northrend - Time-Lost Proto Drake - Spawn 2'),
('240004', '1862', '0', 'Northrend - Time-Lost Proto Drake - Spawn 3'),
('240005', '1862', '0', 'Northrend - Time-Lost Proto Drake - Spawn 4');
-- add creature movement
DELETE FROM `creature_movement` WHERE `id` IN ('240002', '240003', '240004', '240005');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
-- spawn 1
(240002, 1, 6060.29, -1005.86, 569.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.474182, 0, 0),
(240002, 2, 6402.82, -804.161, 718.604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.525233, 0, 0),
(240002, 3, 6581.66, -1052.87, 949.755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.3358, 0, 0),
(240002, 4, 6748.86, -1100.09, 1027.57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.2115, 0, 0),
(240002, 5, 6868.94, -993.644, 1031.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.632037, 0, 0),
(240002, 6, 7100.42, -985.92, 1109.41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.28298, 0, 0),
(240002, 7, 7166.06, -1017.48, 1138.02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.69001, 0, 0),
(240002, 8, 7238.24, -1106.54, 1177.43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.24234, 0, 0),
(240002, 9, 7292.46, -1346.35, 1271.93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.90856, 0, 0),
(240002, 10, 7287.32, -1513.46, 1304.7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.64545, 0, 0),
(240002, 11, 7201.97, -1676.53, 1293.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.20956, 0, 0),
(240002, 12, 6949.98, -1694.17, 1140.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.73302, 0, 0),
(240002, 13, 6691.05, -1458.9, 1015.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.37566, 0, 0),
(240002, 14, 6410.69, -1316.1, 748.992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.67018, 0, 0),
(240002, 15, 6127.12, -1135.9, 586.421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.55238, 0, 0),
-- spawn 2
('240003', '1', '7038.45', '-238.62', '1303.42', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '2', '7005.49', '-707.32', '1250.06', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '3', '6855.59', '-802.40', '1191.54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '4', '6436.86', '-760.75', '831.02', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '5', '6316.02', '-632.53', '740.69', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '6', '6347.80', '-67.84', '676.252', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '7', '6466.64', '124.99', '704.69', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('240003', '8', '7038.59', '-75.17', '1219.85', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
-- spawn 3
(240004, 1, 7152.89, -248.941, 1294.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.52373, 0, 0),
(240004, 2, 7088.05, -669.519, 1218.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.57086, 0, 0),
(240004, 3, 7318.49, -974.531, 1142.02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.3594, 0, 0),
(240004, 4, 8122.39, -1048.11, 1199.95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.19191, 0, 0),
(240004, 5, 8241.88, -968.216, 1169.89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.599873, 0, 0),
(240004, 6, 8283.26, -827.537, 1148.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.28474, 0, 0),
(240004, 7, 8223.3, -697.688, 1135.99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.00338, 0, 0),
(240004, 8, 7918.18, -441.53, 1101.13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.4432, 0, 0),
(240004, 9, 7697.49, -158.3, 1069.72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.23272, 0, 0),
(240004, 10, 7550.99, -74.5485, 1054.95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.62227, 0, 0),
(240004, 11, 7180.23, -97.5189, 1141.38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.20347, 0, 0),
-- spawn 4
(240005, 1, 7437.06, -62.7104, 1164.77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.63544, 0, 0),
(240005, 2, 7173.33, -206.025, 1099.87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.63936, 0, 0),
(240005, 3, 7094.74, -544.804, 1024.68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.48445, 0, 0),
(240005, 4, 7331.63, -960.895, 1071.65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.24629, 0, 0),
(240005, 5, 7442.31, -1283.94, 1138.24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.10571, 0, 0),
(240005, 6, 7743.61, -1744.91, 1469.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.30913, 0, 0),
(240005, 7, 8328.74, -1438.11, 1501.98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.599095, 0, 0),
(240005, 8, 8462.28, -1400.81, 1446.8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.112148, 0, 0),
(240005, 9, 8581.45, -1443.36, 1426.62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.82121, 0, 0),
(240005, 10, 8610.75, -1657.98, 1421.73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.6329, 0, 0),
(240005, 11, 8516.87, -1806.9, 1561.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.14989, 0, 0),
(240005, 12, 8447.09, -1956.19, 1565.66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.44834, 0, 0),
(240005, 13, 8610.88, -2115.98, 1550.26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.72459, 0, 0),
(240005, 14, 8810.23, -1779.39, 1418.04, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.988631, 0, 0),
(240005, 15, 8809.33, -1532.2, 1370.55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.57611, 0, 0),
(240005, 16, 8781.51, -908.148, 1139.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.62323, 0, 0),
(240005, 17, 8646.08, -527.066, 1076.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.91226, 0, 0),
(240005, 18, 8383.07, -102.627, 997.803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.19736, 0, 0),
(240005, 19, 7826.59, -282.358, 1099.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.454, 0, 0),
(240005, 20, 7645.51, -191.168, 1077.65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.69216, 0, 0),
(240005, 21, 7390.74, -159.285, 1018.29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.09114, 0, 0);

-- add npc 30469
-- manits bug #0003185
DELETE FROM `creature` WHERE `guid` = 220000;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('220000', '30469', '571', '1', '1', '0', '0', '7641.067383', '-1511.613770', '972.383728', '3.329370', '120', '5', '0', '1', '0', '0', '0');

-- fix quest 12905 / spell 72914
DELETE FROM `spell_area` WHERE `spell` IN (55012,72914);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES 
('55012', '4422', '12905', '1', '0', '0', '0', '2', '1'),
('55012', '4425', '12905', '1', '0', '0', '0', '2', '1'),
('55012', '4437', '12905', '1', '0', '0', '0', '2', '1'),
('55012', '4535', '12905', '1', '0', '0', '0', '2', '1'),
('72914', '4422', '12905', '1', '0', '0', '0', '2', '0'),
('72914', '4425', '12905', '1', '0', '0', '0', '2', '0'),
('72914', '4437', '12905', '1', '0', '0', '0', '2', '0'),
('72914', '4535', '12905', '1', '0', '0', '0', '2', '0');

-- fix quest 12998
-- update Data for NPC Overseer Narvir
UPDATE `creature_template` SET `minlevel` = '78',`maxlevel` = '79',`AIName` = 'EventAI', `minhealth` = '11770',`maxhealth` = '12175',`faction_A` = '2102',`faction_H` = '2102' WHERE `creature_template`.`entry` =30299;
-- set event for GO 192181 - Quest 12998
UPDATE `gameobject_template` SET `data2` = '192181' WHERE `entry` =192181;
-- event Script for Go 192181 - Quest 12998
DELETE FROM `event_scripts` WHERE `id` = 192181;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('192181', '0', '10', '30299', '24000', '7312.779', '-714.095', '791.608', '4.729', 'Summons NPC 30299 - Quest 12998'),
('192181', '0', '15', '32332', '1', '0', '0', '0', '0', 'add Cosmetic Cyclone - Quest 12998'),
('192181', '26', '14', '32332', '1', '0', '0', '0', '0', 'remove Cosmetic Cyclone - Quest 12998'),
('192181', '1', '15', '59123', '1', '0', '0', '0', '0', 'add stun Player - Quest 12998'),
('192181', '26', '14', '59123', '1', '0', '0', '0', '0', 'remove stun Player - Quest 12998'),
('192181', '26', '8', '30299', '0', '0', '0', '0', '0', 'Kill Credit 30299 - Quest 12998');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 30299;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('302990', '30299', '11', '0', '100', '0', '0', '0', '0', '0', '21', '1', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', 'Overseer Narvir moves to Target and stop MeleeAttack'),
('302991', '30299', '0', '0', '100', '0', '4000', '4001', '0', '0', '1', '-304094', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Overseer Narvir say first'),
('302992', '30299', '0', '0', '100', '0', '12000', '12001', '0', '0', '1', '-304095 ', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Overseer Narvir say second');
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-304094, -304095);
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc3`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
('-304094', 'You didn''t think that I was going to let you walk in here and take the Heart of the Storm, did you?', 'Du hast nicht wirklich gedacht, das ich dich hier hereinlaufen und das Herz des Sturms mitnehmen lasse?', '0', '0', '0', '0', 'NPC Overseer Narvir say first'),
('-304095', 'You may have killed Valduran, but that will not stop me from completing the colossus.',  'Du magst zwar Valduran getötet haben, aber das wird mich nicht davon abhalten den Kolossus zu vollenden!',  '0', '0', '0', '0', 'NPC Overseer Narvir say second');

-- questfixes and npc modifications
UPDATE quest_template SET method=0 WHERE entry IN (12851, 12856, 12970, 13064);
UPDATE quest_template SET ReqCreatureOrGOId1=29352 WHERE entry=12996;
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry=30174;
UPDATE quest_template SET ReqSourceId2=0, SrcItemId=0, SrcItemCount=0 WHERE entry IN (12996, 12997);
UPDATE quest_template SET ReqCreatureOrGOId1=29694 WHERE entry=12886;
DELETE FROM creature WHERE id=29975;
INSERT INTO creature (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth) VALUES
	(29975, 571, 1, 1, 6967.03, -1537.73, 835.651, 3.37415, 25, 5, 12175);
UPDATE creature_template SET mindmg=422, maxdmg=612, attackpower=755, dmg_multiplier=1.5, faction_A=16, faction_H=16, minhealth=19360, maxhealth=19360 WHERE entry=29563;
UPDATE creature SET phaseMask=1 WHERE id=32540;
UPDATE creature SET curhealth=19360 WHERE id=29563;

-- fix quest 12900
DELETE FROM `creature` WHERE `id` =29875;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('200031', '29875', '571', '1', '1', '0', '0', '6614.68', '-1524.12', '660.259', '4.97163', '120', '5', '0', '12175', '0', '0', '0'),
('200032', '29875', '571', '1', '1', '0', '0', '6655.01', '-1565.28', '663.085', '3.80532', '120', '5', '0', '12175', '0', '0', '0'),
('200033', '29875', '571', '1', '1', '0', '0', '6660.88', '-1610.73', '646.315', '4.75644', '120', '5', '0', '12175', '0', '0', '0'),
('200034', '29875', '571', '1', '1', '0', '0', '6616.54', '-1613.57', '638.06', '3.48174', '120', '5', '0', '12175', '0', '0', '0'),
('200035', '29875', '571', '1', '1', '0', '0', '6609.6', '-1577.71', '631.134', '1.85046', '120', '5', '0', '12175', '0', '0', '0'),
('200036', '29875', '571', '1', '1', '0', '0', '6573.94', '-1607.56', '620.245', '3.45346', '120', '5', '0', '12175', '0', '0', '0'),
('200037', '29875', '571', '1', '1', '0', '0', '6538.1', '-1581.31', '593.549', '2.59895', '120', '5', '0', '12175', '0', '0', '0'),
('200038', '29875', '571', '1', '1', '0', '0', '6501.35', '-1519.64', '552.522', '5.83872', '120', '5', '0', '12175', '0', '0', '0');
