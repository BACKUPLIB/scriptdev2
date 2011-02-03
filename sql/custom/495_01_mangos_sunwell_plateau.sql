-- instance sunwell plateau fixes

-- npc 25483 (Shadowsword Manafiend - Cast Drain Mana at 10% Mana)
	UPDATE creature_ai_scripts SET action1_param2=0, action1_param3=16 WHERE creature_id = 25483 AND action1_type = 11 AND action1_param1 = 46453;
    -- npc 25507 (sunblade protector)
	UPDATE `creature_template` SET `minhealth`=387450, `maxhealth`=387450 WHERE `entry` IN (25507);
	UPDATE `creature` SET `curhealth` = 387450 WHERE `id` IN (25507);
-- npc 25486 (shadowsword vanquisher)
	UPDATE `creature_template` SET `minhealth`=175934, `maxhealth`=175934 WHERE `entry` IN (25486);
	UPDATE `creature` SET `curhealth` = 175934 WHERE `id` IN (25486);
-- npc 26101 (fire fiend)
	UPDATE `creature_template` SET `minhealth`=7825, `maxhealth`=7825 WHERE `entry` IN (26101);
	UPDATE `creature` SET `curhealth` = 7825 WHERE `id` IN (26101);
-- npc 25363,25370,25371,25367 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest, sunblade arch mage)
	UPDATE `creature_template` SET `minhealth`=136930, `maxhealth`=136930 WHERE `entry` IN (25363, 25370, 25371, 25367);
	UPDATE `creature` SET `curhealth` = 136930 WHERE `id` IN (25363, 25370, 25371, 25367);
-- npc 25369,25368 (sunblade vindicator, sunblade slayer)
	UPDATE `creature_template` SET `minhealth`=171157, `maxhealth`=171157 WHERE `entry` IN (25369, 25368);
	UPDATE `creature` SET `curhealth` = 171157 WHERE `id` IN (25369, 25368);
-- npc 25867 (sunblade dragonhawk)
	UPDATE `creature_template` SET `minhealth`=97804, `maxhealth`=97804 WHERE `entry` IN (25867);
	UPDATE `creature` SET `curhealth` = 97804 WHERE `id` IN (25867);
-- npc 25372 (sunblade scout)
	UPDATE `creature_template` SET `minhealth`=14700, `maxhealth`=14700 WHERE `entry` IN (25372);
	UPDATE `creature` SET `curhealth` = 14700 WHERE `id` IN (25372);
-- npc 25483 (shadowsword manafiend)
	UPDATE `creature_template` SET `minhealth`=140728, `maxhealth`=140728 WHERE `entry` IN (25483);
	UPDATE `creature` SET `curhealth` = 140728 WHERE `id` IN (25483);
-- npc 25506, 25373 (shadowsword lifeshaper, shadowsword soulbinder)
	UPDATE `creature_template` SET `minhealth`=140728, `maxhealth`=140728, `minmana`=16155, `maxmana`=16155  WHERE `entry` IN (25506,25373);
	UPDATE `creature` SET `curhealth` = 140728, `curmana` = 16155 WHERE `id` IN (25506,25373);
-- npc 25509, 25484, 25591 (Priestess of Torment, shadowsword assassin, painbringer)
	UPDATE `creature_template` SET `minhealth`=175934, `maxhealth`=175934 WHERE `entry` IN (25509,25484,25591);
	UPDATE `creature` SET `curhealth` = 175934 WHERE `id` IN (25509,25484,25591);
-- npc 25597 (oblivion mage)
	UPDATE `creature_template` SET `minhealth`=140728, `maxhealth`=140728 WHERE `entry` IN (25597);
	UPDATE `creature` SET `curhealth` = 140728 WHERE `id` IN (25597);
-- npc 25592 (doomfire destroyer)
	UPDATE `creature_template` SET `minhealth`=201068, `maxhealth`=201068 WHERE `entry` IN (25592);
	UPDATE `creature` SET `curhealth` = 201068 WHERE `id` IN (25592);
-- npc 25851 (volatile fiend)
	UPDATE `creature_template` SET `minhealth`=8042, `maxhealth`=8042 WHERE `entry` IN (25851);
	UPDATE `creature` SET `curhealth` = 8042 WHERE `id` IN (25851);
-- npc 25595 (chaos gazer)
	UPDATE `creature_template` SET `minhealth`=382029, `maxhealth`=382029 WHERE `entry` IN (25595);
	UPDATE `creature` SET `curhealth` = 382029 WHERE `id` IN (25595);
-- npc 25593 (apocalypse guard)
	UPDATE `creature_template` SET `minhealth`=345586, `maxhealth`=345586 WHERE `entry` IN (25593);
	UPDATE `creature` SET `curhealth` = 345586 WHERE `id` IN (25593);
