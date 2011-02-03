-- map icecrown fixes

-- remove double NPCs chillmaw, cultist bombardier(3x) (probably had wrong phase mask settings)
	UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` IN (88654,88664,88665,88666);

-- add eventAI for icecrown maps (times are not blizzlike!)
	UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (33695,30958,30957,30746,30988,31283);
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33695,30958,30957,30746,30988,31283);
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
	(3369501,33695,0,0,100,1,2500,8000,30000,45000,11,65128,1,0,"Cultist Bombardier - Throw Dynamite"),
	(3369502,33695,0,0,100,1,1000,2000,30000,45000,11,65130,1,0,"Cultist Bombardier - Time Bomb"),
	(3095801,30958,0,0,100,1,1000,3000,12000,20000,11,60950,1,0,"Death Knight Initiate - Blood Plague"),
	(3095802,30958,0,0,100,1,3500,5000,10000,22000,11,60949,1,0,"Death Knight Initiate - Death Coil"),
	(3095803,30958,0,0,100,1,3000,7000,8000,15000,11,60952,1,0,"Death Knight Initiate - Icy Touch"),
	(3095701,30957,0,0,100,1,1000,3000,15000,20000,11,60950,1,0,"Death Knight Initiate - Blood Plague"),
	(3095702,30957,0,0,100,1,3500,5000,15000,25000,11,60949,1,0,"Death Knight Initiate - Death Coil"),
	(3095703,30957,0,0,100,1,3000,7000,8000,15000,11,60952,1,0,"Death Knight Initiate - Icy Touch"),
	(3074601,30746,0,0,100,1,2000,5000,12000,16000,11,11831,0,0,"Master Summoner Zarod - Frost Nova"),
	(3074602,30746,0,0,100,1,1000,1500,6000,10000,11,9672,1,0,"Master Summoner Zarod - Frostbolt"),
	(3074603,30746,0,0,100,1,1500,2500,10000,14000,11,28873,1,0,"Master Summoner Zarod - Lich Slap"),
	(3098801,30988,0,0,100,1,0,0,2000,5000,11,55079,1,0,"Scourgebeak Fleshripper - Swoop"),
	(3128301,31283,1,0,100,1,0,0,250000,300000,11,7870,0,0,"Orbaz Blutbann - Lesser Invisibility"),
	(3128302,31283,11,0,100,1,0,0,0,0,11,61015,0,0,"Orbaz Blutbann - Empower Runeblade"),
	(3128303,31283,0,0,100,1,1000,1500,15000,20000,11,60186,1,0,"Orbaz Blutbann - Plague Strike");

-- fix quest 12847
	UPDATE `gameobject_template` SET `data2` = 5, `data4` = 1, `data11` = 1, `data9` = 1 WHERE `entry` = 191579;

-- make NPC 33778 (Tournament Hyppogryph) walk on ground instead of walking in the air
	UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 33778;

-- fix NPCs 36065 & 36066 attacking Players on tournament ground
	UPDATE `creature_template` SET `unit_flags` = 131904 WHERE `entry` IN (36065,36066);

-- fix quest 13042
	UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 30409;
     -- add EventAI for NPC 30409 (fix quest 13042) (timers not blizzlike!)
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 30409;
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
	(3040901,30409,4,0,100,0,0,0,0,0,1,-304091,0,0,"Apprentice Osterkilgr - Yell On Aggro"),
	(3040902,30409,4,0,100,0,0,0,0,0,22,1,0,0,"Apprentice Osterkilgr - Set Phase 1 On Aggro"),
	(3040903,30409,0,5,100,1,0,0,0,0,21,1,0,0,"Apprentice Osterkilgr - Start Combat Movement (Phase 1)"),
	(3040904,30409,0,5,100,1,0,0,0,0,20,1,0,0,"Apprentice Osterkilgr - Start Melee Attack (Phase 1"),
	(3040905,30409,0,5,100,0,0,0,0,0,42,0,0,0,"Apprentice Osterkilgr - Set self killable (Phase 1)"),
	(3040906,30409,0,5,100,1,500,1000,12000,20000,11,60290,0,0,"Apprentice Osterkilgr - Cast Blast Wave (Phase 1)"),
	(3040907,30409,0,5,100,1,4000,6000,10000,15000,11,14034,1,0,"Apprentice Osterkilgr - Cast Fireball (Phase 1)"),
	(3040908,30409,2,5,100,0,62,0,0,0,1,-304092,0,0,"Apprentice Osterkilgr - Yell On 62% HP (Phase 1)"),
	(3040909,30409,2,5,100,0,42,0,0,0,22,2,0,0,"Apprentice Osterkilgr - Set Phase 2 On 42% HP (Phase 1)"),
	(3040910,30409,0,3,100,0,0,0,0,0,21,0,0,0,"Apprentice Osterkilgr - Stop Combat Movement (Phase 2)"),
	(3040911,30409,0,3,100,0,0,0,0,0,20,0,0,0,"Apprentice Osterkilgr - Stop Melee Attack (Phase 2)"),
	(3040912,30409,0,3,100,0,1000,1000,0,0,1,-304093,0,0,"Apprentice Osterkilgr - Say (Phase 2)"),
	(3040913,30409,0,3,100,0,2000,2000,0,0,33,30412,1,0,"Apprentice Osterkilgr - Give Quest Credit (Phase 2)"),
	(3040914,30409,0,3,100,0,10000,10000,0,0,22,1,0,0,"Apprentice Osterkilgr - Set Phase 1 After Talking (Phase 2)");
     -- add script text for NPC 30409
	DELETE FROM `creature_ai_texts` WHERE `entry` IN (-304091,-304092,-304093);
	INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`type`,`language`,`comment`) VALUES 
	(-304091,"You've come for the doctor's plans! You'll only find death!",1,0,"Apprentice Osterkilgr - On Aggro"),
	(-304092,"The doctor entrusted me with the plans to Nergeld! I will not fail!",1,0,"Apprentice Osterkilgr - On 60%HP"),
	(-304093,"The doctor entrusted me with the plans to Nergeld, our flesh giant amalgamation made entirely of vargul! It will be the most powerful creation of its kind and a whole legion of them will be created to destroy your pitiful forces!",0,0,"Apprentice Osterkilgr defeated");

-- fix quest 13861
     -- add eventAI for NPC 34127
	UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 34127;
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 34127;
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
	(3412701,34127,11,0,100,1,0,0,0,0,11,63010,0,3,"Boneguard Commander - Cast Scourge Banner Aura On Spawn"),
	(3412702,34127,11,0,100,1,0,0,0,0,11,59942,0,3,"Boneguard Commander - Cast Scourge Banner Bearer On Spawn"),
	(3412703,34127,4,0,100,1,0,0,0,0,11,60023,1,3,"Boneguard Commander - Cast Charge On Aggro"),
	(3412704,34127,0,0,100,1,1000,5000,10000,15000,11,65147,0,0,"Boneguard Commander - Cast Shield Braker");

-- make NPC 31078 flightmaster (he should only be available as flightmaster after the player completes a set of quests, but we have no proper phasing at the moment..)
	UPDATE `creature_template` SET `npcflag` = '8192' WHERE `entry` =31078;

-- fix quest 13110 - mantis bug 3059
	UPDATE quest_template SET ReqCreatureOrGOId1 = 31043, ReqItemId1 = 43153, ReqItemCount1 = 1, ReqSourceId4 = 0, ReqSpellCast1 = 57806 WHERE entry = 13110;

-- add npc 30686 - mantis bug 3075
	UPDATE `creature_template` SET `minlevel` = '80', `maxlevel` = '80', `minhealth` = '88200', `maxhealth` = '88200', `minmana` = '31952', `maxmana` = '31952' WHERE `entry` =30686;

-- add npc 32444 - mantis bug #0003080
	DELETE FROM creature WHERE id = '32444';
	INSERT INTO creature VALUES (240001, 32444,571,1,1,0,0,7636.58,2058.89,600.261,2.9099,25,5,0,12600,3994,0,0);

-- fix quest 13119 - mantis bug #0002906
	UPDATE `quest_template` SET `ReqSpellCast1` = '57853', `ReqSpellCast2` = '57853', `ReqSpellCast3` = '57853', `ReqSpellCast4` = '57853' WHERE `entry` =13119;

-- fix quest 14107
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` =32149;
	DELETE FROM `creature_ai_scripts` WHERE `id` = 3214901;
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
	('3214901', '32149', '8', '0', '100', '1', '66719', '-1', '5000', '5000', '25', '0', '0', '0', '41', '4000', '0', '0', '33', '35055', '6', '0', 'Fallen Hero\'s Spirit - Despawn and give quest Credit');

