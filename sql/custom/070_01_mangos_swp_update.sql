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