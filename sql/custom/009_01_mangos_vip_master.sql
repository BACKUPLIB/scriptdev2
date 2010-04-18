-- Template
INSERT IGNORE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(88000, 0, 0, 0, 0, 0, 15214, 0, 15013, 0, 'OV Master', 'VIP Support', NULL, 0, 65, 65, 4667, 4667, 0, 0, 0, 35, 35, 147, 1, 1.14286, 1, 0, 169, 277, 0, 103, 1, 1430, 1573, 0, 0, 0, 1, 1, 0, 0, 0, 70.4704, 96.8968, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 690, 690, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1048, 0, 0, 'ov_master');

-- Spawns
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(900017, 88000, 1, 1, 1, 0, 0, 10080, 2183.59, 1346.62, 1.79985, 180, 0, 0, 4667, 0, 0, 0),
(900018, 88000, 1, 1, 1, 0, 0, -1287.94, 121.978, 131.511, 1.47262, 180, 0, 0, 4667, 0, 0, 0),
(900019, 88000, 1, 1, 1, 0, 0, 1579.83, -4289.7, 25.9595, 4.34953, 180, 0, 0, 4667, 0, 0, 0),
(900020, 88000, 1, 1, 1, 0, 0, -595.095, -4219.84, 38.1768, 3.65131, 180, 0, 0, 4667, 0, 0, 0),
(900021, 88000, 1, 1, 1, 0, 0, 10320.6, 820.55, 1326.38, 1.4663, 180, 0, 0, 4667, 0, 0, 0),
(900022, 88000, 0, 1, 1, 0, 0, -8904.52, -109.579, 81.8482, 3.9427, 180, 0, 0, 4667, 0, 0, 0),
(900023, 88000, 0, 1, 1, 0, 0, -8882.45, 608.6, 95.2578, 2.09153, 180, 0, 0, 4667, 0, 0, 0),
(900024, 88000, 0, 1, 1, 0, 0, -5011.21, -993.437, 503.883, 3.63325, 180, 0, 0, 4667, 0, 0, 0),
(900025, 88000, 0, 1, 1, 0, 0, -6220.4, 341.348, 383.138, 4.0448, 180, 0, 0, 4667, 0, 0, 0),
(900026, 88000, 0, 1, 1, 0, 0, 1837.1, 1609.11, 95.622, 4.69355, 180, 0, 0, 4667, 0, 0, 0),
(900027, 88000, 1, 1, 1, 0, 0, -2882.65, -256.216, 53.904, 3.51466, 180, 0, 0, 4667, 0, 0, 0),
(900028, 88000, 0, 1, 1, 0, 0, 1599.89, 203.143, -55.343, 1.83155, 180, 0, 0, 4667, 0, 0, 0),
(900029, 88000, 1, 1, 1, 0, 0, 16234, 16266.6, 13.4916, 0.921272, 180, 0, 0, 4667, 0, 0, 0),
(900030, 88000, 530, 1, 1, 0, 0, -4053.02, -13782.9, 75.8795, 6.01771, 300, 0, 0, 4667, 0, 0, 0),
(900031, 88000, 530, 1, 1, 0, 0, -4086.16, -11630.2, -138.689, 3.63481, 300, 0, 0, 4667, 0, 0, 0),
(900032, 88000, 530, 1, 1, 0, 0, 9478.41, -7352.7, 16.0993, 2.18493, 300, 0, 0, 4667, 0, 0, 0),
(900033, 88000, 530, 1, 1, 0, 0, 10336.9, -6379.35, 35.7481, 1.92575, 300, 0, 0, 4667, 0, 0, 0);