-- fix quest 13212
     -- fix NPCs
	UPDATE `creature_template` SET `minlevel` = 79, `maxlevel` = 80, `minhealth` = 12600, `maxhealth` = 12600, `faction_A` = 974, `faction_H` = 974, `mindmg` = 560, `maxdmg` = 780, `AIName` = 'EventAI' WHERE `entry` = 30696;
	UPDATE `creature_template` SET `mindmg` = '500', `maxdmg` = '650' WHERE `entry` IN ('35012','34980');
     -- Spawn mobs for quest
	DELETE FROM `creature` WHERE `guid` BETWEEN 240017 AND 240030;
	DELETE FROM `creature` WHERE `guid` = 982353;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	(982353, 30696, 571, 1, 1, 0, 0, 6439.36, 3118.73, 657.482, 0.325935, 25, 5, 0, 12600, 0, 0, 0),
	(240017, 30696, 571, 1, 1, 0, 0, 6474.94, 3094.87, 657.613, 3.91206, 25, 5, 0, 12600, 0, 0, 1),
	(240018, 30696, 571, 1, 1, 0, 0, 6437.91, 3079.93, 657.706, 0.790105, 25, 5, 0, 12600, 0, 0, 1),
	(240019, 30696, 571, 1, 1, 0, 0, 6468.86, 3161.92, 657.481, 3.58063, 25, 5, 0, 12600, 0, 0, 1),
	(240020, 30696, 571, 1, 1, 0, 0, 6431.69, 3160.01, 657.49, 2.44494, 25, 5, 0, 12600, 0, 0, 1),
	(240021, 30696, 571, 1, 1, 0, 0, 6467.93, 3239.73, 643.351, 0.948756, 25, 5, 0, 12600, 0, 0, 1),
	(240022, 30696, 571, 1, 1, 0, 0, 6435.55, 3235.87, 642.013, 2.93189, 25, 5, 0, 12600, 0, 0, 1),
	(240023, 30696, 571, 1, 1, 0, 0, 6468.91, 3299.68, 625.853, 1.45927, 25, 5, 0, 12600, 0, 0, 1),
	(240024, 30696, 571, 1, 1, 0, 0, 6488.55, 3412.61, 596.006, 1.25506, 25, 5, 0, 12600, 0, 0, 1),
	(240025, 30696, 571, 1, 1, 0, 0, 6520.31, 3428.6, 599.264, 0.206555, 25, 5, 0, 12600, 0, 0, 1),
	(240026, 30696, 571, 1, 1, 0, 0, 6633.18, 3461.18, 618.336, 0.588253, 25, 5, 0, 12600, 0, 0, 1),
	(240027, 30696, 571, 1, 1, 0, 0, 6704.06, 3493.2, 649.836, 5.56454, 25, 5, 0, 12600, 0, 0, 1),
	(240028, 30696, 571, 1, 1, 0, 0, 6757.77, 3472.94, 672.286, 2.70726, 25, 5, 0, 12600, 0, 0, 1),
	(240029, 30696, 571, 1, 1, 0, 0, 6787.99, 3494.42, 678.663, 4.83962, 25, 5, 0, 12600, 0, 0, 1),
	(240030, 30696, 571, 1, 1, 0, 0, 6849.31, 3470.87, 693.466, 2.09622, 25, 5, 0, 12600, 0, 0, 1);
     -- EventAI
	DELETE FROM `creature_ai_scripts` WHERE `id` = 3069601;
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
	(3069601, 30696, 0, 0, 100, 1, 10, 15, 20, 30, 11, 50335, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, ' ');

