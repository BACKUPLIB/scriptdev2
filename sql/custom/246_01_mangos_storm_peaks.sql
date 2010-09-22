-- fixes for storm peak

-- fix quest 12843 (they took our men)
UPDATE `gameobject_template` SET `data2` = 191544 WHERE `entry` = 191544;
DELETE FROM `event_scripts` WHERE `id` = 191544;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES 
(191544,0,8,29466,1);

-- fix quest 12978
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29380 WHERE `entry` = 12978;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2937404,2937002);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES 
(2937404,29374,6,0,100,1,33,29380,1,"Stormforged Magus - Give Credit for Quest 12978"),
(2937002,29370,6,0,100,1,33,29380,1,"Stormforged Champion - Give Credit for Quest 12978");

-- fix quest 12957
UPDATE `creature_template` SET `ScriptName` = "npc_captive_mechagnome" WHERE `entry` = 29384;
