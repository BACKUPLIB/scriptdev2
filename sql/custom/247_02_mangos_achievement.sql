-- fix achievement 1956 (higher learning)7
-- set books consumable, TODO: despawn after reading, not on activate!
UPDATE `gameobject_template` SET `data5` = 1 WHERE `entry` IN (192708,192706,192871,192905,192710,192869,192880,192886,192895,192713,192884,192889,192894,
192890,192866,192881,192872,192891,192709,192651,192888,192883,192711,192652,192887,192653,192865,192874,192885,192868,192870,192867,192707,192882,192896);
-- set spawntime to 4h
UPDATE `gameobject` SET `spawntimesecs` = 14400 WHERE `id` IN (192708,192706,192871,192905,192710,192869,192880,192886,192895,192713,192884,192889,192894,
192890,192866,192881,192872,192891,192709,192651,192888,192883,192711,192652,192887,192653,192865,192874,192885,192868,192870,192867,192707,192882,192896);
-- books I
DELETE FROM `pool_template` WHERE `entry` = 30000;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30000,1,"Schools Of Arcane Magic I");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30000;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(82277,30000,0,"The Worst Mage in Dalaran: A Children's Book"),
(82278,30000,0,"The Schools of Arcane Magic - Introduction"),
(82263,30000,0,"The Archmage Antonidas - Part II"),
(82730,30000,0,"The Old Wizard's Almanac");
-- books II
DELETE FROM `pool_template` WHERE `entry` = 30001;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30001,1,"Schools Of Arcane Magic II");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30001;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(82280,30001,0,"The Schools of Arcane Magic - Conjuration"),
(31334,30001,0,"LAVA BLAST - by Pyroco"),
(82265,30001,0,"Journal of Archmage Antonidas"),
(82269,30001,0,"In Time, the Arcane Corrupts All!"),
(82273,30001,0,"Kirin Tor Monthly (March Issue)");
-- books III
DELETE FROM `pool_template` WHERE `entry` = 30002;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30002,1,"Schools Of Arcane Magic III");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30002;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(82282,30002,0,"The Schools of Arcane Magic - Enchantment"),
(82268,30002,0,"Portals are NOT Garbage Bins!"),
(82270,30002,0,"Kirin Tor Monthly (November Issue)"),
(82728,30002,0,"STAY OUT!!!"),
(82272,30002,0,"Remedial Magic 101: Tips from the Pros");
-- books IV
DELETE FROM `pool_template` WHERE `entry` = 30003;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30003,1,"Schools Of Arcane Magic IV");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30003;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(82259,30003,0,"The Schools of Arcane Magic - Necromancy"),
(82264,30003,0,"The Archmage Antonidas - Part III"),
(32462,30003,0,"Thinking with Portals - A Memorandum on Proper Portal Usage"),
(82271,30003,0,"To Do Today");
-- books V
DELETE FROM `pool_template` WHERE `entry` = 30004;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30004,1,"Schools Of Arcane Magic V");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30004;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(82674,30004,0,"Damaged Apprentice Journal"),
(82279,30004,0,"The Schools of Arcane Magic - Abjuration"),
(82267,30004,0,"Blinking Rules & Regulations"),
(33156,30004,0,"Bundle of Romantic Correspondences");
-- books VI
DELETE FROM `gameobject` WHERE `id` = 192711;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(300000,192711,571,1,1,5777.8,832.618,680.279,0.541051,1,180,255,1);
DELETE FROM `pool_template` WHERE `entry` = 30005;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30005,1,"Schools Of Arcane Magic VI");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30005;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(33288,30005,0,"Kirin Tor Monthly (May Issue)"),
(82275,30005,0,"On the Virtues of Magic"),
(300000,30005,0,"The Schools of Arcane Magic - Divination"),
(81806,30005,0,"Losses of the Third War");
-- books VII
DELETE FROM `pool_template` WHERE `entry` = 30006;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30006,1,"Schools Of Arcane Magic VII");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30006;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(30969,30006,0,"The Schools of Arcane Magic - Illusion"),
(82261,30006,0,"The Dangers of Magic Abuse"),
(82262,30006,0,"The Archmage Antonidas - Part I"),
(66108,30006,0,"The Fluffy Bunny"),
(81869,30006,0,"The Fate of Apprentice Argoly");
-- books VIII
DELETE FROM `pool_template` WHERE `entry` = 30007;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(30007,1,"Schools Of Arcane Magic VIII");
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 30007;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
(81819,30007,0,"Weathered Diary - Dates from the Third War"),
(82260,30007,0,"The Schools of Arcane Magic - Transmutation"),
(82266,30007,0,"Polymorphic Rules & Regulations"),
(82274,30007,0,"Excerpts from the Journal of Archmage Vargoth");