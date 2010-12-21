# update naxxramas instance

# remove widows embrace from naxxramas worshipper AI
DELETE FROM `creature_ai_scripts` WHERE `id` = 1650612;

# add boss scripts for boss_grobbulus
UPDATE `creature_template` SET `ScriptName` = "boss_grobbulus" WHERE `entry` = 15931;
UPDATE `creature_template` SET `ScriptName` = "npc_grobbulus_poison_cloud" WHERE `entry` = 16363;

# add script for obedience crystal in boss_razuvious fight
UPDATE `creature_template` SET `ScriptName` = "npc_obedience_crystal" WHERE `entry` = 29912;
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` = 29912;

# add scripts to bosses thaddius, feugen & stalagg
UPDATE `creature_template` SET `ScriptName` = "boss_thaddius" WHERE `entry` = 15928;
UPDATE `creature_template` SET `ScriptName` = "mob_feugen" WHERE `entry` = 15930;
UPDATE `creature_template` SET `ScriptName` = "mob_stalagg" WHERE `entry` = 15929;

# add script for boss_heigan fight mob
UPDATE `creature_template` SET `ScriptName` = "npc_heigan_eruption" WHERE `entry` = 45101;

# add script for boss_anub'rekhan fight crypt-guard mob
UPDATE `creature_template` SET `ScriptName` = "mob_crypt_guard", `AIName` = "" WHERE `entry` = 16573;

# add sapphiron birth gameobject
DELETE FROM `gameobject` WHERE `id` = 181356;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(181356,533,3,1,3522.39,-5236.78,137.709,4.50295,3600000,255,0);
UPDATE `gameobject_template` SET `data2` = 10 WHERE `entry` = 181356;

# despawn thaddius & heigan as long as their scripts don't work

-- open heigan entrance door
UPDATE `gameobject` SET `state` = '0' WHERE `id` = 181202;

UPDATE `creature` SET `spawnMask` = 0 WHERE `id` IN (15928,15936);

# modify heigan's healthpoints (seems to low for the OV version of heigan)

UPDATE creature_template SET minhealth=1198000, maxhealth=1198000 WHERE entry=16060;
UPDATE creature SET curhealth=1198000 WHERE id=16060;

-- open 25 man mode
-- includes bosses anub rekhan, faerlina, maexxna, noth, patchwerk, grobbulus and gluth
UPDATE `creature` SET `spawnmask` = 3 WHERE `map` = 533 AND `spawnmask` = 1;
UPDATE `creature` SET `spawnmask` = 1 WHERE `id` IN (15989, 15990, 16011, 16061, 16803, 16063, 16064, 16065, 30549);

-- grand widow faerlina
-- add missing spell to worshippers
UPDATE `creature_template` SET `spell1` = '28732' WHERE `entry` =16506;

-- add missing trigger for boss heigan
DELETE FROM `creature_template` WHERE `entry` = 45101;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(45101, 0, 0, 0, 0, 0, 18783, 11686, 0, 0, 'HeiganTrigger', '', NULL, 0, 60, 60, 4120, 4120, 0, 0, 3750, 114, 114, 0, 1, 1.14286, 1, 0, 104, 138, 0, 252, 2.4, 2000, 0, 1, 33555200, 0, 0, 0, 0, 0, 0, 72, 106, 26, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 5, 1.35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 130, 'npc_heigan_eruption');

