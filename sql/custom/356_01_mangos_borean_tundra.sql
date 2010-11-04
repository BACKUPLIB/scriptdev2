-- borean tundra fixes

-- Spawnfix shadowstalker getry
DELETE FROM creature WHERE id = 25729;
INSERT INTO creature(guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth)
VALUES (230016, 25729, 571, 1, 1, 3123.091309, 6592.870117, 97.868080, 1.582328, 300, 0, 79.840);

-- fix quest 11876 (Help Those That Cannot Help Themselves) 
DELETE FROM `gameobject_scripts` WHERE `id` IN (59102,59122,59128,59138,59169,59226,59253,59261,59265,59303,59313,59321,59335,59341,59348,59357,59412,59417,59464,66627);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES 
(59102,1,15,46200,1,""),
(59122,1,15,46200,1,""),
(59128,1,15,46200,1,""),
(59138,1,15,46200,1,""),
(59169,1,15,46200,1,""),
(59226,1,15,46200,1,""),
(59253,1,15,46200,1,""),
(59261,1,15,46200,1,""),
(59265,1,15,46200,1,""),
(59303,1,15,46200,1,""),
(59313,1,15,46200,1,""),
(59321,1,15,46200,1,""),
(59335,1,15,46200,1,""),
(59341,1,15,46200,1,""),
(59348,1,15,46200,1,""),
(59357,1,15,46200,1,""),
(59412,1,15,46200,1,""),
(59417,1,15,46200,1,""),
(59464,1,15,46200,1,""),
(66627,1,15,46200,1,"");
UPDATE `gameobject_template` SET `flags` = 4 WHERE `name` = "Mammoth Trap";
UPDATE `quest_template` SET `ReqItemId1` = 35228, `ReqItemCount1` = 1 WHERE `entry` = 11876;

-- fix quest 11865 (Unfit For Death)
UPDATE `gameobject_template` SET `type`=6, `data1`=1, `data2`=1, `data3`=0, `data4`=1, `data5`=30, `data7`=0, `data10` = 0, `ScriptName` = "go_caribou_trap" WHERE `Name` = "Caribou Trap";
UPDATE `creature_template` SET `ScriptName` = "npc_nesingwary_trapper" WHERE entry = 25835;
UPDATE `quest_template` SET `ReqItemId1` = 35127, `ReqItemCount1` = 1 WHERE `entry` = 11865; 

-- fix quest 11878 (Khu'nok Will Know)
UPDATE `creature_template` SET npcflag = 1, `ScriptName` = "npc_orphaned_calf" WHERE `entry` = 25861;
UPDATE `quest_template` SET `SrcSpell` = 46233 WHERE `entry` = 11878;

-- partially fix quest 11794 (The Hunt Is On)
UPDATE `quest_template` SET `ReqItemId1` = 35125, `ReqItemCount1` = 1 WHERE `entry` = 11794;

-- fix quest 11608 (Bury Those Cockroaches)
UPDATE `creature_template` SET `ScriptName` = "npc_seaforium_depth_charge" WHERE `entry` = 25401;

-- make gameobject for quest 11956 despawn after using it
UPDATE `gameobject_template` SET `data5` = 1 WHERE `entry` = 188141;

-- fix quest 11656 (Burn in Effigy)
-- add quest credit NPCs
DELETE FROM `creature` WHERE `id` IN (25511,25513);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`spawndist`,`curhealth`,`MovementType`) VALUES 
(920001,25511,571,1,2,11868,3022.35,6785.00,3.16,300,5,8982,0),
(920002,25513,571,1,2,11868,2523.71,6839.83,0.76,300,5,8982,0);

-- update existing quest credit NPC phase masks
UPDATE `creature` SET `phaseMask` = 2 WHERE `id` IN (25510,25512);

