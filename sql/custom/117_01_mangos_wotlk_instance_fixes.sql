DELETE FROM creature WHERE id=30258;
INSERT INTO creature (id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
	(30258, 619, 2, 346.342987, -894.199036, -77.352600, 1.065079, 86400, 431392);

UPDATE creature_template SET MovementId=0, unit_flags=0 WHERE entry IN (29310, 31465);
UPDATE creature_template SET unit_flags=0, mechanic_immune_mask=1073741823, speed_walk=0.7, speed_run=0.7, flags_extra=2, ScriptName='mob_jedoga_volunteer', unit_flags=32768, type_flags=8 WHERE entry IN (31474, 30385);

DELETE FROM creature WHERE id=29310;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, position_x, position_y, position_z, orientation, spawntimesecs, curhealth, MovementType) VALUES
	(29310, 619, 3, 1, 26777, 372.331, -705.278, -16.1797, 5.42797, 14400, 212700, 0);

UPDATE creature_template SET MovementType=0, MovementId=0, InhabitType=3 WHERE entry IN (29308, 31469);
UPDATE creature SET MovementType=0, position_z=11.308110 WHERE id IN (29308, 31469);
UPDATE creature_template SET movementId=0, unit_flags=514 WHERE entry=29308;
UPDATE creature_template SET flags_extra=2, speed_walk=1.2, speed_run=1.2, inhabitType=4, ScriptName='mob_taldaram_flame_orb' WHERE entry=31687;

UPDATE creature SET position_x=301.973846, position_y=-236.094681, position_z=-12.995626, orientation=5.802917 WHERE guid=126605;
UPDATE creature SET position_x=298.978973, position_y=-236.570175, position_z=-12.239781, orientation=5.802917 WHERE guid=126606;
UPDATE creature SET position_x=296.277832, position_y=-239.225021, position_z=-11.894178, orientation=5.802917 WHERE guid=126444;
UPDATE creature SET position_x=297.002625, position_y=-242.901276, position_z=-12.593717, orientation=5.082917 WHERE guid=126445;

UPDATE creature_template SET dmg_multiplier=30 WHERE entry IN (26794, 26763);

UPDATE creature SET spawntimesecs=0 WHERE id=26793;

UPDATE creature_ai_scripts SET event_param1=4500, event_param2=5500 WHERE id=2692902;

UPDATE creature_ai_scripts SET event_type=2, event_param1=50, event_param2=5, event_param3=20000, event_param4=22000, action1_param2=0, action1_param3=1 WHERE id IN (2396003, 2396004);
UPDATE creature_ai_scripts SET action1_param3=0 WHERE id IN (2396001, 2396002);

UPDATE creature_template SET faction_A=35, modelid_1=13069 WHERE entry=24137;

DELETE FROM creature WHERE id=24137;
INSERT INTO creature (id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
	(24137, 574, 1, 181.163666, -87.773735, 13.822340, 1.856706, 1000, 4399);

UPDATE creature_template SET unit_flags=0 WHERE entry IN (27389, 27390, 31657, 31680);
UPDATE creature_template SET lootid=0 WHERE entry=24201;