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
(31673,40752,100,0,1,1,0,0,0);

UPDATE creature_ai_scripts SET event_type=2, event_param1=50, event_param2=5, event_param3=20000, event_param4=22000, action1_param2=0, action1_param3=1 WHERE id IN (2396003, 2396004);
UPDATE creature_ai_scripts SET action1_param3=0 WHERE id IN (2396001, 2396002);

UPDATE creature_template SET faction_A=35, modelid_1=13069 WHERE entry=24137;

DELETE FROM creature WHERE id=24137;
INSERT INTO creature (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
(230015, 24137, 574, 1, 181.163666, -87.773735, 13.822340, 1.856706, 1000, 4399);

UPDATE creature_template SET unit_flags=0 WHERE entry IN (27389, 27390, 31657, 31680);
UPDATE creature_template SET lootid=0 WHERE entry=24201;

-- ingvar the plunderer
DELETE FROM creature_ai_scripts WHERE creature_id=23997;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, COMMENT) VALUES
(2399701, 23997, 0, 100, 2, 2500, 2700, 50000, 60000, 11, 42750, 0, 1, 'Shadow Axe - Cast Throw Axe (normal mode)'),
(2399702, 23997, 0, 100, 4, 2500, 2700, 50000, 60000, 11, 59719, 0, 1, 'Shadow Axe - Cast Throw Axe (heroic mode)'),
(2399703, 23997, 1, 100, 2, 2500, 2700, 50000, 60000, 11, 42750, 0, 1, 'Shadow Axe - Cast Throw Axe OOC (normal mode)'),
(2399704, 23997, 1, 100, 4, 2500, 2700, 50000, 60000, 11, 59719, 0, 1, 'Shadow Axe - Cast Throw Axe OOC (heroic mode)'),
(2399705, 23997, 0, 100, 6, 12700, 12800, 0, 0, 41, 0, 0, 0, 'Shadow Axe - Despawn'),
(2399706, 23997, 1, 100, 6, 12700, 12800, 0, 0, 41, 0, 0, 0, 'Shadow Axe - Despawn OOC'),
(2399707, 23997, 0, 100, 6, 100, 150, 0, 0, 20, 0, 0, 0, 'Shadow Axe - Set no auto attack'),
(2399708, 23997, 0, 100, 6, 2000, 2100, 0, 0, 21, 0, 0, 0, 'Shadow Axe - Set no combat movement');

UPDATE creature_template SET unit_flags=34078722, AIName='EventAI' WHERE entry=23997;
UPDATE creature_template SET flags_extra=130 WHERE entry=23996;

DELETE FROM creature_ai_scripts WHERE creature_id=23996;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, COMMENT) VALUES
(2399601, 23996, 0, 100, 6, 100, 150, 0, 0, 20, 0, 0, 0, 'Shadow Axe Trigger - Set no auto attack'),
(2399602, 23996, 0, 100, 6, 500, 700, 0, 0, 21, 0, 0, 0, 'Shadow Axe Trigger - Set no combat movement');

-- set immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(23953,24200,24201,23954,31612,31656,31673,31679,30397,30398,30510,30529,30530,30532,30540,30748);

-- fix reputation for mobs
DELETE FROM `creature_onkill_reputation`  WHERE `creature_id` IN ('31662','30747','31660','31673','31658','31661','30748','31676','31675','31671','31663','31659','31679','31665','31666','31681','31669','31667','31678');
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
('31662', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30747', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31660', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31673', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('31658', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31661', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30748', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('31676', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31675', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31671', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'),
('31663', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31659', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31679', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('31665', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31666', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31681', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'),
('31669', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31667', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('31678', '1037', '1052', '7', '0', '5', '7', '0', '5', '1');
