-- howling fjord fixes

-- fix npc 24018
UPDATE creature_template SET mingold=3546, maxgold=4432 WHERE entry=24018;

-- fix quest 11240
UPDATE creature_template SET lootid=24048, mingold=2546, maxgold=3432 WHERE entry=24048;
DELETE FROM creature_loot_template WHERE entry=24048;
INSERT INTO creature_loot_template VALUES
(24048, 33187, -100, 0, 1, 1, 0, 0, 0), -- Whisper Gulch Gem
(24048, 33188, -100, 1, 1, 1, 0, 0, 0), -- Whisper Gulch Ore Fragment
(24048, 33447, 7, 2, 1, 1, 0, 0, 0), -- Runic Healing Potion
(24048, 24231, 14, 2, 1, 1, 0, 0, 0); -- Coarse Snuff
DELETE FROM creature WHERE id=24048;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(230012, 24048, 571, 1, 1, 0, 1, 1758.436890, -3337.399658, 80.453804, 2.559472, 300, 0, 0, 9291, 0, 0, 0);

-- fix quest 11252
UPDATE creature_loot_template SET ChanceOrQuestChance=-100 WHERE entry=23954 AND item=33330;

-- fix quest 11255
UPDATE `gameobject_template` SET `type` = 1 WHERE `entry` IN (186566,186567);
DELETE FROM `gameobject_scripts` WHERE `id` IN(60407,60414,60426,60432,60438,60452,60459,60471,60485,60511);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES 
(60407,0,8,24124,1,""),
(60414,0,8,24124,1,""),
(60426,0,8,24124,1,""),
(60432,0,8,24124,1,""),
(60438,0,8,24124,1,""),
(60452,0,8,24124,1,""),
(60459,0,8,24124,1,""),
(60471,0,8,24124,1,""),
(60485,0,8,24124,1,""),
(60511,0,8,24124,1,"");

-- fix bug on item for quest 11281
UPDATE `item_template` SET `spellcharges_1` = 1 WHERE entry = 33450;
UPDATE `quest_template` SET `ReqItemId1` = 33450, `ReqItemCount1` = 1, ReqSourceId1 = 0 WHERE `entry` = 11281;

-- fix quest 11227
DELETE FROM `spell_script_target` WHERE `entry` = 42788;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES (42788,1,23943);

-- fix quest 11300 (eventAI timers not blizzlike!)
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (24213,24215,24214,23931);
-- eventAI for NPC 24213 (Firjus the Soul Crusher)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (24213);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2421301,24213,0,0,100,1,1000,2000,5000,8000,11,15284,1,0,"Firjus - Cast Cleave"),
(2421302,24213,0,0,100,1,2500,4000,5000,8000,11,43348,1,0,"Firjus - Cast Head Crush"),
(2421303,24213,6,0,100,0,0,0,0,0,12,24215,0,300000,"Firjus - Spawn Jlarborn On Death");
-- eventAI for NPC 24215 (Jlarborn the Strategist)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (24215);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2421501,24215,11,0,100,1,0,0,0,0,2,35,0,0,"Jlarbor - Change faction to friendly On Spawn"),
(2421502,24215,1,0,100,0,15000,15000,0,0,2,0,0,0,"Jlarbor - Change faction to hostile after 15sec"),
(2421503,24215,4,0,100,1,0,0,0,0,11,19131,1,0,"Jlarbor - Cast Shield Charge on Aggro"),
(2421504,24215,0,0,100,1,1000,2000,8000,15000,11,8374,1,0,"Jlarbor - Cast Arcing Smash"),
(2421505,24215,0,0,100,1,2500,4000,10000,20000,11,38233,1,0,"Jlarbor - Cast Shield Bash"),
(2421506,24215,0,0,100,1,0,0,8000,16000,11,12169,0,0,"Jlarbor - Cast Shield Block"),
(2421507,24215,6,0,100,0,0,0,0,0,12,24214,0,300000,"Jlarbor - Spawn Yorus On Death");
-- eventAI for NPC 24214 (Yorus the Flesh Harvester)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (24214);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2421401,24214,11,0,100,1,0,0,0,0,2,35,0,0,"Yorus - Change faction to friendly On Spawn"),
(2421402,24214,1,0,100,0,15000,15000,0,0,2,0,0,0,"Yorus - Change faction to hostile after 15sec"),
(2421403,24214,0,0,100,1,3000,5000,15000,25000,11,41056,0,0,"Yorus - Cast Whirlwind"),
(2421404,24214,0,0,100,1,2500,6000,6000,15000,11,15284,1,0,"Yorus - Cast Cleave"),
(2421405,24214,6,0,100,0,0,0,0,0,12,23931,0,300000,"Yorus - Spawn Oluf the Violent On Death");
-- eventAI for NPC 23931 (Oluf the Violent)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (23931);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2393101,23931,11,0,100,1,0,0,0,0,2,35,0,0,"Oluf - Change faction to friendly On Spawn"),
(2393102,23931,1,0,100,0,15000,15000,0,0,2,0,0,0,"Oluf - Change faction to hostile after 15sec"),
(2393103,23931,0,0,100,1,3000,5000,15000,25000,11,41056,0,0,"Oluf - Cast Whirlwind"),
(2393104,23931,0,0,100,1,2500,6000,6000,15000,11,15284,1,0,"Oluf - Cast Cleave"),
(2393105,23931,0,0,100,1,0,0,40000,55000,11,13730,0,0,"Oluf - Cast Demoralizing Shout"),
(2393106,23931,0,0,100,1,10000,20000,20000,30000,11,6533,1,0,"Oluf - Cast Net"),
(2393107,23931,0,0,100,1,12000,15000,25000,30000,11,42870,1,0,"Oluf - Cast Throw Dragonflayer Harpoon"),
(2393108,23931,6,0,100,0,0,0,0,0,11,43326,0,3,"Oluf - Spawn Ancient Cypher On Death");

