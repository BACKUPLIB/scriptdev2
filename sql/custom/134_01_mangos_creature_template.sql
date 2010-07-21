-- Pets sollen leben... und nein, Pets sind keine Flugmeister
UPDATE creature_template SET minhealth = 1, maxhealth = 1, npcflag = 0 WHERE entry IN (36911, 36908, 40703, 36979, 36909);