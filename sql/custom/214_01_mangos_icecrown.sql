-- fixes for icecrown

-- remove double NPCs chillmaw, cultist bombardier(3x) (probably had wrong phase mask settings)
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` IN (88654,88664,88665,88666);

-- add eventAI for icecrown maps (times are not blizzlike!)
INSERT IGNORE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(3368701,33687,0,0,100,1,1000,5000,15000,30000,11,65248,1,0,"Chillmaw - Frost Breath"),
(3368702,33687,0,0,100,1,3000,10000,12000,27000,11,65260,1,0,"Chillmaw - Wing Buffet"),
(3369501,33695,0,0,100,1,2500,8000,30000,45000,11,65128,1,0,"Cultist Bombardier - Throw Dynamite"),
(3369502,33695,0,0,100,1,1000,2000,30000,45000,11,65130,1,0,"Cultist Bombardier - Time Bomb"),
(3095801,30958,0,0,100,1,1000,3000,12000,20000,11,60950,0,0,"Death Knight Initiate - Blood Plague"),
(3095802,30958,0,0,100,1,3500,5000,10000,22000,11,60949,0,0,"Death Knight Initiate - Death Coil"),
(3095803,30958,0,0,100,1,3000,7000,8000,15000,11,60952,0,0,"Death Knight Initiate - Icy Touch"),
(3095801,30957,0,0,100,1,1000,3000,12000,20000,11,60950,0,0,"Death Knight Initiate - Blood Plague"),
(3095802,30957,0,0,100,1,3500,5000,10000,22000,11,60949,0,0,"Death Knight Initiate - Death Coil"),
(3095803,30957,0,0,100,1,3000,7000,8000,15000,11,60952,0,0,"Death Knight Initiate - Icy Touch"),
(3074601,30746,0,0,100,1,2000,5000,12000,16000,11,11831,0,0,"Master Summoner Zarod - Frost Nova"),
(3074602,30746,0,0,100,1,1000,1500,6000,10000,11,9672,0,0,"Master Summoner Zarod - Frostbolt"),
(3074603,30746,0,0,100,1,1500,2500,10000,14000,11,28873,0,0,"Master Summoner Zarod - Lich Slap"),
(3098801,30988,0,0,100,1,0,0,2000,5000,11,55079,0,0,"Scourgebeak Fleshripper - Swoop");
