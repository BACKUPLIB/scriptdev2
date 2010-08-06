# update naxxramas instance

# remove widows embrace from naxxramas worshipper AI
DELETE FROM `creature_ai_scripts` WHERE `id` = 1650612;

# add boss scripts for boss_grobbulus
UPDATE `creature_template` SET `ScriptName` = "boss_grobbulus" WHERE `entry` = 15931;
UPDATE `creature_template` SET `ScriptName` = "npc_grobbulus_poison_cloud" WHERE `entry` = 16363;

# add script for obedience crystal in boss_razuvious fight
UPDATE `creature_template` SET `ScriptName` = "npc_obedience_crystal" WHERE `entry` = 29912;

# despawn boss_heigan, boss_thaddius and feugen & stalagg
DELETE FROM `creature` WHERE `id` IN(15928,15936,15929,15930);
# restore with
/*
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('130957','15928','533','3','1','16137','0','3513.84','-2926.55','302.914','4.13643','604800','0','0','3834875','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('127789','15936','533','3','1','16309','0','2793.86','-3707.38','276.627','0.593412','604800','0','0','3067900','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('130958','15929','533','3','1','15297','0','3450.45','-2931.42','312.091','5.49779','604800','0','0','836700','0','0','0');
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('130959','15930','533','3','1','15297','0','3508.14','-2988.65','312.092','2.37365','604800','0','0','836700','0','0','0');
*/

# add script for boss_anub'rekhan fight crypt-guard mob
UPDATE `creature_template` SET `ScriptName` = "mob_crypt_guard", `AIName` = "" WHERE `entry` = 16573;