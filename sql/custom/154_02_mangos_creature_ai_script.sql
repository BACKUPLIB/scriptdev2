DELETE FROM creature_ai_scripts WHERE creature_id=105000;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment) VALUES
	(10500001, 105000, 0, 100, 2, 2500, 2700, 50000, 60000, 11, 53454, 0, 1, 'Impale trigger - Cast Impale (normal mode)'),
	(10500002, 105000, 0, 100, 4, 2500, 2700, 50000, 60000, 11, 59446, 0, 1, 'Impale trigger - Cast Impale (heroic mode)'),
	(10500003, 105000, 1, 100, 2, 2500, 2700, 50000, 60000, 11, 53454, 0, 1, 'Impale trigger - Cast Impale OOC (normal mode)'),
	(10500004, 105000, 1, 100, 4, 2500, 2700, 50000, 60000, 11, 59446, 0, 1, 'Impale trigger - Cast Impale OOC (heroic mode)'),
	(10500005, 105000, 1, 100, 6, 100, 150, 50000, 60000, 11, 42373, 0, 1, 'Impale trigger - Burrow OOC'),
	(10500006, 105000, 0, 100, 6, 100, 150, 50000, 60000, 11, 42373, 0, 1, 'Impale trigger - Burrow'),
	(10500007, 105000, 0, 100, 6, 100, 150, 0, 0, 20, 0, 0, 0, 'Impale trigger - Set no auto attack'),
	(10500008, 105000, 0, 100, 6, 100, 150, 0, 0, 21, 0, 0, 0, 'Impale trigger - Set no combat movement');