-- fix quest 11429
UPDATE `creature_template` SET `ScriptName` = "npc_alliance_banner" WHERE `entry` = 24640;
UPDATE `item_template` SET `spellcharges_1` = 1 WHERE `entry` = 34051;

-- fix quest 11314
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 23677, `ReqSpellCast1` = 43340, `ReqItemId1` = 33606, `ReqItemCount1` = 1, `ReqSourceId2` = 0 WHERE `entry` = 11314;

-- fix quest 11358/11366
DELETE FROM `event_scripts` WHERE `id` = 15939;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES
(15939,0,8,24381,1,"Quest 11366 Credit");

-- fix quest 11352/11348
-- mantis bug 3052
UPDATE `creature_template` SET `unit_flags` = 4096 WHERE `entry` = 24345;
UPDATE `quest_template` SET `ReqItemId1` = 33796, `ReqItemCount1` = 1, `ReqSourceId3` = 0, `ReqSpellCast1` = 49859 WHERE `entry` IN (11352, 11348);
DELETE FROM `spell_script_target` WHERE `entry` = 49859 AND `targetEntry` = 24345;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (49859, 1, 24345);

-- fix quest 11416 / 11417
UPDATE `creature` SET `position_x` = 1596.9, `position_y` = -3903.6, `position_z` = 140.6 WHERE `id` = 24518;
DELETE FROM `scripted_event_id` WHERE `id` = 16142;
INSERT INTO `scripted_event_id` (`id`, `ScriptName`) VALUES (16142, "event_spell_talonshrike_aggro");
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 24518;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2451802,24518,1,100,1,5000,8000,15000,22000,11,32909,1,0,"Talonshrike - Cast Talon Strike"),
(2451801,24518,1,100,1,1000,2000,13000,20000,11,49865,1,1,"Talonshrike - Cast Eye Peck");

UPDATE creature_template SET minlevel=70, maxlevel=70, minhealth=8980, maxhealth=8980, mindmg=312, maxdmg=413, dmg_multiplier=2.5, attackpower=155, baseattacktime=1500 WHERE entry=27959;

-- fix quest 11270
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (24009, 24010);
UPDATE `spell_script_target` SET `type` = '1' WHERE `entry` =42793;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (24009, 24010);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('24009', '24009', '8', '0', '100', '0', '42793', '-1', '0', '0', '37', '0', '0', '0', '33', '24008', '6', '0', '0', '0', '0', '0', ''),
('24010', '24010', '8', '0', '100', '0', '42793', '-1', '0', '0', '37', '0', '0', '0', '33', '24008', '6', '0', '0', '0', '0', '0', '');