-- add spellfocus objects
DELETE FROM `gameobject` WHERE `id` IN (300173);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`state`) VALUES 
(960001,300173,571,1,2,3048.65,6752.09,6.49,250,1),
(960002,300173,571,1,2,3022.35,6785.00,3.16,250,1),
(960003,300173,571,1,2,2522.94,6854.04,0.76,250,1),
(960004,300173,571,1,2,2868.42,6864.51,3.80,250,1);

-- enlarge spellfocus radius
UPDATE `gameobject_template` SET `data1` = 15 WHERE `entry` = 300173;

-- fix quest 11895 (master the storm)
UPDATE `creature_template` SET `ScriptName` = "npc_storm_totem" WHERE `entry` = 26048;
UPDATE `creature_template` SET `ScriptName` = "npc_sage_earth_and_sky" WHERE `entry` = 25982;

-- fix quest 11676
DELETE FROM `gameobject_scripts` WHERE `id` IN (60489,60510,60522,60546,60555,60567,60581,60606,60618,60632,60641,60679,60717,60777,60866,60872,60954,60968,60972);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES
(60489,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60510,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60522,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60546,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60555,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60567,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60581,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60606,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60618,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60632,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60641,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60679,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60717,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60777,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60866,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60872,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60954,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60968,0,8,25610,1,"scourge cage open credit for quest 11676"),
(60972,0,8,25610,1,"scourge cage open credit for quest 11676");

