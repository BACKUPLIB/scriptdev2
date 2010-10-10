-- Ahn'kahet fixes

-- boss Elder Nadox
UPDATE `creature_template` SET `mechanic_immune_mask` = 81997726 WHERE `entry` = 29309;
-- eventAI for trashmobs
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (30176,30178);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (30176,30178);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(3017601,30176,11,100,7,0,0,0,0,11,56151,0,3,"Ahn'kahar Guardian - Cast Guardian Aura on spawn"),
(3017602,30176,0,100,7,0,500,25000,40000,11,56354,0,2,"Ahn'kahar Guardian - Cast Sprint"),
(3017801,30178,0,100,7,0,500,25000,40000,11,56354,0,2,"Ahn'kahar Swarmer - Cast Sprint");

-- boss Jedogar Shadowseeker
UPDATE `creature_template` SET `mechanic_immune_mask` = 81997726 WHERE `entry` = 29310;

-- boss Prince Taldaram
UPDATE `creature_template` SET `mechanic_immune_mask` = 81997726 WHERE `entry` = 29308;
UPDATE `creature_template` SET `ScriptName` = "mob_taldaram_flame_orb" WHERE `entry` = 30702;
UPDATE `creature_template` SET `ScriptName` = "" WHERE `entry` = 31687;

-- boss Amanitar
UPDATE `creature_template` SET `mechanic_immune_mask` = 81997726, `ScriptName` = "boss_amanitar" WHERE `entry` = 30258;
UPDATE `creature_template` SET `ScriptName` = "npc_amanitar_healthy_mushroom" WHERE `entry` = 30391;
UPDATE `creature_template` SET `ScriptName` = "npc_amanitar_poisonous_mushroom" WHERE `entry` = 30435;

-- boss Herals Volazj
UPDATE `creature_template` SET `mechanic_immune_mask` = 81997726 WHERE `entry` = 29311;
-- TODO: find the right NPC for this script:
UPDATE `creature_template` SET `ScriptName` = "mob_volazj_clone" WHERE `entry` = 31627;

-- trashmobs
UPDATE `creature_template` SET `unit_flags` = 33554944 WHERE `entry` = 30413;

-- fix areatrigger
DELETE FROM `areatrigger_teleport` WHERE `id` = 5235;
INSERT INTO `areatrigger_teleport` (`id`,`name`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES 
(5235,"Ahn'Kahet (exit) 2",571,3641.84,2032.94,2.47,1.178);
