# update wotlk instance drak'tharon keep bosses
# boss trollgore normal
UPDATE `creature_template` SET `AIName` = "" WHERE `entry` = 26630;
# boss trollgore heroic
UPDATE `creature_template` SET `name` = "Trollgore", `ScriptName` = "boss_trollgore" WHERE `entry` = 31362;
# crystal handler normal
UPDATE `creature_template` SET `ScriptName` = "crystal_handler", `minlevel` = 75, `maxlevel` = 81, `minhealth` = 21200, `maxhealth` = 21200, `armor` = 4000, `mindmg` = 200, `maxdmg` = 300, `attackpower` = 200, `minrangedmg` = 200, `maxrangedmg` = 300, `lootid` = 0 WHERE `entry` = 26627;
# crystal handler heroic
UPDATE `creature_template` SET `ScriptName` = "crystal_handler", `name` = "Crystal Handler", `equipment_id` = 1653 WHERE `entry` = 31344;
# boss dred normal
UPDATE `creature_template` SET `ScriptName` = "boss_dred", `AIName` = "" WHERE `entry` = 27483;
# boss dred hero
UPDATE `creature_template` SET `name` = "King Dred", `ScriptName` = "boss_dred" WHERE `entry` = 31349;
# tharon'ja normal
UPDATE `creature_template` SET `ScriptName` = "boss_tharonja", `rank` = 3, `minlevel` = 76, `maxlevel` = 76, `minhealth` = 275000, `maxhealth` = 275000  WHERE `entry` = 26632;
# tharon'ja hero
UPDATE `creature_template` SET `name` = "The Prophet Tharon'ja", `ScriptName` = "boss_tharonja"  WHERE `entry` = 31360;
# tharon'ja spawn
DELETE FROM `creature` WHERE `id` = 26632;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`) VALUES (26632,600,3,1,-237,-675.5,131.5,4.71,36000);
# delete wrong loot from crystal handler
DELETE FROM `creature_loot_template` WHERE `item` = 38555;
# update ritual crystal GOs
UPDATE `gameobject_template` SET `data0` = 0, `data1` = 0 WHERE entry IN (189299, 189300, 189301, 189302);
# add script to drak'tharon keep instance
UPDATE `instance_template` SET `script` = "instance_draktharon_keep" WHERE `map` = 600;