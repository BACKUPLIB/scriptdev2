# instance sunwell plateau fixes

# mob updates:

# update damage values
# npc 25507, 25372, 25486, 25591, 25592, 25595, 25599 (Sunblade Protector, unblade Scout, shadowsword vanquisher, painbringer, doomfire destroyer, chaos gazer, cataclysm hound)
UPDATE `creature_template` SET `dmg_multiplier`=1.0 WHERE `entry`IN (25507, 25372, 25486, 25591, 25592, 25595, 25599); 
# update AI
# npc 26101 (Fire Fiend) add spell cast 46551 (fire nova)
UPDATE `creature_template` SET `AIName`="EventAI" WHERE `entry`=26101;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26101;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2610101,26101,0,0,100,3,0,0,20000,25000,11,46551,0,1,"Fire fiend - fire nova cast");
# npc 25483 (shadowsword manafiend)
UPDATE creature_ai_scripts SET action1_param2=0, action1_param3=16 WHERE id IN (2548302);
# npc 25509, 25599 (priestess of torment, cataclysm hound)
UPDATE creature_ai_scripts SET action1_param2=0 WHERE id IN (2550902, 2559902);
# npc 25373 (shadowsword soulbinder)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2537304,2537305);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param3`,`comment`) VALUES 
(2537304,25373,0,100,3,10000,10000,30000,40000,11,46427,16,"Shadowsword Soulbinder - Cast Domination");
# npc 25484 (shadowsword assassin)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2548403,2548404);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES (2548403,25484,100,3,10000,10000,20000,25000,11,46460,4,"Shadowsword Assassin - Cast Aimed Shot");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES (2548404,25484,100,3,100,100,35000,45000,11,46459,1,"Shadowsword Assassin - Cast Assassins Mark");
-- Sets ScriptName for Sunblade Scout (script not working at the moment)
UPDATE creature_template SET ScriptName='mob_sunblade_scout' WHERE entry=25372;

# update loot values
# npc 26101 (fire fiend) add loot item 22445 (arcane dust) 
UPDATE `creature_template` SET `lootid`=26101 WHERE `entry`=26101;
DELETE FROM `creature_loot_template` WHERE `entry`=26101;
INSERT INTO `creature_loot_template` VALUES(26101,22445,100,0,2,2,0,0,0); 

# update npc hp&mana values
# npc 25507, 25486 (sunblade protector, shadowsword vanquisher)
UPDATE `creature_template` SET `minhealth`=387000, `maxhealth`=387000 WHERE `entry` IN(25507, 25486);
UPDATE `creature` SET `curhealth` = 387000 WHERE `id` IN(25507, 25486);
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=7800, `maxhealth`=7800,`minmana`=3410,`maxmana`=3410 WHERE `entry` IN(26101);
UPDATE `creature` SET `curhealth` = 7800, `curmana` = 3410 WHERE `id` IN(26101);
# npc 25363,25370,25371 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000, `minmana`=31600,`maxmana`=31600 WHERE `entry` IN(25363, 25370, 25371);
UPDATE `creature` SET `curhealth` = 137000, `curmana` = 31600 WHERE `id` IN(25363, 25370, 25371);
# npc 25367 (sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000 WHERE `entry` IN(25367);
UPDATE `creature` SET `curhealth` = 137000 WHERE `id` IN(25367);
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=171000, `maxhealth`=171000 WHERE `entry` IN(25369, 25368);
UPDATE `creature` SET `curhealth` = 171000 WHERE `id` IN(25369, 25368);
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=97600, `maxhealth`=97600 WHERE `entry` IN(25867);
UPDATE `creature` SET `curhealth` = 97600 WHERE `id` IN(25867);
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=14700, `maxhealth`=14700 WHERE `entry` IN(25372);
UPDATE `creature` SET `curhealth` = 14700 WHERE `id` IN(25372);
#npc 25483, 25506 (shadowsword manafiend, shadowsword lifeshaper)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000 WHERE `entry` IN (25483);
UPDATE `creature` SET `curhealth` = 140000 WHERE `id` IN(25483);
#npc 25506, 25373, 25509 (shadowsword lifeshaper, shadowsword soulbinder)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000, `minmana`=16200, `maxmana`=16200 WHERE `entry` IN(25506,25373,25509);
UPDATE `creature` SET `curhealth` = 140000, `curmana` = 16200 WHERE `id` IN(25506,25373,25509);
#npc 25484, 25591 (shadowsword assassin, painbringer)
UPDATE `creature_template` SET `minhealth`=176000, `maxhealth`=176000 WHERE `entry` IN(25484,25591);
UPDATE `creature` SET `curhealth` = 176000 WHERE `id` IN(25484,25591);
#npc 25597 (oblivion mage)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000 WHERE `entry` IN(25597);
UPDATE `creature` SET `curhealth` = 140000 WHERE `id` IN(25597);
#npc 25592 (doomfire destroyer)
UPDATE `creature_template` SET `minhealth`=201000, `maxhealth`=201000 WHERE `entry` IN(25592);
UPDATE `creature` SET `curhealth` = 201000 WHERE `id` IN(25592);
#npc 25851 (volatile fiend)
UPDATE `creature_template` SET `minhealth`=8040, `maxhealth`=8040 WHERE `entry` IN(25851);
UPDATE `creature` SET `curhealth` = 8040 WHERE `id` IN(25851);
#npc 25595 (chaos gazer)
UPDATE `creature_template` SET `minhealth`=382000, `maxhealth`=382000 WHERE `entry` IN(25595);
UPDATE `creature` SET `curhealth` = 382000 WHERE `id` IN(25595);
#npc 25593 (apocalypse guard)
UPDATE `creature_template` SET `minhealth`=346000, `maxhealth`=346000 WHERE `entry` IN(25593);
UPDATE `creature` SET `curhealth` = 346000 WHERE `id` IN(25593);
#npc 25599 (cataclysm hound)
UPDATE `creature_template` SET `minhealth`=432000, `maxhealth`=432000 WHERE `entry` IN(25599);
UPDATE `creature` SET `curhealth` = 432000 WHERE `id` IN(25599);
#npc 25508 (shadowsword guardian)
UPDATE `creature_template` SET `minhealth`=517000, `maxhealth`=517000 WHERE `entry` IN(25508);
UPDATE `creature` SET `curhealth` = 517000 WHERE `id` IN(25508);
#npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `minhealth`=145000, `maxhealth`=145000, `minmana`=165000, `maxmana`=165000 WHERE `entry` IN(25588);
UPDATE `creature` SET `curhealth` = 145000, `curmana` = 165000 WHERE `id` IN(25588);

