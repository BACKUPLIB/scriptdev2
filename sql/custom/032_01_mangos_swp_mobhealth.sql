#update swp trashmob hp & damage for patch 333a without wotlk

# npc 25507, 25486 (sunblade protector, shadowsword vanquisher)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25507, 25486);
# npc 26101 (fire fiend)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(26101);
# npc 25363,25370,25371 (sunblade cabalist, sunblade dusk priest, sunblade dawn priest)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25363, 25370, 25371);
# npc 25367 (sunblade arch mage)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3, `maxhealth`=`maxhealth` * 1.5 WHERE `entry` IN(25367);
# npc 25369,25368 (sunblade vindicator, sunblade slayer)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3, `maxhealth`=`maxhealth` * 1.5 WHERE `entry` IN(25369, 25368);
# npc 25867 (sunblade dragonhawk)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25867);
# npc 25372 (sunblade scout)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5 WHERE `entry` IN(25372);
#npc 25483, 25506 (shadowsword manafiend, shadowsword lifeshaper)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN (25483);
#npc 25506, 25373, 25509 (shadowsword lifeshaper, shadowsword soulbinder)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25506,25373,25509);
#npc 25484, 25591 (shadowsword assassin, painbringer)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25484,25591);
#npc 25597 (oblivion mage)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25597);
#npc 25592 (doomfire destroyer)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25592);
#npc 25851 (volatile fiend)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25851);
#npc 25595 (chaos gazer)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25595);
#npc 25593 (apocalypse guard)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25593);
#npc 25599 (cataclysm hound)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25599);
#npc 25508 (shadowsword guardian)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25508);
#npc 25588 (hand of the deceiver)
UPDATE `creature_template` SET `minhealth`=`minhealth` * 1.5, `maxhealth`=`maxhealth` * 1.5, `dmg_multiplier` = `dmg_multiplier` * 1.3 WHERE `entry` IN(25588);