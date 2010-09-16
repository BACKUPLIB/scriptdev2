DELETE FROM creature_ai_scripts WHERE creature_id=30113;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment) VALUES
	(3011301, 30113, 0, 100, 3, 2500, 2700, 10000, 11000, 11, 30113, 1, 1, 'Whisker - Flipper Thwack');

UPDATE creature_template SET AIName='EventAI' WHERE entry=30113;
UPDATE creature_template SET armor=8503, faction_A=16, faction_H=16, mindmg=352, maxdmg=499, attackpower=408, dmg_multiplier=7.5, unit_class=2, minrangedmg=302, maxrangedmg=449, rangedattackpower=57 WHERE entry IN (30024, 30026);