-- npc 25599 (cataclysm hound)
	UPDATE `creature_template` SET `minhealth`=432296, `maxhealth`=432296 WHERE `entry` IN (25599);
	UPDATE `creature` SET `curhealth` = 432296 WHERE `id` IN (25599);
-- npc 25508 (shadowsword guardian)
	UPDATE `creature_template` SET `minhealth`=516600, `maxhealth`=516600 WHERE `entry` IN (25508);
	UPDATE `creature` SET `curhealth` = 516600 WHERE `id` IN (25508);
-- npc 25588 (hand of the deceiver)
	UPDATE `creature_template` SET `minhealth`=144624, `maxhealth`=144624, `minmana`=165450, `maxmana`=165450 WHERE `entry` IN (25588);
	UPDATE `creature` SET `curhealth` = 144624, `curmana` = 165450 WHERE `id` IN (25588);

-- fixes for boss_Kalecgos fight
-- update kalecgos, sathorvarr, kalecgos_humanoid
	UPDATE `creature_template` SET `mechanic_immune_mask` = '653213695', `minmana`=1693500, `maxmana`=1693500 WHERE `entry` = 24850;
	UPDATE `creature_template` SET `mechanic_immune_mask` = '653213695' WHERE `entry` = 24892;
	UPDATE `creature_template` SET `mechanic_immune_mask` = '653213695', `dmg_multiplier`=7.5  WHERE `entry` = 24891;
-- update gameobject 187055 (spectral rift)
	UPDATE gameobject_template SET `type`= '22', `data0`='46021', `data3`='1', `data6`='0', `data10`='0' WHERE `entry` = 187055;
-- fixes for boss_brutallus fight
-- update npc 24882 (Brutallus)
	UPDATE `creature_template` SET `minhealth`=7351254 ,`maxhealth`=7351254 WHERE `entry`=24882;