-- VIP-Items
INSERT IGNORE INTO `item_template` (`entry`, `class`, `subclass`, `unk0`, `name`, `displayid`, `Quality`, `Flags`, `Faction`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `ExtraFlags`) VALUES
(999000, 4, 0, 0, 'OV Necklace', 23717, 4, 0, 0, 1, 1, 0, 2, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 3, 2, 4, 2, 5, 2, 6, 2, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Die volle VIP power', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0),
(999001, 4, 0, -1, 'VIP-Hemd', 18916, 5, 1, 0, 1, 500, 0, 4, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Bist du kein VIP bekommst du dieses Item nie!', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0),
(999002, 4, 0, -1, 'VIP-Umhang', 31252, 5, 1, 0, 1, 500, 0, 19, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Bist du kein VIP bekommst du dieses Item nie!', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0),
(999003, 4, 0, -1, 'Froschgrüner Ring des VIPs', 16209, 5, 65, 0, 1, 500, 0, 12, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 3329, 0, 0, 0, 3600, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Bist du kein VIP bekommst du dieses Item nie!', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0);

-- Händler
INSERT IGNORE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(88000, 8586, 0, 0, 0),
(88000, 12302, 0, 0, 0),
(88000, 12303, 0, 0, 0),
(88000, 12330, 0, 0, 0),
(88000, 12351, 0, 0, 0),
(88000, 12353, 0, 0, 0),
(88000, 12354, 0, 0, 0),
(88000, 13317, 0, 0, 0),
(88000, 13326, 0, 0, 0),
(88000, 13327, 0, 0, 0),
(88000, 13328, 0, 0, 0),
(88000, 13329, 0, 0, 0),
(88000, 15292, 0, 0, 0),
(88000, 15293, 0, 0, 0),
(88000, 23162, 0, 0, 0),
(88000, 23713, 0, 0, 0),
(88000, 23714, 0, 0, 0),
(88000, 23716, 0, 0, 0),
(88000, 23720, 0, 0, 0),
(88000, 32566, 0, 0, 0),
(88000, 32588, 0, 0, 0),
(88000, 33219, 0, 0, 0),
(88000, 33223, 0, 0, 0),
(88000, 33224, 0, 0, 0),
(88000, 33225, 0, 0, 0),
(88000, 34492, 0, 0, 0),
(88000, 34493, 0, 0, 0),
(88000, 34499, 0, 0, 0),
(88000, 35223, 0, 0, 0),
(88000, 35225, 0, 0, 0),
(88000, 35226, 0, 0, 0),
(88000, 35227, 0, 0, 0),
(88000, 37719, 0, 0, 0),
(88000, 38233, 0, 0, 0),
(88000, 38576, 0, 0, 0),
(88000, 999000, 0, 0, 0),
(88000, 999001, 0, 0, 0),
(88000, 999002, 0, 0, 0),
(88000, 999003, 0, 0, 0);

-- some random Pfusch - schließlich haben wir nichts zu verschenken
UPDATE `item_template` SET `BuyPrice` = '200' WHERE `entry` = 23720;
UPDATE `item_template` SET `BuyPrice` = '2000' WHERE `entry` IN (34499, 34493);
UPDATE `item_template` SET `BuyPrice` = '5000' WHERE `entry` = 35227;
UPDATE `item_template` SET `BuyPrice` = '2000' WHERE `entry` = 38233;
UPDATE `item_template` SET `maxcount` = '1', `BuyPrice` = '50000' WHERE `entry` =23162;
UPDATE `item_template` SET `BuyPrice` = '2000' WHERE `entry` IN (23716, 23713, 32566, 32588, 33219, 33223);
UPDATE `gameobject_template` SET `flags` = flags|4 WHERE `entry` =185899;

-- Reitskills
INSERT IGNORE INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES
(88000, 33388, 810000, 0, 0, 40),
(88000, 33391, 5400000, 762, 75, 60),
(88000, 34090, 7200000, 762, 150, 70),
(88000, 34091, 45000000, 762, 225, 70);

-- Texte
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(110000, 'Plushy benötigt Monat für Monat ca. 80€ - nicht als Taschengeld, sondern um zu leben. Für nur 15€ kannst du Plushy helfen weiterhin zu existieren! Wir nehmen kein Geld für unsere Dienstleistung, sondern für den Erhalt von OrangeVirus.\r\n\r\nAls kleines Dankeschön für eure Spende erhaltet ihr den VIP Status. Dieser Status ermöglicht euch mit dem OV-Master, welcher in jeder Hauptstadt zu finden ist, zu Handeln. Er hält für euch ein paar nette Items bereit die es sonst nicht im Spiel zu erwerben gibt. Das wären z.B. Zügel des schnellen Spektraltigers, Forors Kiste der endlosen Widerstandsausstattung, Picknickkorb und noch viele weitere mehr oder weniger nützliche Dinge. Bald wird es bei diesem NPC eine VIP Questreihe geben die auf jede Stufe abgestimmt ist und euch nette Belohnungen gewährt.\r\n\r\nMehr Infos findest du unter http://ovi.orangevir.us/donate.php.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(110001, 'Um über das aktuelle Geschehen auf OrangeVirus auf dem Laufenden zu bleiben, empfiehlt es sich, regelmäßig in unser Newsforum (http://www.orangevir.us/viewforum.php?f=1) zu gucken.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);


