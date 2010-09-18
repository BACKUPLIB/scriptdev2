-- fixes for utgarde keep

-- add loot for NPC 31673 (heroic Ingvar the Plunderer) (matnis bug 2940)
DELETE FROM `creature_loot_template` WHERE `entry` = 31673;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES 
(31673,33330,-100,0,1,1,0,0,0),
(31673,37186,0,2,1,1,0,0,0),
(31673,37188,0,2,1,1,0,0,0),
(31673,37189,0,2,1,1,0,0,0),
(31673,37190,0,2,1,1,0,0,0),
(31673,37191,0,1,1,1,0,0,0),
(31673,37192,0,1,1,1,0,0,0),
(31673,37193,0,1,1,1,0,0,0),
(31673,37194,0,1,1,1,0,0,0),
(31673,41796,100,0,1,1,7,755,1),
(31673,43102,100,0,1,1,0,0,0),
(31673,43228,100,0,1,4,1,57940,0),
(31673,43662,-100,0,1,1,0,0,0),
(31673,43852,2,0,1,1,0,0,0),
(31673,47241,100,0,1,1,0,0,0);


