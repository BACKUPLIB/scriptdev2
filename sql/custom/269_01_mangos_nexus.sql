-- fix NPCs 26793;
UPDATE creature SET spawntimesecs = 1200 WHERE id = 26793;

UPDATE creature_template SET unit_flags = 0 WHERE entry = 26793;