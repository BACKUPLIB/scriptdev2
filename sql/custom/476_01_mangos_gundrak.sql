-- instance gudrak fixes

UPDATE creature_template SET ScriptName='mob_colossus_elemental' WHERE entry=29573;

UPDATE creature_template SET ScriptName='', unit_flags=33554434, faction_A=35, faction_H=35 WHERE entry=29830;
DELETE FROM creature WHERE guid IN (127078, 127076, 127079, 127077);
UPDATE creature_template SET unit_flags=0, movementId=0 WHERE entry=29307;

UPDATE creature SET position_x=1649.685669, position_y=942.886780, position_z=107.203957 WHERE guid=127203;
DELETE FROM creature WHERE id=29932;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(230017, 29932, 604, 2, 1, 26644, 0, 1640.287964, 932.298462, 107.414001, 0.864934, 900000, 0, 0, 431392, 0, 0, 0);

-- update loot 
UPDATE creature_loot_template SET ChanceOrQuestChance=2.3 WHERE entry=30510 AND item=21524;
UPDATE creature_loot_template SET ChanceOrQuestChance=0, groupid=1 WHERE entry=29304 AND item=35584;
DELETE FROM creature_loot_template WHERE entry=29932;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount) VALUES
(29932, 43313, 0, 1, 1, 1),
(29932, 43311, 0, 1, 1, 1),
(29932, 43312, 0, 1, 1, 1),
(29932, 43310, 0, 1, 1, 1),
(29932, 45624, 100, 2, 1, 1),
(29932, 43228, 23.8, 0, 1, 4);
UPDATE creature_template SET lootid=29932 WHERE entry=29932;
UPDATE creature_template SET lootid=31673 WHERE entry=31673;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(29304,29307,29305,29306,29932,31360,31362,31365,31368,31370);

-- add creature_onkill_reputation
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN ('29932','31367','30926','30927','30928','31368','30930','30929','30931','31365','30932','30938','30933','30530','30935','30936','30939','30934','30925','31370','30941','30942');
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
('29932', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('31367', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('30926', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30927', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30928', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'), 
('31368', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('30930', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30929', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30931', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'), 
('31365', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('30932', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30938', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30933', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30530', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('30935', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'), 
('30936', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'), 
('30939', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30934', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'), 
('30925', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('31370', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'), 
('30941', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'), 
('30942', '1037', '1052', '7', '0', '15', '7', '0', '15', '1');
