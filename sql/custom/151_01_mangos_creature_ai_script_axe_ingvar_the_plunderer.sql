DELETE FROM creature_ai_scripts WHERE creature_id=23997;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment) VALUES
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
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment) VALUES
	(2399601, 23996, 0, 100, 6, 100, 150, 0, 0, 20, 0, 0, 0, 'Shadow Axe Trigger - Set no auto attack'),
	(2399602, 23996, 0, 100, 6, 500, 700, 0, 0, 21, 0, 0, 0, 'Shadow Axe Trigger - Set no combat movement');