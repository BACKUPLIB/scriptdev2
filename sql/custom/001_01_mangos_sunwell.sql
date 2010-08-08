# SUNWELL INSTANCE UPDATE

# mob updates:

# update damage values
# npc 25507, 25372, 25486, 25591, 25592, 25595, 25599 (Sunblade Protector, unblade Scout, shadowsword vanquisher, painbringer, doomfire destroyer, chaos gazer, cataclysm hound)
UPDATE `creature_template` SET `dmg_multiplier`=1.0 WHERE `entry`IN (25507, 25372, 25486, 25591, 25592, 25595, 25599); 

# update AI
# npc 26101 (Fire Fiend) add spell cast 46551 (fire nova)
UPDATE `creature_template` SET `AIName`="EventAI" WHERE `entry`=26101;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26101;
INSERT INTO `creature_ai_scripts` VALUES(2610101,26101,0,0,100,3,0,0,20000,25000,11,46551,0,1,0,0,0,0,0,0,0,0,"Fire fiend - fire nova cast");
# npc 25483 (shadowsword manafiend)
UPDATE creature_ai_scripts SET action1_param2=0, action1_param3=16 WHERE id IN (2548302);
# npc 25509, 25599 (priestess of torment, cataclysm hound)
UPDATE creature_ai_scripts SET action1_param2=0 WHERE id IN (2550902, 2559902);
# npc 25373 (shadowsword soulbinder)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2537304,2537305);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param3`,`comment`) VALUES (2537304,25373,0,100,3,10000,10000,30000,40000,11,46427,16,"Shadowsword Soulbinder - Cast Domination");
# npc 25484 (shadowsword assassin)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2548403,2548404);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES (2548403,25484,100,3,10000,10000,20000,25000,11,46460,4,"Shadowsword Assassin - Cast Aimed Shot");
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`comment`) VALUES (2548404,25484,100,3,100,100,35000,45000,11,46459,1,"Shadowsword Assassin - Cast Assassins Mark");

# update loot values
# npc 26101 (fire fiend) add loot item 22445 (arcane dust) 
UPDATE `creature_template` SET `lootid`=26101 WHERE `entry`=26101;
DELETE FROM `creature_loot_template` WHERE `entry`=26101;
INSERT INTO `creature_loot_template` VALUES(26101,22445,100,0,2,2,0,0,0); 

# update npc hp&mana values
# npc 25507, 25486 (sunblade protector, shadowsword vanquisher)
UPDATE `creature_template` SET `minhealth`=387000, `maxhealth`=387000 WHERE `entry` IN(25507, 25486);
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=7800, `maxhealth`=7800,`minmana`=3410,`maxmana`=3410 WHERE `entry` IN(26101);
# npc 25363,25370,25371 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000, `minmana`=31600,`maxmana`=31600 WHERE `entry` IN(25363, 25370, 25371);
# npc 25367 (sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000 WHERE `entry` IN(25367);
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=171000, `maxhealth`=171000 WHERE `entry` IN(25369, 25368);
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=97600, `maxhealth`=97600 WHERE `entry` IN(25867);
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=14700, `maxhealth`=14700 WHERE `entry` IN(25372);
#npc 25483, 25506 (shadowsword manafiend, shadowsword lifeshaper)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000 WHERE `entry` IN (25483);
#npc 25506, 25373, 25509 (shadowsword lifeshaper, shadowsword soulbinder)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000, `minmana`=16200, `maxmana`=16200 WHERE `entry` IN(25506,25373,25509);
#npc 25484, 25591 (shadowsword assassin, painbringer)
UPDATE `creature_template` SET `minhealth`=176000, `maxhealth`=176000 WHERE `entry` IN(25484,25591);
#npc 25597 (oblivion mage)
UPDATE `creature_template` SET `minhealth`=140000, `maxhealth`=140000 WHERE `entry` IN(25597);
#npc 25592 (doomfire destroyer)
UPDATE `creature_template` SET `minhealth`=201000, `maxhealth`=201000 WHERE `entry` IN(25592);
#npc 25851 (volatile fiend)
UPDATE `creature_template` SET `minhealth`=8040, `maxhealth`=8040 WHERE `entry` IN(25851);
#npc 25595 (chaos gazer)
UPDATE `creature_template` SET `minhealth`=382000, `maxhealth`=382000 WHERE `entry` IN(25595);
#npc 25593 (apocalypse guard)
UPDATE `creature_template` SET `minhealth`=346000, `maxhealth`=346000 WHERE `entry` IN(25593);
#npc 25599 (cataclysm hound)
UPDATE `creature_template` SET `minhealth`=432000, `maxhealth`=432000 WHERE `entry` IN(25599);
#npc 25508 (shadowsword guardian)
UPDATE `creature_template` SET `minhealth`=517000, `maxhealth`=517000 WHERE `entry` IN(25508);
#npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `minhealth`=145000, `maxhealth`=145000, `minmana`=165000, `maxmana`=165000 WHERE `entry` IN(25588);

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

# fixes for boss_muru_entropius fight
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