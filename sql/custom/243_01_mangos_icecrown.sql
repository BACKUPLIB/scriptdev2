-- fixes for icecrown

-- remove double NPCs chillmaw, cultist bombardier(3x) (probably had wrong phase mask settings)
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` IN (88654,88664,88665,88666);

-- add eventAI for icecrown maps (times are not blizzlike!)
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (33687,33695,30958,30957,30746,30988,31283);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33687,33695,30958,30957,30746,30988,31283);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(3368701,33687,0,0,100,1,1000,5000,15000,30000,11,65248,1,0,"Chillmaw - Frost Breath"),
(3368702,33687,0,0,100,1,3000,10000,12000,27000,11,65260,1,0,"Chillmaw - Wing Buffet"),
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

-- change faction of NPC 35984 & 30281 to prevent them from fighting each other and players
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` IN (35984,30281);

-- fix quest 12847
UPDATE `gameobject_template` SET `data2` = 5, `data4` = 1, `data11` = 1, `data9` = 1 WHERE `entry` = 191579;

-- make NPC 33778 (Tournament Hyppogryph) walk on ground instead of walking in the air
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 33778;

-- fix NPCs 36065 & 36066 attacking Players on tournament ground
UPDATE `creature_template` SET `unit_flags` = 131904 WHERE `entry` IN (36065,36066);

-- fix loot of NPC 35113 (fix quest 14017)
UPDATE creature_template SET lootid = 35113 WHERE entry = 35113;
DELETE FROM `creature_loot_template` WHERE `entry` = 35113;
INSERT INTO `creature_loot_template`(`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES (35113, 47048, -100, 1, 1);

-- fix quest 14104
-- add event script to spawn questmob
DELETE FROM `event_scripts` WHERE `id` = 22030;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`) VALUES (22030,3,10,35012,300000,10006.4,650.6,10.34,4.542);
-- spawn spellfocus object
DELETE FROM `gameobject` WHERE `id` = 300004;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`animprogress`,`state`) VALUES (300004,571,1,1,10004.3,633.73,12.2,300,0,0);
-- enlarge raduis of spellfocus object
UPDATE `gameobject_template` SET `data1` = 15 WHERE `entry` = 300004;

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
-- spawn NPC 34127
DELETE FROM `creature` WHERE `id` = 34127;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(34127, 571, 1, 1, 6223.681152, 2255.466064, 494.533142, 3.529711, 500, 5, 250.000, 0, 0, 1),
(34127, 571, 1, 1, 6276.000488, 2259.39746, 484.906769, 2.986218, 500, 5, 250.000, 0, 0, 1),
(34127, 571, 1, 1, 6300.097656, 2314.445557, 480.249939, 4.870389, 500, 5, 250.000, 0, 0, 1),
(34127, 571, 1, 1, 6156.892578, 2279.263916, 503.667877, 4.143901, 500, 5, 250.000, 0, 0, 1);
-- add eventAI for NPC 34127
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 34127;
DELETE FROM `creature_ai_scripts` WHERE `id` = 34127;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(3412701,34127,11,0,100,1,0,0,0,0,11,63010,0,3,"Boneguard Commander - Cast Scourge Banner Aura On Spawn"),
(3412702,34127,11,0,100,1,0,0,0,0,11,59942,0,3,"Boneguard Commander - Cast Scourge Banner Bearer On Spawn"),
(3412703,34127,4,0,100,1,0,0,0,0,11,60023,1,3,"Boneguard Commander - Cast Charge On Aggro"),
(3412704,34127,0,0,100,1,1000,5000,10000,15000,11,65147,0,0,"Boneguard Commander - Cast Shield Braker");

-- fix quest 13068
-- spawn npc 30532
DELETE FROM `creature` WHERE `id` = 30562;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, DeathState, MovementType)
VALUES (30562, 571, 1, 1, 8137.476074, 438.845551, 574.612793, 4.543622, 500, 5, 12.600, 0, 0, 1);
-- make quest 13083 only available when quest 13082 is done (we have to do this because we do not have phase shifts implemented)
UPDATE `quest_template` SET `PrevQuestId` = 13082 WHERE `entry` = 13083;

-- make NPC 31078 flightmaster (he should only be available as flightmaster after the player completes a set of quests, but we have no proper phasing at the moment..)
UPDATE `creature_template` SET `npcflag` = '8192' WHERE `entry` =31078;

-- spawn npc 29794 for quest 12868
DELETE FROM `creature` WHERE `id` = 29794;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('29794', '571', '1', '1', '7030.596191', '63.698158', '1033.686401', '2.118490', '1200', '5', '126000', '0', '0', '1');