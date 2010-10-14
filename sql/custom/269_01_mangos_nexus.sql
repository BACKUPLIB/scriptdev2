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

UPDATE creature SET spawntimesecs=0 WHERE id=26793;

-- eventAI
UPDATE creature_ai_scripts SET event_param1=4500, event_param2=5500 WHERE id=2692902;

-- set immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(26731,26763,26794,26723,26796,26798);
