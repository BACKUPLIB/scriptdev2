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
UPDATE `creature_template` SET `unit_flags` = 131904 WHERE `entry` IN (36065,36066); #320