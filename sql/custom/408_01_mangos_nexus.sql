-- fix NPCs 26793;
UPDATE creature SET spawntimesecs = 1200 WHERE id = 26793;
UPDATE creature_template SET unit_flags = 0 WHERE entry = 26793;

/* nexus anomalus model id add */
UPDATE creature_template SET modelid_1=9510, modelid_3=9510 WHERE entry=26918;

-- update creature positions
UPDATE creature SET position_x=301.973846, position_y=-236.094681, position_z=-12.995626, orientation=5.802917 WHERE guid=126605;
UPDATE creature SET position_x=298.978973, position_y=-236.570175, position_z=-12.239781, orientation=5.802917 WHERE guid=126606;
UPDATE creature SET position_x=296.277832, position_y=-239.225021, position_z=-11.894178, orientation=5.802917 WHERE guid=126444;
UPDATE creature SET position_x=297.002625, position_y=-242.901276, position_z=-12.593717, orientation=5.082917 WHERE guid=126445;

UPDATE creature_template SET dmg_multiplier=30 WHERE entry IN (26794, 26763);
UPDATE creature_template SET `mindmg` = 266, `maxdmg` = 760 WHERE entry = 26763;

UPDATE creature SET spawntimesecs=40 WHERE id=26793;

-- eventAI
UPDATE creature_ai_scripts SET event_param1=4500, event_param2=5500 WHERE id=2692902;
DELETE FROM creature_ai_scripts WHERE id IN (2679305, 2679306);

-- set immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(26731,26763,26794,26723,26796,26798);

-- add creature_onkill_reputation
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN ('30459','30529','30460','30457','30517','30516','30485','30522','30510','30478','30540','30525','30524','30526','30528','30473','30532','30519');
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
('30459', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'),
('30529', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('30460', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30457', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30517', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30516', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30485', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30522', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'),
('30510', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('30478', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30540', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('30525', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30524', '1037', '1052', '7', '0', '30', '7', '0', '30', '1'),
('30526', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30528', '1037', '1052', '7', '0', '5', '7', '0', '5', '1'),
('30473', '1037', '1052', '7', '0', '15', '7', '0', '15', '1'),
('30532', '1037', '1052', '7', '0', '250', '7', '0', '250', '1'),
('30519', '1037', '1052', '7', '0', '15', '7', '0', '15', '1');

-- fix NPC 26105 / Quest 11905
UPDATE `mangos`.`creature_template` SET `flags_extra` = '128' WHERE `creature_template`.`entry` =26105;
