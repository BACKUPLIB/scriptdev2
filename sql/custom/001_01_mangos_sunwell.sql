# SUNWELL INSTANCE UPDATE

# mob updates:

# npc 25507 (Sunblade Protector)
# update damage
UPDATE `creature_template` SET `dmg_multiplier`=1.0 WHERE `entry`=25507; 

# npc 25372 (Sunblade Scout)
# update damage
UPDATE `creature_template` SET `dmg_multiplier`=1.0 WHERE `entry`=25372;

# npc 26101 (Fire Fiend)
# add spell cast 46551 (fire nova)
UPDATE `creature_template` SET `AIName`="EventAI" WHERE `entry`=26101;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26101;
INSERT INTO `creature_ai_scripts` VALUES(2610101,26101,0,0,100,3,0,0,20000,25000,11,46551,0,1,0,0,0,0,0,0,0,0,"Fire fiend - fire nova cast");
# add loot item 22445 (arcane dust) 
UPDATE `creature_template` SET `lootid`=26101 WHERE `entry`=26101;
DELETE FROM `creature_loot_template` WHERE `entry`=26101;
INSERT INTO `creature_loot_template` VALUES(26101,22445,100,0,2,2,0,0,0); 

# update npc hp&mana values
# npc 25507 (sunblade protector)
UPDATE `creature_template` SET `minhealth`=387000, `maxhealth`=387000 WHERE `entry`=25507;
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=7800, `maxhealth`=7800,`minmana`=3410,`maxmana`=3410 WHERE `entry`=26101;
# npc 25363,25370,25371 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000, `minmana`=31600,`maxmana`=31600 WHERE `entry`=25363||`entry`=25370||`entry`=25371;
# npc 25367 (sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=137000, `maxhealth`=137000 WHERE `entry`=25367;
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=171000, `maxhealth`=171000 WHERE `entry`=25369||`entry`=25368;
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=97600, `maxhealth`=97600 WHERE `entry`=25867;
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=14700, `maxhealth`=14700 WHERE `entry`=25372;

# boss updates:

# fixes for boss_Kalecgos fight
# add npc 24891 (Kalecgos humanoid)
DELETE FROM `creature` WHERE `GUID`=600000;
INSERT INTO `creature` VALUES(600000,24891,580,1,1,0,0,1702.3,938.0,-74.55,4.93,30000,0,0,828555,169350,0,0);
# update kalecgos, sathorvarr, kalecgos_humanoid
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287',`minmana`=1690000, `maxmana`=1690000  WHERE `entry` = 24850; 
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287'  WHERE `entry` = 24892;
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287'  WHERE `entry` = 24891;
# update gameobject 187055 (spectral rift)
UPDATE gameobject_template SET `type`= '22', `data0`='0', `data3`='1', `data6`='0', `data10`='0' WHERE `entry`=187055;

# fixes for boss_brutallus fight
# update npc 24882 (Brutallus)
UPDATE `creature_template` SET `minhealth`=7350000,`maxhealth`=7350000 WHERE `entry`=24882;

# fixes for boss_felmyst fight
# add npc 25038 (Felmyst)
DELETE FROM `creature` WHERE `GUID`=700000;
INSERT INTO `creature` VALUES(700000,25038,580,1,1,0,0,1459.34,636.8,19.56,19.95,30000,0,0,4900000,3390,0,0);
UPDATE `creature_template` SET `ScriptName`="boss_felmyst" WHERE `entry` = 25038;
UPDATE `creature_template` SET `ScriptName`="mob_felmyst_vapor"WHERE `entry`= 25265;
UPDATE `creature_template` SET `ScriptName`="mob_deathcloud" WHERE `entry`=25703;

# fixes for boss_eredar_twins fight
# update npc 25165 (Sacrolash)
UPDATE `creature_template` SET `ScriptName` = "boss_sacrolash", `minhealth`=2018000, `maxhealth`=2018000 WHERE `entry` = 25165;
# update npc 25166 (Alythess)
UPDATE `creature_template` SET `ScriptName` = "boss_alythess", `minhealth`=2018000, `maxhealth`=2018000  WHERE `entry` = 25166;
# update npc 25214 (Shadow Image)
UPDATE `creature_template` SET `ScriptName` = "npc_shadow_image" WHERE `entry` = 25214;
# update go 50439 (The Second Gate)
UPDATE `gameobject` SET `position_x`=1832.81, `position_y`=671.08, `position_z`=50.21, state=1 WHERE `guid`=50439;
