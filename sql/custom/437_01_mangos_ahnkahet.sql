-- instance Ahn'kahet fixes

-- fix creatures
-- boss Jedogar Shadowseeker
DELETE FROM creature WHERE id=29310;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, position_x, position_y, position_z, orientation, spawntimesecs, curhealth, MovementType) VALUES
(230014, 29310, 619, 3, 1, 26777, 372.331, -705.278, -16.1797, 5.42797, 14400, 212700, 0);
UPDATE creature_template SET MovementId=0 WHERE entry IN (29310, 31465);
UPDATE creature_template SET unit_flags=0, mechanic_immune_mask=1073741823, speed_walk=0.7, speed_run=0.7, flags_extra=2, ScriptName='npc_twilight_volunteer', unit_flags=32768, type_flags=8 WHERE entry IN (31474, 30385);

-- boss Prince Taldaram
UPDATE creature_template SET MovementId=0, InhabitType=3 WHERE entry IN (29308, 31469);
UPDATE `creature` SET `MovementType` = 0, `position_z`=11.308110 WHERE `id` IN (29308, 31469);
UPDATE `creature_template` SET unit_flags=514 WHERE `entry` = 29308;
UPDATE `creature_template` SET `ScriptName` = "mob_flame_orb" WHERE `entry` = 30702;

-- boss Amanitar
DELETE FROM creature WHERE id=30258;
INSERT INTO creature (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
(230013,30258, 619, 2, 346.342987, -894.199036, -77.352600, 1.065079, 86400, 431392);

-- boss Herals Volazj
-- TODO: find the right NPC for this script:
UPDATE `creature_template` SET `ScriptName` = "mob_twisted_visage" WHERE `entry` = 31627;

-- trashmobs
UPDATE `creature_template` SET `unit_flags` = 33554944 WHERE `entry` = 30413;
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (30178);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (30176,30178);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(3017601,30176,11,100,7,0,0,0,0,11,56151,0,3,"Ahn'kahar Guardian - Cast Guardian Aura on spawn"),
(3017602,30176,0,100,7,0,500,25000,40000,11,56354,0,2,"Ahn'kahar Guardian - Cast Sprint"),
(3017603,30176,8,0,100,6,56153,0,0,0,28,0,56153,''),
(3017801,30178,0,100,7,0,500,25000,40000,11,56354,0,2,"Ahn'kahar Swarmer - Cast Sprint");
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(29309,29308,29310,29311,30258,31456,31463,31464,31465,31469);

-- fix areatriggers
DELETE FROM `areatrigger_teleport` WHERE `id` = 5235;
INSERT INTO `areatrigger_teleport` (`id`,`name`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES 
(5235,"Ahn'Kahet (exit) 2",571,3641.84,2032.94,2.47,1.178);
