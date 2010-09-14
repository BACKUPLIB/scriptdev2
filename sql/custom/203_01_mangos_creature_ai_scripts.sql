-- Make event (kill credit, LOS) repeatable, repeat time of 2s to save cpu load
UPDATE creature_ai_scripts SET event_flags = 1, event_param3 = 2, event_param4 = 2  WHERE id = 2785301;