# boss updates:

# fixes for boss_Kalecgos fight
# update kalecgos, sathorvarr, kalecgos_humanoid
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287',`minmana`=1690000, `maxmana`=1690000, `minhealth`=5300000, `maxhealth`=5300000  WHERE `entry` = 24850;
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287', `minhealth`=5300000, `maxhealth`=5300000  WHERE `entry` = 24892;
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287', `dmg_multiplier`=8  WHERE `entry` = 24891;
# update gameobject 187055 (spectral rift)
UPDATE gameobject_template SET `type`= '22', `data0`='0', `data3`='1', `data6`='0', `data10`='0' WHERE `entry`=187055;

# fixes for boss_brutallus fight
# update npc 24882 (Brutallus)
UPDATE `creature_template` SET `minhealth`=11000000 ,`maxhealth`=11000000 WHERE `entry`=24882;
-- scripts for 'burn' and 'stomp'
DELETE FROM `spell_scripts` WHERE `id` IN (45141, 45185);
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`,`comment`) VALUES
('45141', '0', '15', '46394', '2', '0', '0', '0', '0', '0',""),
('45185', '0', '14', '46394', '1', '0', '0', '0', '0', '0',"");

# fixes for boss_felmyst fight
UPDATE `creature_template` SET `ScriptName`="boss_felmyst", `minhealth`=7300000, `maxhealth`=7300000 WHERE `entry` = 25038;
UPDATE `creature_template` SET `ScriptName`="mob_felmyst_vapor"WHERE `entry`= 25265;
UPDATE `creature_template` SET `ScriptName`="mob_deathcloud" WHERE `entry`=25703;

# fixes for boss_eredar_twins fight
# update npc 25165 (Sacrolash) 
UPDATE `creature_template` SET `ScriptName` = "boss_sacrolash", `minhealth`=3500000, `maxhealth`=3500000 WHERE `entry` = 25165;
# update npc 25166 (Alythess)
UPDATE `creature_template` SET `ScriptName` = "boss_alythess", `minhealth`=3500000, `maxhealth`=3500000  WHERE `entry` = 25166;
# update npc 25214 (Shadow Image)
UPDATE `creature_template` SET `ScriptName` = "npc_shadow_image" WHERE `entry` = 25214;
# update go 50439 (The Second Gate)
UPDATE `gameobject` SET `position_x`=1832.81, `position_y`=671.08, `position_z`=50.21, state=1 WHERE `guid`=50439;
# update eredar_twins loot
UPDATE `creature_loot_template` SET `maxcount` = 3 WHERE `mincountOrRef` = -34085;
# add items 35290, 35291, 35291 to sacrolashs & alythess' loot
DELETE FROM `creature_loot_template` WHERE `entry` IN(25166,25165) && `item` IN (35290,35291,35292);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35290,0,2,1,1);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35291,0,2,1,1);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25165,35292,0,2,1,1);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35290,0,2,1,1);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35291,0,2,1,1);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (25166,35292,0,2,1,1);
# add item 34209 to sacrolashs & alythess' loot
DELETE FROM `reference_loot_template` WHERE `entry` = 34085 && `item` = 34209;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (34085,34209,0,1,1,1);

# fixes for boss_muru_entropius fight
UPDATE `creature_template` SET `AIName` = "" WHERE `entry` = 25772;
#add m'uru loot
UPDATE `creature_template` SET `lootid` = 25840 WHERE `entry` = 25741;
# update npc 25741 (m'uru)
UPDATE `creature_template` SET `ScriptName` = "boss_muru", `maxhealth`=3500000, `minhealth`=3500000 WHERE `entry` = 25741;
# update npc 25744 (dark fiend)
UPDATE `creature_template` SET `ScriptName` = "dark_fiend" WHERE `entry` = 25744;
# update npc 25772 (void sentinel)
UPDATE `creature_template` SET `ScriptName` = "mob_voidsentinel" WHERE `entry` = 25772;
# update npc 25855 (singularity)
UPDATE `creature_template` SET `ScriptName` = "mob_singularity" WHERE `entry` = 25855;
# update npc 25770 (m'uru teleport target)
UPDATE `creature_template` SET `flags_extra`= 0, `modelid_1`=25206, `modelid_3`=25206, `InhabitType`=4 WHERE `entry`= 25770;

# fixes for boss_kiljaeden fight
# update npc 25608 (kil'jaeden controller)
UPDATE `creature_template` SET `ScriptName` = "mob_kiljaeden_controller" WHERE `entry`= 25608;
# update npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `ScriptName` = "mob_deceiver" WHERE `entry`= 25588;
# update npc 25315 (boss_kiljaeden)
UPDATE `creature_template` SET `ScriptName` = "boss_kiljaeden", `minhealth`=13000000, `maxhealth`=13000000 WHERE `entry`= 25315;
# update npc 25598 (volatile felfire fiend)
UPDATE `creature_template` SET `ScriptName` = "mob_volatile_felfire_fiend" WHERE `entry` = 25598;
# update npc 25735 (armageddon target)
UPDATE `creature_template` SET `ScriptName` = "mob_armagedon" WHERE `entry` = 25735;
# update npc 25502 (shield orb)
UPDATE `creature_template` SET `ScriptName` = "mob_orb" WHERE `entry` = 25502;
# update npc 25653 (power of the blue flight)
UPDATE `creature_template` SET `ScriptName` = "dragon" WHERE `entry` = 25653;
# update npc 30598 (shadow spike target)
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
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES ('25265', '0', '0', '0', '0', '0', '45411 0 45411 1');
/*
	Demonic Vampor Trail (die Spur)
    - unit flags (not attackable, pacified, not selectable)
    - bosslevel, fractions
    - dmg auras
*/
UPDATE `creature_template` SET `unit_flags` = 0x2020002, `faction_A` = '16', `faction_H` = '16', `minlevel` = '73', `maxlevel` = '73', `ScriptName` = 'mob_felmyst_vapor_trail' WHERE `entry` = '25267';
DELETE FROM `creature_template_addon` WHERE `entry` = '25267';
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(25267, 0, 0, 0, 0, 0, '45399 0');
/*
    Unyielding Death:
    - EventAI (Combat Pulse), für weite "aggro range"
    - Grüne Aura
*/
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `creature_template`.`entry` = 25268;
DELETE FROM `creature_template_addon` WHERE `entry` = '25268';
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
('25268', '0', '0', '0', '0', '0', '45415 0');
DELETE FROM `creature_ai_scripts` WHERE `id` = 2526801;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES
('2526801', '25268', '1', '0', '100', '2', '500', '500', '10000', '10000', '38', '0', '0', '0', 'Unyielding Death - zone combat pulse if ooc');
/* scipt targets für einen spell */
DELETE FROM `spell_script_target` WHERE `entry` IN (45388);
INSERT INTO `spell_script_target` (`entry` ,`type` ,`targetEntry`)VALUES
('45388', '1', '25038');
/* Felmyst, bounding radius vom model */
UPDATE `creature_model_info` SET `bounding_radius` = '8', `combat_reach` = '5' WHERE `creature_model_info`.`modelid` = 22838;

-- ------------ update swp to make instance harder -------------------
#update swp boss trashmob hp & damage for patch 333a without wotlk
#update damage for swp bosses
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` IN (24850, 24892, 24882, 25038, 25165, 25166, 25741, 25315);
#update kalecgos hp & dmg
UPDATE `creature_template` SET `minhealth`=6500000, `maxhealth`=6500000, `dmg_multiplier` = 50 WHERE `entry`=24850;
#update sathrovarr hp & dmg
UPDATE `creature_template` SET `minhealth`=6500000, `maxhealth`=6500000, `dmg_multiplier` = 50 WHERE `entry`=24892;
#update brutallus hp
UPDATE `creature_template` SET `minhealth`=12300000 ,`maxhealth`=12300000 WHERE `entry`=24882;
# update sacrolash hp
UPDATE `creature_template` SET `minhealth`=5000000, `maxhealth`=5000000 WHERE `entry` = 25165;
# update alythess hp
UPDATE `creature_template` SET `minhealth`=5000000, `maxhealth`=5000000 WHERE `entry` = 25166;
# npc 25507, 25486 (sunblade protector, shadowsword vanquisher)
UPDATE `creature_template` SET `minhealth`=650000, `maxhealth`=650000, `dmg_multiplier` = 3.5 WHERE `entry` IN(25507, 25486);
UPDATE `creature_template` SET `mindmg` = 780 ,`maxdmg`=2450, `dmg_multiplier`=5 WHERE `entry`=25507;
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=15000, `maxhealth`=15000, `dmg_multiplier` = 3.5 WHERE `entry` IN(26101);
# npc 25363,25370,25371,25367 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest,sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=255000, `maxhealth`=255000, `dmg_multiplier` = 25 WHERE `entry` IN(25363, 25370, 25371,25367);
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=300000, `maxhealth`=300000, `dmg_multiplier` = 25 WHERE `entry` IN(25369, 25368);
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=200000, `maxhealth`=200000, `dmg_multiplier` = 25 WHERE `entry` IN(25867);
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=30050, `maxhealth`=30050, `dmg_multiplier` = 5 WHERE `entry` IN(25372);
#npc 25483, 25506, 25373, 25509 (shadowsword manafiend, shadowsword lifeshaper, shadowsword soulbinder)
UPDATE `creature_template` SET `minhealth`=260000, `maxhealth`=260000, `dmg_multiplier` =  3.5 WHERE `entry` IN(25483,25506,25373,25509);
#npc 25484, 25591 (shadowsword assassin, painbringer)
UPDATE `creature_template` SET `minhealth`=300000, `maxhealth`=300000, `dmg_multiplier` = 25 WHERE `entry` IN(25484,25591);
#npc 25597 (oblivion mage)
UPDATE `creature_template` SET `minhealth`=260000, `maxhealth`=260000, `dmg_multiplier` = 3.5 WHERE `entry` IN(25597);
#npc 25592 (doomfire destroyer)
UPDATE `creature_template` SET `minhealth`=351500, `maxhealth`=351500, `dmg_multiplier` = 3.5 WHERE `entry` IN(25592);
#npc 25851 (volatile fiend)
UPDATE `creature_template` SET `minhealth`=17060, `maxhealth`=17060, `dmg_multiplier` = 3.5 WHERE `entry` IN(25851);
#npc 25595 (chaos gazer)
UPDATE `creature_template` SET `minhealth`=700000, `maxhealth`=700000, `dmg_multiplier` = 3.5 WHERE `entry` IN(25595);
#npc 25593 (apocalypse guard)
UPDATE `creature_template` SET `minhealth`=6000000, `maxhealth`=600000, `dmg_multiplier` = 25 WHERE `entry` IN(25593);
#npc 25599 (cataclysm hound)
UPDATE `creature_template` SET `minhealth`=700000, `maxhealth`=700000, `dmg_multiplier` = 3.5 WHERE `entry` IN(25599);
#npc 25508 (shadowsword guardian)
UPDATE `creature_template` SET `minhealth`=800500, `maxhealth`=800500, `dmg_multiplier` = 25 WHERE `entry` IN(25508);
#npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `minhealth`=267500, `maxhealth`=267500, `dmg_multiplier` = 3.5 WHERE `entry` IN(25588);
# update event ai for trashmobs
# npc 25507 cast fellightning every 10-15 sec
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id` IN (2550702);
# npc 25368 cast slaying shot 
UPDATE `creature_ai_scripts` SET `event_param3`=15000 WHERE `id` IN (2536803);
# npc 25370 cast mind flay and pain every 10-20 sec
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id` IN (2537002,2537003);
