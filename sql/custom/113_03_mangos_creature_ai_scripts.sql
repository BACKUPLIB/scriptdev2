# add/update eventAI für drak'tharon keep mobs
# darkweb recluse timers not blizzlike!
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 26625;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26625;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662501,26625,0,100,1,3000,4500,15000,20000,11,49704,1,0,"Darkweb Recluse - Encasing Webs");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662502,26625,0,100,3,5000,7000,11000,16000,11,49708,1,0,"Darkweb Recluse - Poison Spit(Normal)");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662503,26625,0,100,5,4600,5600,10000,12000,11,32330,1,0,"Darkweb Recluse - Poison Spit(Heroic)");
# drakkari guardian timers not blizzlike
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 26620;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 26620;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662001,26620,0,100,1,5000,7500,8000,12000,11,9080,1,0,"Drakkari Guardian - Hamstring");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662002,26620,0,100,1,9000,15000,15000,18000,11,11972,1,0,"Drakkari Guardian - Shield Bash");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2662003,26620,2,100,1,50,0,10000,18000,11,47668,0,0,"Drakkari Guardian - Heal");
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
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 27431;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27431;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2743101,27431,0,100,1,0,0,40000,50000,11,49724,0,0,"Drakkari Commander - Battle Shout");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2743102,27431,0,100,1,500,1000,0,0,11,8269,0,0,"Drakkari Commander - Frenzy");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2743103,27431,0,100,3,10000,15000,20000,30000,11,49807,0,0,"Drakkari Commander - Whirlwind(Normal)");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,
`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) 
VALUES (2743104,27431,0,100,5,8000,12000,20000,25000,11,24236,0,0,"Drakkari Commander - Whirlwind(Heroic)");
# Drakkari Shaman slower heal chain casting
UPDATE `creature_ai_scripts` SET `event_param3` = 12000, `event_param4` = 20000 WHERE `id` = 2663912