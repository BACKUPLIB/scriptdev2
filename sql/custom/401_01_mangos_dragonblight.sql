-- fixes for dragonblight

-- fix quest 12173
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 27135;
UPDATE `quest_template` SET `Method` = 2 WHERE `entry` = 12173;

-- fix quest 12111
UPDATE `quest_template` SET `ReqItemId1` = 36818, `ReqItemCount1` = 1, ReqSourceId1 = 0, ReqSpellCast1 = 47628, ReqSpellCast2 = 47628, ReqCreatureOrGOId1 = 26615, ReqCreatureOrGOId2 = 26482 WHERE `entry` = 12111;

-- add npc 26859
DELETE FROM `creature` WHERE `id` = 26859;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('900058', '26859', '571', '1', '1', '0', '0', '4341.036133', '978.466064', '91.479370', '5.435826', '120', '5', '0', '1', '0', '0', '0');

-- fix loot of gameobject 192773
-- mantis bug #0003114
DELETE FROM gameobject_loot_template WHERE entry = 192773;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES(192773, 43084, -100, 0, 1, 1, 0, 0, 0); 

-- Make event (kill credit, LOS) repeatable, repeat time of 2s to save cpu load
UPDATE creature_ai_scripts SET event_flags = 1, event_param3 = 2, event_param4 = 2  WHERE id = 2785301;

-- fix quest 12132
DELETE FROM `creature` WHERE id  = 26966;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('240007', '26966', '571', '1', '32', '0', '0', '3828.287', '1568.201', '86.698', '1.57', '180', '5', '0', '1', '0', '0', '0'),
('240010', '26966', '571', '1', '32', '0', '0', '3788.853', '1528.397', '87.576', '3.54', '180', '5', '0', '1', '0', '0', '0'),
('240011', '26966', '571', '1', '32', '0', '0', '3835.312', '1495.283', '91.717', '2.24', '180', '5', '0', '1', '0', '0', '0'),
('240012', '26966', '571', '1', '32', '0', '0', '3867.134', '1619.302', '90.575', '4.20', '180', '5', '0', '1', '0', '0', '0'),
('240013', '26966', '571', '1', '32', '0', '0', '3765.248', '1617.665', '87.47', '1.21', '180', '5', '0', '1', '0', '0', '0'),
('240014', '26966', '571', '1', '32', '0', '0', '3885.831', '1599.751', ' 90.923', '1.69', '180', '5', '0', '1', '0', '0', '0'),
('240015', '26966', '571', '1', '32', '0', '0', '3868.271', '1529.901', '89.899', '4.06', '180', '5', '0', '1', '0', '0', '0'),
('240016', '26966', '571', '1', '32', '0', '0', '3790.757', '1643.960', '98.744', '3.88', '180', '5', '0', '1', '0', '0', '0');
UPDATE `creature_template` SET `minlevel` = '72', `maxlevel` = '73', `minhealth` = '9770', `maxhealth` = '9770', `minmana` = '3340', `maxmana` = '3340', `mindmg` = '900', `maxdmg` = '1100', `faction_A` = '16', `faction_H` = '16' WHERE `entry` = 26966;
UPDATE `creature_template` SET `gossip_menu_id` = '65535' WHERE `entry` = 26581;
UPDATE `quest_template` SET `SrcSpell` = '47740' WHERE `entry` = 12132;
DELETE FROM `gossip_menu` WHERE `entry` IN (65534,65535);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
('65535', '1'),
('65534', '1');
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (65535);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`) VALUES
('65535', '1', '0', 'GOSSIP_OPTION_QUESTGIVER', '2', '3', '0', '0', '0', '0', '0'),
('65535', '2', '0', 'Ich muss zurückkehren in die Schattenwelt, Koltira. Sendet mich zurück.', '1', '3', '65534', '65535', '9', '12132', '0');
DELETE FROM `gossip_scripts` WHERE `id` = 65535;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `comments`) VALUES
('65535', '0', '15', '47740', '2', '');

-- fix quest 12126,12125,12127
DELETE FROM `spell_scripts` WHERE `id` IN (47703,50252,47724);
INSERT INTO `spell_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES 
(47703,0,15,50254,1,"Quest 12126 - Create Quest Item"),
(50252,0,15,50250,1,"Quest 12125 - Create Quest Item"),
(47724,0,15,50239,1,"Quest 12127 - Create Quest Item");

