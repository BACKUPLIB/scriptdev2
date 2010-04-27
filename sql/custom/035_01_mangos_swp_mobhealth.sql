#update swp boss trashmob hp & damage for patch 333a without wotlk

#update damage for swp bosses
UPDATE `creature_template` SET `dmg_multiplier` = 43 WHERE `entry` IN (24850, 24892, 24882, 25038, 25165, 25166, 25741, 25315);
#update brutallus hp
UPDATE `creature_template` SET `minhealth`=12300000 ,`maxhealth`=12300000 WHERE `entry`=24882;

# npc 25507, 25486 (sunblade protector, shadowsword vanquisher)
UPDATE `creature_template` SET `minhealth`=580500, `maxhealth`=580500, `dmg_multiplier` = 2 WHERE `entry` IN(25507, 25486);
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=11700, `maxhealth`=11700, `dmg_multiplier` = 2 WHERE `entry` IN(26101);
# npc 25363,25370,25371,25367 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest,sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=205500, `maxhealth`=205500, `dmg_multiplier` = 15 WHERE `entry` IN(25363, 25370, 25371,25367);
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=256500, `maxhealth`=256500, `dmg_multiplier` = 15 WHERE `entry` IN(25369, 25368);
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=146400, `maxhealth`=146400, `dmg_multiplier` = 15 WHERE `entry` IN(25867);
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=22050, `maxhealth`=22050 WHERE `entry` IN(25372);
#npc 25483, 25506, 25373, 25509 (shadowsword manafiend, shadowsword lifeshaper, shadowsword soulbinder)
UPDATE `creature_template` SET `minhealth`=210000, `maxhealth`=210000, `dmg_multiplier` =  2 WHERE `entry` IN(25483,25506,25373,25509);
#npc 25484, 25591 (shadowsword assassin, painbringer)
UPDATE `creature_template` SET `minhealth`=264000, `maxhealth`=264000, `dmg_multiplier` = 15 WHERE `entry` IN(25484,25591);
#npc 25597 (oblivion mage)
UPDATE `creature_template` SET `minhealth`=210000, `maxhealth`=210000, `dmg_multiplier` = 2 WHERE `entry` IN(25597);
#npc 25592 (doomfire destroyer)
UPDATE `creature_template` SET `minhealth`=301500, `maxhealth`=301500, `dmg_multiplier` = 2 WHERE `entry` IN(25592);
#npc 25851 (volatile fiend)
UPDATE `creature_template` SET `minhealth`=12060, `maxhealth`=12060, `dmg_multiplier` = 2 WHERE `entry` IN(25851);
#npc 25595 (chaos gazer)
UPDATE `creature_template` SET `minhealth`=573000, `maxhealth`=573000, `dmg_multiplier` = 2 WHERE `entry` IN(25595);
#npc 25593 (apocalypse guard)
UPDATE `creature_template` SET `minhealth`=519000, `maxhealth`=519000, `dmg_multiplier` = 15 WHERE `entry` IN(25593);
#npc 25599 (cataclysm hound)
UPDATE `creature_template` SET `minhealth`=648000, `maxhealth`=648000, `dmg_multiplier` = 2 WHERE `entry` IN(25599);
#npc 25508 (shadowsword guardian)
UPDATE `creature_template` SET `minhealth`=775500, `maxhealth`=775500, `dmg_multiplier` = 15 WHERE `entry` IN(25508);
#npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `minhealth`=217500, `maxhealth`=217500, `dmg_multiplier` = 2 WHERE `entry` IN(25588);

# update event ai for trashmobs
# npc 25507 cast fellightning every 10-15 sec
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id` IN (2550702);
# npc 25368 cast slaying shot 
UPDATE `creature_ai_scripts` SET `event_param3`=15000 WHERE `id` IN (2536803);