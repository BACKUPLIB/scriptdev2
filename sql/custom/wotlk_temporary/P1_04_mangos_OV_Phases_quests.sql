
/*
    NPC 20735 holds the daily dungeon quests for all phases. Some Quests are
    added and loot changes (see emblem query).
    In Phase 4 add Dungeon Weekly to npc 20735 
    original the hero - daylies are removed in phase 4 but we wont do that
*/

-- =============
-- phase  1 - 3
-- =============

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
(20735, 13256),
(20735, 14199);



-- quest end
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
(20735, 13256),
(20735, 14199);



-- =============
-- phase    4
-- =============

/*
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
(20735, 13256),
(20735, 14199),
(20735, 24579),
(20735, 24580),
(20735, 24581),
(20735, 24582),
(20735, 24583),
(20735, 24584),
(20735, 24585),
(20735, 24586),
(20735, 24587),
(20735, 24588),
(20735, 24589),
(20735, 24590);

-- quest end
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
(20735, 13256),
(20735, 14199),
(20735, 24579),
(20735, 24580),
(20735, 24581),
(20735, 24582),
(20735, 24583),
(20735, 24584),
(20735, 24585),
(20735, 24586),
(20735, 24587),
(20735, 24588),
(20735, 24589),
(20735, 24590);
*/