-- fix quest 12273 
UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry` IN (27234, 27235, 27236, 27237);

DELETE FROM `creature` WHERE `creature`.`guid` IN (105029, 105034);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(105029, 27237, 571, 1, 1, 0, 0, 2888.33, -300.35, 128.237, -1.6806, 300, 0, 0, 9940, 3387, 0, 0),
(105034, 27203, 571, 1, 1, 0, 0, 2890.55, -279.773, 129.335, 3.12414, 300, 0, 0, 9940, 3387, 0, 0);

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27234, 27235, 27236, 27237);
INSERT INTO `creature_ai_scripts`(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
-- Blacksmith Goodman
(2723401, 27234, 0, 0, 100, 1, 2000, 5000, 5000, 7000, 11, 33661, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - Cast Crush Armor'),
(2723402, 27234, 0, 0, 100, 1, 6000, 9000, 10000, 14000, 11, 15621, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - Cast Skull Crack'),
(2723403, 27234, 8, 0, 100, 1, 48714, -1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - On Spell Hit by Compelled: go to phase 2'),
(2723404, 27234, 6, 1, 100, 0, 0, 0, 0, 0, 11, 48728, 6, 16, 1, -27234, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - On Death in phase 2: Give quest credit'),
(2723405, 27234, 6, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - On Death in phase 1: Remove aura Compelled'),
(2723406, 27234, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Blacksmith Goodman - On Evade: remove aura from Compelled and reset phase'),
-- Lead Cannoneer Zierhut
(2723501, 27235, 0, 0, 100, 1, 3000, 7000, 12000, 15000, 11, 50832, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lead Cannoneer Zierhut - Cast Torch Toss'),
(2723502, 27235, 8, 0, 100, 1, 48714, -1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lead Cannoneer Zierhut - On Spell Hit by Compelled: go to phase 2'),
(2723503, 27235, 6, 1, 100, 0, 0, 0, 0, 0, 11, 48726, 6, 16, 1, -27235, 0, 0, 0, 0, 0, 0, 'Lead Cannoneer Zierhut - On Death in phase 2: Give quest credit'),
(2723504, 27235, 6, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lead Cannoneer Zierhut - On Death in phase 1: Remove aura Compelled'),
(2723505, 27235, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Lead Cannoneer Zierhut - On Evade: remove aura from Compelled and reset phase'),
-- Stable Master Mercer
(2723601, 27236, 8, 0, 100, 1, 48714, -1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stable Master Mercer - On Spell Hit by Compelled: go to phase 2'),
(2723602, 27236, 6, 1, 100, 0, 0, 0, 0, 0, 11, 48730, 6, 16, 1, -27236, 0, 0, 0, 0, 0, 0, 'Stable Master Mercer - On Death in phase 2: Give quest credit'),
(2723603, 27236, 6, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stable Master Mercer - On Death in phase 1: Remove aura Compelled'),
(2723604, 27236, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Stable Master Mercer - On Evade: remove aura from Compelled and reset phase'),
-- Commander Jordan
(2723701, 27237, 0, 0, 100, 1, 1000, 3000, 25000, 30000, 11, 50837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Jordan - Cast Avenging Wrath'),
(2723702, 27237, 9, 0, 100, 1, 0, 10, 18000, 23000, 11, 32773, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Jordan - Cast Consecration'),
(2723703, 27237, 8, 0, 100, 1, 48714, -1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Jordan - On Spell Hit by Compelled: go to phase 2'),
(2723704, 27237, 6, 1, 100, 0, 0, 0, 0, 0, 11, 48724, 6, 16, 1, -27237, 0, 0, 0, 0, 0, 0, 'Commander Jordan - On Death in phase 2: Give quest credit'),
(2723705, 27237, 6, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Jordan - On Death in phase 1: Remove aura Compelled'),
(2723706, 27237, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 48714, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Commander Jordan - On Evade: remove aura from Compelled and reset phase');

DELETE FROM `spell_scripts` WHERE `id` IN (48724, 48726, 48728, 48730);
INSERT INTO `spell_scripts`(`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`, `comments`) VALUES
(48724, 0, 15, 48723, 1, 0, 0, 0, 0, 0, 'cast The Denouncement: Commander Jordan Kill Credit on player'),
(48726, 0, 15, 48725, 1, 0, 0, 0, 0, 0, 'cast The Denouncement: Lead Cannoneer Zierhut Kill Credit on player'),
(48728, 0, 15, 48727, 1, 0, 0, 0, 0, 0, 'cast The Denouncement: Blacksmith Goodman Kill Credit on player'),
(48730, 0, 15, 48729, 1, 0, 0, 0, 0, 0, 'cast The Denouncement: Stable Master Mercer Kill Credit on player');

DELETE FROM `creature_ai_texts` WHERE `entry` IN (-27234, -27235, -27236, -27237);
INSERT INTO `creature_ai_texts`(`entry`,`content_default`, `content_loc3`, `type`,`comment`) VALUES
(-27234, 'You are being misled! The Onslaught is all lies! The Scourge and the Forsaken are not our enemies! Wake up!', 'Ihr seid in die Irre geführt worden! Der Ansturm ist alles Lüge! Die Geißel und die Verlassenen sind nicht unsere Feinde! Wacht auf!', 1, 'Blacksmith Goodman - Denouncement'),
(-27235, 'Renounce the Scarlet Onslaught! Don''t listen to the lies of the high general and the grand admiral any longer!', 'Leugnet den Scharlachroten Ansturm! Hört nicht länger auf die Lügen des Hochgenerals und den Großadmirals!', 1, 'Lead Cannoneer Zierhut - Denouncement'),
(-27236, 'Abbendis is nothing but a harlot and Grand Admiral Westwind is selling her cheap like he sold us out!', 'Abbendis ist nichts anderes als eine Hure und Großadmiral Westwind verkauft sie genauso billig wie er uns verkauft!', 1, 'Lead Cannoneer Zierhut - Denouncement'),
(-27237, 'High general Abbendis personally told me that it was a mistake to come north and that we''re doomed! I urge you all to lay down your weapons and leave before it''s too late!', 'Hochgeneral Abbendis persönlich erzählte mir, dass es ein Fehler war, nach Norden zu kommen und dass wir verdammt sind! Ich fordere euch alle auf Legt Eure Waffen nieder und geht fort, bevor es zu spät ist!', 1, 'Commander Jordan - Denouncement');

DELETE FROM `spell_script_target` WHERE `entry` = 48724 AND `targetEntry` = 27237;
DELETE FROM `spell_script_target` WHERE `entry` = 48726 AND `targetEntry` = 27235;
DELETE FROM `spell_script_target` WHERE `entry` = 48728 AND `targetEntry` = 27234;
DELETE FROM `spell_script_target` WHERE `entry` = 48730 AND `targetEntry` = 27236;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES 
('48724', '1', '27237'),
('48726', '1', '27235'),
('48728', '1', '27234'),
('48730', '1', '27236');
 
DELETE FROM `item_required_target` WHERE `entry` = 37438 AND `type` = 1 AND `targetEntry` = 27234;
DELETE FROM `item_required_target` WHERE `entry` = 37438 AND `type` = 1 AND `targetEntry` = 27235;
DELETE FROM `item_required_target` WHERE `entry` = 37438 AND `type` = 1 AND `targetEntry` = 27236;
DELETE FROM `item_required_target` WHERE `entry` = 37438 AND `type` = 1 AND `targetEntry` = 27237;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES
('37438', '1', '27234'),
('37438', '1', '27235'),
('37438', '1', '27236'),
('37438', '1', '27237');

-- fix quest 12267
-- todo Npc 27355 normaly is not attackable until spell 48790 ist castet 

DELETE FROM `creature` WHERE `id`=27450;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(101156,27450,571,1,1,13069,0,4421.543457,1865.774658,166.259888,0.279253,300,5,0,1,0,0,1);

DELETE FROM `spell_script_target` WHERE `entry` = 48790;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(48790, 1, 27450);

-- fix quest 12078

DELETE FROM `item_required_target` WHERE `entry` = 36771 AND `type` = 1 AND `targetEntry` = 26359;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES
('36771', '1', '26359');

DELETE FROM `spell_script_target` WHERE `entry` = 47431 AND `type` = 1 AND `targetEntry` = 26359;
INSERT INTO `spell_script_target` (`entry` ,`type` ,`targetEntry`)VALUES
('47431', '1', '26359');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26359;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES
(2635901, 26359, 9, 0, 100, 1, 0, 5, 10000, 15000, 11, 43358, 1, 0, 'Ice Heart Jormungar Spawn - Cast Gut Rip'),
(2635902, 26359, 8, 0, 100, 0, 47431, -1, 0, 0, 41, 0, 0, 0, 'Ice Heart Jormungar Spawn - Despawn on Spellhit 47431');
