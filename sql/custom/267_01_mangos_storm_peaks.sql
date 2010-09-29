-- fixes for storm peak

-- fix quest 12843 (they took our men)
UPDATE `gameobject_template` SET `data2` = 191544 WHERE `entry` = 191544;
DELETE FROM `event_scripts` WHERE `id` = 191544;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES 
(191544,0,8,29466,1);

-- fix quest 12978
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29380 WHERE `entry` = 12978;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2937404,2937002);
UPDATE `creature_template` SET `KillCredit1` = 29380 WHERE `entry` IN (29370,29374);

-- fix quest 12957
UPDATE `creature_template` SET `ScriptName` = "npc_captive_mechagnome" WHERE `entry` = 29384;
