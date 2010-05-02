# fix quest 11876 (Help Those That Cannot Help Themselves) 
DELETE FROM `gameobject_scripts` WHERE `id` IN (59102,59122,59128,59138,59169,59226,59253,59261,59265,59303,59313,59321,59335,59341,59348,59357,59412,59417,59464,66627);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59102,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59122,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59128,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59138,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59169,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59226,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59253,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59261,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59265,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59303,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59313,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59321,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59335,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59341,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59348,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59357,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59412,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59417,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (59464,1,15,46200,1);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES (66627,1,15,46200,1);
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