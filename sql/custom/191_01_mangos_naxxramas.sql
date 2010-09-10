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
UPDATE `creature` SET `spawnMask` = 0 WHERE `id` IN (15928,15936);