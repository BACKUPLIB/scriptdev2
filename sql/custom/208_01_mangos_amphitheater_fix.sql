DELETE FROM quest_start_scripts WHERE id IN (12932, 12954, 12933, 12935, 12936, 12948);
INSERT INTO quest_start_scripts VALUES
	(12932, 8, 10, 30014, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654),
	(12954, 8, 10, 30014, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654),
	(12933, 8, 10, 30017, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654),
	(12935, 8, 10, 30020, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654),
	(12936, 8, 10, 30023, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654),
	(12948, 8, 10, 30022, 180000, 0, 0, 0, 0, 5780.004883, -2989.956299, 272.972748, 5.114654);

UPDATE quest_template SET StartScript=12932 WHERE entry=12932;
UPDATE quest_template SET StartScript=12954 WHERE entry=12954;
UPDATE quest_template SET StartScript=12933 WHERE entry=12933;
UPDATE quest_template SET StartScript=12935 WHERE entry=12935;
UPDATE quest_template SET StartScript=12936 WHERE entry=12936;
UPDATE quest_template SET StartScript=12948 WHERE entry=12948;

UPDATE creature_template SET ScriptName='npc_amphitheater_of_anguish' WHERE entry IN (30014, 30017, 30026, 30020, 30023, 30022, 30019, 30025, 30024);