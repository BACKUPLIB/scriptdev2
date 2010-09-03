/*  Quests Phase I  */

-- quest start
DELETE FROM `creature_questrelation` WHERE `id` = 20735;
INSERT INTO `creature_questrelation` (`id`,`quest`) VALUES
(20735, 13245),
(20735, 13246),
(20735, 13247),
(20735, 13248),
(20735, 13249),
(20735, 13250),
(20735, 13251),
(20735, 13252),
(20735, 13253),
(20735, 13254),
(20735, 13255),
(20735, 13256);

--quest end
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735;
INSERT INTO `creature_involvedrelation`(`id`,`quest`) VALUES
(20735, 13245),
(20735, 13246),
(20735, 13247),
(20735, 13248),
(20735, 13249),
(20735, 13250),
(20735, 13251),
(20735, 13252),
(20735, 13253),
(20735, 13254),
(20735, 13255),
(20735, 13256);


/*
    NPC 20735 holds the daily dungeon quests for all phases. Some Quests are
    added and loot changes (see emblem query).
*/