-- fix quest 11587
UPDATE `gameobject_template` SET `type` =  1, `data1` = 1751, `data0` = 0, `data3` = 0, `data2` = 10000 WHERE `entry` = 187561;
DELETE FROM `gameobject_scripts` WHERE `id` IN (59810,59812,59813);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`,`comments`) VALUES
(59810,5,15,45456,1,0,0,0,0,"arcane prison - quest credit"),
(59812,5,15,45456,1,0,0,0,0,"arcane prison - quest credit"),
(59813,5,15,45456,1,0,0,0,0,"arcane prison - quest credit"),
(59810,10,10,25318,10000,3485.32,6115.87,70.97,5.1755,"arcane prison - summon prisoner"),
(59812,10,10,25318,10000,3393.04,6139.82,75.59,5.8862,"arcane prison - summon prisoner"),
(59813,10,10,25318,10000,3262.55,6161.62,72.86,5.5642,"arcane prison - summon prisoner");

-- fix quest 11664
UPDATE `creature_template` SET `ScriptName` = 'npc_mootoo' WHERE `entry` =25504;
UPDATE `creature` SET `phaseMask` = 3 WHERE id = 25504;

-- fix quest 11560
UPDATE `gameobject_template` SET `ScriptName` = "", `data2` = 11560 WHERE `entry` = 187373;
UPDATE `creature_template` SET `ScriptName` = "npc_tadpole" WHERE `entry` = 25201;
UPDATE `creature` SET `MovementType` = 0 WHERE `id` = 25201;
DELETE FROM `scripted_event_id` WHERE `id` = 11560;
INSERT INTO `scripted_event_id` (`id`,`ScriptName`) VALUES (11560,"go_tadpole_cage"); 

-- fix quest 11661
UPDATE creature_template SET minlevel = 68, maxlevel = 69, armor = 6432, minhealth = 6986, maxhealth = 7984, mindmg = 245, maxdmg = 346, attackpower = 412, faction_A = 1885, faction_H = 1885 WHERE entry IN (32577, 32578, 32579, 32580);
UPDATE creature_template SET minlevel = 71, maxlevel = 71, armor = 7235, minhealth = 9291, maxhealth = 9291, mindmg = 245, maxdmg = 346, attackpower = 412, dmg_multiplier = 1.2, faction_A = 1885, faction_H = 1885 WHERE entry = 32576;
UPDATE creature_template SET unit_flags = 0x2000002 WHERE entry = 27939;
DELETE FROM event_scripts WHERE id = 16889;

DELETE FROM event_scripts WHERE id = 16889;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(16889, 2, 10, 27939, 180000, 0, 0, 0x1, 0, 0, 0, 0, 2822, 7045.720215, -0.428997, 3.6621001, "Spawn 'The Helmsmann's Ship'"),
(16889, 4, 10, 32577, 120000, 0, 0, 0x1, 0, 0, 0, 0, 2794.19, 7023.63, 3.316, 4.49, "Spawn the 1st add"),
(16889, 19, 10, 32578, 120000, 0, 0, 0x1, 0, 0, 0, 0, 2787.83, 7024.55, 4.28, 4.97, "Spawn the 2nd add"),
(16889, 34, 10, 32579, 120000, 0, 0, 0x1, 0, 0, 0, 0, 2794.41, 7020.36, 5.48, 3.55, "Spawn the 3rd add"),
(16889, 49, 10, 32580, 120000, 0, 0, 0x1, 0, 0, 0, 0, 2794.19, 7023.63, 3.316, 4.49, "Spawn the 4th add"),
(16889, 64, 10, 32576, 120000, 0, 0, 0x1, 0, 0, 0, 0, 2794.19, 7024.55, 4.28, 4.97, "Spawn 'Orabus the Helmsman'");

-- fix npc's 25831, 25832 & 25833
-- fix mantis bug #0003053
UPDATE `creature_template` SET `minlevel` = '71',`maxlevel` = '71', `minhealth` = '9280', `maxhealth` = '9280', `armor` = '7018', `mindmg` = '299', `maxdmg` = '426', `attackpower` = '308' WHERE `entry` =25831;
UPDATE `creature_template` SET `minlevel` = '71',`maxlevel` = '71', `minhealth` = '9280', `maxhealth` = '9280', `armor` = '7018', `mindmg` = '299', `maxdmg` = '426', `attackpower` = '308' WHERE `entry` =25832;
UPDATE `creature_template` SET `minlevel` = '71',`maxlevel` = '71', `minhealth` = '9290', `maxhealth` = '9290', `armor` = '7018', `mindmg` = '299', `maxdmg` = '426', `attackpower` = '308' WHERE `entry` =25833;

-- fix quest 11631
-- set totem movement idle
UPDATE `creature` SET `MovementType` = 0 WHERE `id` = 25455;
-- add spellfocus object
DELETE FROM `gameobject` WHERE `id` = 300172;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`animprogress`,`state`) VALUES
(160000,300172,571,1,1,4526.36,5674.26,82.10,0,300,0,0);
-- add quest credit event
DELETE FROM `event_scripts` WHERE `id` = 16716;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES 
(16716,10,8,25456,1,"Quest 11631 Quest Credit");

-- fix quest 11571
-- mantis bug #0003089
UPDATE `quest_template` SET `SrcSpell` = 7178 WHERE `entry` = 11571;

-- fix quest 11896
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2575803,2575804,2575805,2575302,2575303,2575304,2575202,2575203,2575204);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action2_type`,`action2_param1`,`action2_param2`,`comment`) VALUES 
(2575803,25758,11,0,100,0,0,0,0,0,22,0,0,28,0,46432,"Defendo-tank 66D - Set Phase 0 and remove \"Power of the Storm\" Buff on Spawn"),
(2575804,25758,23,0,100,0,46432,1,0,0,22,1,0,0,0,0,"Defendo-tank 66D - Change to phase2 when hit by \"Power of the Storm\""),
(2575805,25758,6,1,100,0,0,0,0,0,33,26082,6,0,0,0,"Defendo-tank 66D - Give Quest Credit when in phase2"),
(2575302,25753,11,0,100,0,0,0,0,0,22,0,0,28,0,46432,"Sentry-Bot 57-K - Set Phase 0 and remove \"Power of the Storm\" Buff on Spawn"),
(2575303,25753,23,0,100,0,46432,1,0,0,22,1,0,0,0,0,"Sentry-Bot 57-K - Change to phase2 when hit by \"Power of the Storm\""),
(2575304,25753,6,1,100,0,0,0,0,0,33,26082,6,0,0,0,"Sentry-Bot 57-K - Give Quest Credit when in phase2"),
(2575202,25752,11,0,100,0,0,0,0,0,22,0,0,28,0,46432,"Scavenge-bot 004-A8 - Set Phase 0 and remove \"Power of the Storm\" Buff on Spawn"),
(2575203,25752,23,0,100,0,46432,1,0,0,22,1,0,0,0,0,"Scavenge-bot 004-A8 - Change to phase2 when hit by \"Power of the Storm\""),
(2575204,25752,6,1,100,0,0,0,0,0,33,26082,6,0,0,0,"Scavenge-bot 004-A8 - Give Quest Credit when in phase2");

