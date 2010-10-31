DELETE FROM quest_start_scripts WHERE id IN (12932, 12954, 12933, 12935, 12936, 12948);
INSERT INTO quest_start_scripts (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`,`comments`) VALUES
(12932, 8, 10, 30014, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, ""),
(12954, 8, 10, 30014, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, ""),
(12933, 8, 10, 30017, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, ""),
(12935, 8, 10, 30020, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, ""),
(12936, 8, 10, 30023, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, ""),
(12948, 8, 10, 30022, 180000, 5780.004883, -2989.956299, 272.972748, 5.114654, "");

UPDATE quest_template SET StartScript=12932 WHERE entry=12932;
UPDATE quest_template SET StartScript=12954 WHERE entry=12954;
UPDATE quest_template SET StartScript=12933 WHERE entry=12933;
UPDATE quest_template SET StartScript=12935 WHERE entry=12935;
UPDATE quest_template SET StartScript=12936 WHERE entry=12936;
UPDATE quest_template SET StartScript=12948 WHERE entry=12948;

UPDATE creature_template SET ScriptName='npc_amphitheater_of_anguish' WHERE entry IN (30014, 30017, 30026, 30020, 30023, 30022, 30019, 30025, 30024);

DELETE FROM creature_ai_scripts WHERE creature_id=30113;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, COMMENT) VALUES
(3011301, 30113, 0, 100, 3, 2500, 2700, 10000, 11000, 11, 30113, 1, 1, 'Whisker - Flipper Thwack');

UPDATE creature_template SET AIName='EventAI' WHERE entry=30113;
UPDATE creature_template SET armor=8503, faction_A=16, faction_H=16, mindmg=352, maxdmg=499, attackpower=408, dmg_multiplier=7.5, unit_class=2, minrangedmg=302, maxrangedmg=449, rangedattackpower=57 WHERE entry IN (30024, 30026);

--fix quest 12861
UPDATE `quest_template` SET `ReqSpellCast1` = '0' WHERE `entry` =12861;
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (29686, 29700);

DELETE FROM `creature_ai_scripts` WHERE `id` IN ('2968601', '2970001');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2968601', '29686', '0', '0', '100', '0', '55083', '-1', '0', '0', '33', '29686', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('2970001', '29700', '8', '0', '100', '0', '55083', '-1', '0', '0', '33', '29686', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
