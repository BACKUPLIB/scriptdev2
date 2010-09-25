# fix quest 11876 (Help Those That Cannot Help Themselves) 
DELETE FROM `gameobject_scripts` WHERE `id` IN (59102,59122,59128,59138,59169,59226,59253,59261,59265,59303,59313,59321,59335,59341,59348,59357,59412,59417,59464,66627);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES 
(59102,1,15,46200,1),
(59122,1,15,46200,1),
(59128,1,15,46200,1),
(59138,1,15,46200,1),
(59169,1,15,46200,1),
(59226,1,15,46200,1),
(59253,1,15,46200,1),
(59261,1,15,46200,1),
(59265,1,15,46200,1),
(59303,1,15,46200,1),
(59313,1,15,46200,1),
(59321,1,15,46200,1),
(59335,1,15,46200,1),
(59341,1,15,46200,1),
(59348,1,15,46200,1),
(59357,1,15,46200,1),
(59412,1,15,46200,1),
(59417,1,15,46200,1),
(59464,1,15,46200,1),
(66627,1,15,46200,1);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `name` = "Mammoth Trap";
UPDATE `quest_template` SET `ReqItemId1` = 35228, `ReqItemCount1` = 1 WHERE `entry` = 11876;

# fix quest 11865 (Unfit For Death)
UPDATE `gameobject_template` SET `type`=6, `data1`=1, `data2`=1, `data3`=0, `data4`=1, `data5`=30, `data7`=0, `data10` = 0, `ScriptName` = "go_caribou_trap" WHERE `Name` = "Caribou Trap";
UPDATE `creature_template` SET `ScriptName` = "npc_nesingwary_trapper" WHERE entry = 25835;
UPDATE `quest_template` SET `ReqItemId1` = 35127, `ReqItemCount1` = 1 WHERE `entry` = 11865; 

# fix quest 11878 (Khu'nok Will Know)
UPDATE `creature_template` SET npcflag = 1, `ScriptName` = "npc_orphaned_calf" WHERE `entry` = 25861;
UPDATE `quest_template` SET `SrcSpell` = 46233 WHERE `entry` = 11878;

# partially fix quest 11794 (The Hunt Is On)
UPDATE `quest_template` SET `ReqItemId1` = 35125, `ReqItemCount1` = 1 WHERE `entry` = 11794;

# fix quest 11608 (Bury Those Cockroaches)
UPDATE `creature_template` SET `ScriptName` = "npc_seaforium_depth_charge" WHERE `entry` = 25401;

# make gameobject for quest 11956 despawn after using it
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