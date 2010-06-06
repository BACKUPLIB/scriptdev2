# add item 34209 to sacrolashs & alythess' loot
DELETE FROM `reference_loot_template` WHERE `entry` = 34085 && `item` = 34209;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES (34085,34209,0,1,1,1);