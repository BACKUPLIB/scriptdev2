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