-- scripts for 'burn' and 'stomp'
	DELETE FROM `spell_scripts` WHERE `id` IN (45141, 45185);
	INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`,`comments`) VALUES
	('45141', '0', '15', '46394', '2', '0', '0', '0', '0', '0', "Brutallus Spell Burn - Add Burn effect"),
	('45185', '0', '14', '46394', '1', '0', '0', '0', '0', '0', "Brutallus Spell Stopm - Removes Burn effect");

-- fixes for boss_felmyst fight
	UPDATE `creature_template` SET `ScriptName` = "boss_felmyst", `minhealth`=4903346, `maxhealth`=4903346 WHERE `entry` = 25038;
	UPDATE `creature_template` SET `ScriptName` = "mob_felmyst_vapor" WHERE `entry`= 25265;
	UPDATE `creature_template` SET `ScriptName` = "mob_deathcloud" WHERE `entry`=25703;
-- fixes for boss_eredar_twins fight
-- update npc 25165 (Sacrolash) 
	UPDATE `creature_template` SET `ScriptName` = "boss_sacrolash", `minhealth`=2018275, `maxhealth`=2018275 WHERE `entry` = 25165;
-- update npc 25166 (Alythess)
	UPDATE `creature_template` SET `ScriptName` = "boss_alythess", `minhealth`=2018275, `maxhealth`=2018275  WHERE `entry` = 25166;
-- update npc 25214 (Shadow Image)
	UPDATE `creature_template` SET `ScriptName` = "npc_shadow_image" WHERE `entry` = 25214;
-- update go 50439 (The Second Gate)
	UPDATE `gameobject` SET `position_x`=1832.81, `position_y`=671.08, `position_z`=50.21, state=1 WHERE `guid`=50439;
-- update eredar_twins loot
	UPDATE `creature_loot_template` SET `maxcount` = 3 WHERE `mincountOrRef` = -34085;
-- add items 35290, 35291, 35291 to sacrolashs & alythess' loot
	DELETE FROM `creature_loot_template` WHERE `entry` IN (25166,25165) && `item` IN (35290,35291,35292);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35290,0,2,1,1);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35291,0,2,1,1);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35292,0,2,1,1);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35290,0,2,1,1);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35291,0,2,1,1);
	INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35292,0,2,1,1);
-- add item 34209 to sacrolashs & alythess' loot
	DELETE FROM `reference_loot_template` WHERE `entry` = 34085 && `item` = 34209;
	INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (34085,34209,0,1,1,1);
-- fixes for boss_muru_entropius fight
	UPDATE `creature_template` SET `AIName` = "" WHERE `entry` = 25772;
-- add muru loot
	UPDATE `creature_template` SET `lootid` = 25840 WHERE `entry` = 25741;
-- update npc 25741 (muru)
	UPDATE `creature_template` SET `ScriptName` = "boss_muru", `maxhealth`=1912176, `minhealth`=1912176 WHERE `entry` = 25741;
-- update npc 25744 (dark fiend)
	UPDATE `creature_template` SET `ScriptName` = "dark_fiend" WHERE `entry` = 25744;
-- update npc 25772 (void sentinel)
	UPDATE `creature_template` SET `ScriptName` = "mob_voidsentinel" WHERE `entry` = 25772;
-- update npc 25855 (singularity)
	UPDATE `creature_template` SET `ScriptName` = "mob_singularity" WHERE `entry` = 25855;
-- update npc 25770 (muru teleport target)
	UPDATE `creature_template` SET `flags_extra`= 0, `modelid_1`=25206, `modelid_3`=25206, `InhabitType`=4 WHERE `entry`= 25770;

-- fixes for boss_kiljaeden fight
-- update npc 25608 (kil'jaeden controller)
	UPDATE `creature_template` SET `ScriptName` = "mob_kiljaeden_controller" WHERE `entry`= 25608;
-- update npc 25588 (hand of the deceiver)
	UPDATE `creature_template` SET `ScriptName` = "mob_deceiver" WHERE `entry`= 25588;
-- update npc 25315 (boss_kiljaeden)
	UPDATE `creature_template` SET `ScriptName` = "boss_kiljaeden", `minhealth`=9347800, `maxhealth`=9347800, `minmana`=1693500, `maxmana`=1693500 WHERE `entry`= 25315;
-- update npc 25598 (volatile felfire fiend)
	UPDATE `creature_template` SET `ScriptName` = "mob_volatile_felfire_fiend" WHERE `entry` = 25598;
-- update npc 25735 (armageddon target)
	UPDATE `creature_template` SET `ScriptName` = "mob_armagedon" WHERE `entry` = 25735;
-- update npc 25502 (shield orb)
	UPDATE `creature_template` SET `ScriptName` = "mob_orb" WHERE `entry` = 25502;
-- update npc 25653 (power of the blue flight)
	UPDATE `creature_template` SET `ScriptName` = "dragon" WHERE `entry` = 25653;
-- update npc 30598 (shadow spike target)
	UPDATE `creature_template` SET `ScriptName` = "mob_shadowspike" WHERE `entry` = 30598;

/* felmyst fight fixes/hacks

	Demonic Vampor (der Läufer)
    - unit flags (not attackable, pacified, not selectable)
    - bosslevel, fractions
    - speed
    - spawn/dmg aura
*/
	UPDATE `creature_template` SET `unit_flags` = 0x2020002, `faction_A` = '16', `faction_H` = '16', `speed_run` = '0.95', `minlevel` = '73', `maxlevel` = '73', `ScriptName` = 'mob_felmyst_vapor' WHERE `entry` = 25265;
	DELETE FROM `creature_template_addon` WHERE `entry` = '25265';
	INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES 
	('25265', '45411 0 45411 1');
/*
	Demonic Vampor Trail (die Spur)
    - unit flags (not attackable, pacified, not selectable)
    - bosslevel, fractions
    - dmg auras
*/
	UPDATE `creature_template` SET `unit_flags` = 0x2020002, `faction_A` = '16', `faction_H` = '16', `minlevel` = '73', `maxlevel` = '73', `ScriptName` = 'mob_felmyst_vapor_trail' WHERE `entry` = '25267';
	DELETE FROM `creature_template_addon` WHERE `entry` = '25267';
	INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
	(25267, '45399 0');
/*
    Unyielding Death:
    - EventAI (Combat Pulse), für weite "aggro range"
    - Grüne Aura
*/
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `creature_template`.`entry` = 25268;
	DELETE FROM `creature_template_addon` WHERE `entry` = '25268';
	INSERT INTO `creature_template_addon` (`entry`,  `auras`) VALUES
	('25268', '45415 0');
	DELETE FROM `creature_ai_scripts` WHERE `id` = 2526801;
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES
	('2526801', '25268', '1', '0', '100', '2', '500', '500', '10000', '10000', '38', '0', '0', '0', 'Unyielding Death - zone combat pulse if ooc');
-- scipt targets für einen spell 
	DELETE FROM `spell_script_target` WHERE `entry` IN (45388);
	INSERT INTO `spell_script_target` (`entry` ,`type` ,`targetEntry`)VALUES
	('45388', '1', '25038');
-- Felmyst, bounding radius vom model 
	UPDATE `creature_model_info` SET `bounding_radius` = '8', `combat_reach` = '5' WHERE `creature_model_info`.`modelid` = 22838;

-- Todo Sunblade Scout has script in instance_sunwell_plateau.cpp and in DB is EventAI
-- perhaps remove one of this
-- UPDATE creature_template SET ScriptName='mob_sunblade_scout' WHERE entry=25372;