-- fix quest 12813
	UPDATE `creature_template` SET `AIName` ='EventAI', `ScriptName` = '' WHERE `entry` IN('29330', '29329', '29338', '29333');
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN('29330', '29329', '29338', '29333');
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
	('2933001', '29330', '8', '0', '100', '1', '52741', '-1', '45000', '45000', '33', '29398', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 12813'),
	('2932901', '29329', '8', '0', '100', '1', '52741', '-1', '45000', '45000', '33', '29398', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 12813'),
	('2933801', '29338', '8', '0', '100', '1', '52741', '-1', '45000', '45000', '33', '29398', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 12813'),
	('2933301', '29333', '8', '0', '100', '1', '52741', '-1', '45000', '45000', '33', '29398', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 12813');
	DELETE FROM `spell_script_target` WHERE `entry` =52741;
	INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
	('52741', '2', '29330'),
	('52741', '2', '29329'),
	('52741', '2', '29338'),
	('52741', '2', '29333');

-- fix quest 13172
	UPDATE `creature_template` SET `AIName` ='EventAI' WHERE `entry` IN('30949', '30951', '30952');
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN('30949', '30951', '30952');
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
	('3094901', '30949', '6', '0', '100', '1', '0', '0', '0', '0', '33', '31555', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 13172 '),
	('3095101', '30951', '6', '0', '100', '1', '0', '0', '0', '0', '33', '31555', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 13172 '),
	('3095201', '30952', '6', '0', '100', '1', '0', '0', '0', '0', '33', '31555', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 13172 ');
	
-- fix quest 14096
	DELETE FROM `spell_script_target` WHERE `entry` = 66531 AND `type` = 1 AND `targetEntry` = 34956;
	INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
	('66531', '1', '34956');
	UPDATE `quest_template` SET `ReqSpellCast1` = '66531', `ReqSpellCast2` = '66531' WHERE `entry` =14096;
	UPDATE `gameobject_template` SET `data2` = '60000' WHERE `entry` =195310;

-- fix quest 13125 / NPCs 30829, 30830, 30831
	DELETE FROM `creature` WHERE `guid` BETWEEN '240031' AND '240033';
	INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
	('240031', '30830', '571', '7196.497', '642.017', '489.022', '4.126'),
	('240032', '30829', '571', '6839.000', '595.069', '426.229', '4.006'),
	('240033', '30831', '571', '6862.289', '407.908', '471.692', '1.124');
	UPDATE `creature_template` SET `minlevel` = '79', `maxlevel` = '79', `minhealth` = '183000', `maxhealth` = '183000', `minmana` = '117000', `maxmana` = '117000', `armor` = '9000', `faction_H` = '21', `faction_A` = '21' WHERE `entry` =30829;
	UPDATE `creature_template` SET `minlevel` = '79', `maxlevel` = '79', `minhealth` = '244000', `maxhealth` = '244000', `armor` = '9000', `faction_H` = '21', `faction_A` = '21' WHERE `entry` =30830;
	UPDATE `creature_template` SET `minlevel` = '79', `maxlevel` = '79', `minhealth` = '244000', `maxhealth` = '244000', `minmana` = '156000', `maxmana` = '156000', `armor` = '9000', `faction_H` = '21', `faction_A` = '21' WHERE `entry` =30831;

-- fix quest 12810 / NPC 29392
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` =29392;
	DELETE FROM creature_ai_scripts WHERE id IN (2939201,2939202);
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `comment`) VALUES
	(2939201, 29392, 0, 0, 100, 1, 4000, 4000, 9000, 9000, 11, 3391, 0, 0, 0, 0, 0, 0, 'Ravenous Jaws - Trash'),
	(2939202, 29392, 8, 0, 100, 0, 6509, -1, 0, 0, 33, 29391, 6, 0, 41, 0, 0, 0, 'Ravenous Jaws - Collect Blood from the surrounding waters after spell hit');

-- fix quests 13356, 13357, 13322, 13321
-- needs SD2 support for aura spells
	DELETE FROM `creature` WHERE `id` = 32266;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	(200044, 32266, 571, 1, 1, 0, 0, 8039.36, 2374.53, 484.931, 0.387858, 300, 0, 0, 1, 0, 0, 0),
	(200045, 32266, 571, 1, 1, 0, 0, 7989.7, 2328.67, 484.492, 4.89133, 300, 0, 0, 1, 0, 0, 0),
	(200046, 32266, 571, 1, 1, 0, 0, 7998.15, 2366.79, 484.193, 5.35943, 300, 0, 0, 1, 0, 0, 0);
	DELETE FROM `item_required_target` WHERE `entry` = 44304 AND `type` = 1 AND `targetEntry` = 32266;
	INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES
	('44304', '1', '32266');
	DELETE FROM `spell_script_target` WHERE `entry` = 60310 AND `type` = 1 AND `targetEntry` = 32266;
	INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
	('60310', '1', '32266');
	UPDATE `quest_template` SET `ReqSpellCast1` = '60310' WHERE `entry` IN (13356, 13357, 13322, 13321);

-- fix quest 14142
	UPDATE `quest_template` SET `ReqSpellCast1` = '66531', `ReqSpellCast2` = '66531' WHERE `entry` =14142;