-- add npc 25589
-- mantis bug #0003112
DELETE FROM `creature` WHERE `id` =25589;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('200030 ', '25589', '571', '1', '1', '0', '0', '4410.833008', '5375.345215', '-15.241395', '0.639261', '120', '5', '0', '1', '0', '0', '0'); 

-- fix quest 11730 / spell 46023
UPDATE `spell_area` SET `gender` = 2 WHERE `spell` = 46023;

-- fix npc 25284
UPDATE `creature_template` SET `ScriptName` = "npc_nerubar_victim" WHERE `entry` = 25284;

-- add npc 25203
-- mantis bug #0003125
DELETE FROM creature WHERE guid = 240006;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(240006, 25203, 571, 1, 1, 0, 0, 4483.87, 6279.69, -44.3063, 2.87981, 300, 10, 0, 9291, 0, 0, 2);

-- add npc 25427
-- mantis bug #0003164
DELETE FROM `creature` WHERE `id` = 25427;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('240009', '25427', '571', '1', '1', '0', '0', '4407.270508', '5330.973145', '-24.617218', '5.492043', '300', '5', '0', '1', '0', '0', '0');

-- fix quest 11590 
UPDATE `creature_template` SET `AIName` = "", `minlevel` = 69, `maxlevel` = 70, `minhealth` = 6387, `maxhealth` = 7185, `minmana` = 7031, `maxmana` = 7196, `ScriptName` = "npc_captured_beryl_sorcerer" WHERE `entry` = 25474;
UPDATE `creature_template` SET `ScriptName` = "npc_beryl_sorcerer" WHERE `entry` = 25316;
-- not sure if this is right
DELETE FROM `spell_script_target` WHERE `entry` IN (45630,45735);
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES
(45630,1,25474),
(45735,1,25474);

-- fix by Jeiy
-- mantis bug #0003234
UPDATE `quest_template` SET `ReqSpellCast1` = '45606' WHERE `entry` =11637;

-- fix quest 11673 (mantis bug #0003113)
UPDATE `creature_template` SET `ScriptName` = 'npc_bonker_togglevolt' WHERE `entry` =25589;

--  fix Gossip Quest 11887 and 11795
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 25841; 
UPDATE `creature_template` SET `gossip_menu_id` = '25841' WHERE `entry` = '25841';
DELETE FROM `gossip_menu` WHERE `entry` = '25841';
INSERT INTO `gossip_menu` (`entry`,`text_id`, `cond_1`, `cond_1_val_1` ) VALUES 
('25841', '12489', '0', '0');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = '25841';
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id` ,`cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES 
('25841', '0', '0', 'Search the body for the pilot\'s emergency toolkit.', '1', '1', '0', '46362', '9', '11887', '0', '16', '35276', '7'),
('25841', '1', '0', 'Search for the pilot\'s insignia.', '1', '1', '0' , '46166', '9', '11795', '0', '16', '35126', '6');
DELETE FROM `gossip_scripts` WHERE `id` IN ('46362', '46166');
INSERT INTO `gossip_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`)  VALUES 
('46362', '0', '17', '35276', '1', 'Quest 11887 - add QuestGO'),
('46362', '1', '18', '0', '0', 'Quest 11887 - despawn NPC'),
('46166', '0', '17', '35126', '1', 'Quest 11795 - add QuestGO'),
('46166', '1', '18', '0', '0', 'Quest 11795 - despawn NPC');
