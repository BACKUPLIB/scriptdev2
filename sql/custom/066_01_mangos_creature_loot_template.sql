/*
old values:
DELETE FROM `creature_loot_template` WHERE `entry` = 24001;
INSERT INTO `creature_loot_template` VALUES (24001,33496,0,1,1,1,0,0,0);
INSERT INTO `creature_loot_template` VALUES (24001,33497,0,1,1,1,0,0,0);
INSERT INTO `creature_loot_template` VALUES (24001,33498,0,1,1,1,0,0,0);
INSERT INTO `creature_loot_template` VALUES (24001,33499,0,1,1,1,0,0,0);
INSERT INTO `creature_loot_template` VALUES (24001,33500,0,1,1,1,0,0,0);
*/
# set tl4 in za to item 33809 (Amani War Bear)
DELETE FROM `creature_loot_template` WHERE `entry` = 24001;
INSERT INTO `creature_loot_template` VALUES (24001,33809,0.05,0,1,1,0,0,0);