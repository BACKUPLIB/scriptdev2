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