# update wotlk instance drak'tharon keep bosses
# boss trollgore normal
UPDATE `creature_template` SET `AIName` = "", `rank` = 3, `dmg_multiplier` = 15 WHERE `entry` = 26630;
# boss trollgore heroic
UPDATE `creature_template` SET `rank` = 3, `dmg_multiplier` = 25 WHERE `entry` = 31362;
# crystal handler normal
UPDATE `creature_template` SET `ScriptName` = "crystal_handler", `minlevel` = 75, `maxlevel` = 81, `minhealth` = 21200, `maxhealth` = 21200, `armor` = 4000, `mindmg` = 200, `maxdmg` = 300, `attackpower` = 200, `minrangedmg` = 200, `maxrangedmg` = 300, `lootid` = 0 WHERE `entry` = 26627;
# crystal handler heroic
UPDATE `creature_template` SET `equipment_id` = 1653 WHERE `entry` = 31344;
# boss dred normal
UPDATE `creature_template` SET `ScriptName` = "boss_dred", `AIName` = "" WHERE `entry` = 27483;
# tharon'ja normal
UPDATE `creature_template` SET `ScriptName` = "boss_tharonja", `rank` = 3, `minlevel` = 76, `maxlevel` = 76, `minhealth` = 275000, `maxhealth` = 275000, `mechanic_immune_mask` = 10693526  WHERE `entry` = 26632;
# tharon'ja spawn
DELETE FROM `creature` WHERE `id` = 26632;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`) VALUES (26632,600,3,1,-237,-675.5,131.5,4.71,36000);
# delete wrong loot from crystal handler
DELETE FROM `creature_loot_template` WHERE `item` = 38555;
# update ritual crystal GOs
UPDATE `gameobject_template` SET `data0` = 0, `data1` = 0 WHERE entry IN (189299, 189300, 189301, 189302);
# add script to drak'tharon keep instance
UPDATE `instance_template` SET `ScriptName` = "instance_draktharon_keep" WHERE `map` = 600;

# fix for some drak'tharon instance mobs
# make risen drakkari bat rider selectable
UPDATE `creature_template` SET `unit_flags` = 64 WHERE `entry` IN (26638,31351);
# update hulking corpse (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 13000, `maxhealth` = 13000, `minlevel` = 74, `maxlevel` = 74, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27597;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 31348;
# update risen shadowcaster (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 1700, `maxhealth` = 1700, `minlevel` = 70, `maxlevel` = 70, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27600;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 31356;
# update fetid troll corpse (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 2100, `maxhealth` = 2100, `minlevel` = 69, `maxlevel` = 69, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27598;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 31873;
# update crystal handler (normal)
UPDATE `creature_template` SET `maxlevel` = 75 WHERE `entry` = 26627;
# delete wrong drakkari bat rider spawns
DELETE FROM `creature` WHERE `guid` IN (127447,127445,127446);

-- trashmob EventAI
# add/update eventAI für drak'tharon keep mobs
# darkweb recluse timers not blizzlike!
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26625;
INSERT INTO `creature_ai_scripts`(`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662501,26625,0,100,1,3000,4500,15000,20000,11,49704,1,0,"Darkweb Recluse - Encasing Webs"),
(2662502,26625,0,100,3,5000,7000,11000,16000,11,49708,1,0,"Darkweb Recluse - Poison Spit(Normal)"),
(2662503,26625,0,100,5,4600,5600,10000,12000,11,32330,1,0,"Darkweb Recluse - Poison Spit(Heroic)");

# drakkari guardian timers not blizzlike!
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26620;
INSERT INTO`creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662001,26620,0,100,1,5000,7500,8000,12000,11,9080,1,0,"Drakkari Guardian - Hamstring"),
(2662002,26620,0,100,1,9000,15000,15000,18000,11,11972,1,0,"Drakkari Guardian - Shield Bash"),
(2662003,26620,2,100,1,50,0,10000,18000,11,47668,0,0,"Drakkari Guardian - Heal");
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 26620;

# risen drakkari warrior
DELETE FROM `creature_ai_scripts` WHERE `id` = 2663503;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2663503,26635,2,100,1,50,1,10000,18000,11,47668,0,0,"Risen Drakkari Warrior - Heal");

# Scourge Brute 
DELETE FROM `creature_ai_scripts` WHERE `id` = 2662303;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662303,26623,2,100,1,50,1,10000,18000,11,47668,0,0,"Scourge Brute - Heal");

# Drakkari Commander
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27431;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2743101,27431,0,100,1,0,0,40000,50000,11,49724,0,0,"Drakkari Commander - Battle Shout"),
(2743102,27431,0,100,1,500,1000,0,0,11,8269,0,0,"Drakkari Commander - Frenzy"),
(2743103,27431,0,100,3,10000,15000,20000,30000,11,49807,0,0,"Drakkari Commander - Whirlwind(Normal)"),
(2743104,27431,0,100,5,8000,12000,20000,25000,11,24236,0,0,"Drakkari Commander - Whirlwind(Heroic)");
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 27431;

# Drakkari Shaman slower heal chain casting
UPDATE `creature_ai_scripts` SET `event_param3` = 12000, `event_param4` = 20000 WHERE `id` = 2663912;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(26630,26631,27483,26632,31362,31349,31350,31360);
