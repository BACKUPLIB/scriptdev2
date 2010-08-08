# fix quest 1043
UPDATE gameobject_template SET flags = 32 WHERE entry = 19030

# Spawnfix shadowstalker getry
DELETE FROM creature WHERE id = 25729;
INSERT INTO creature(id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth)
VALUES (25729, 571, 1, 1, 3123.091309, 6592.870117, 97.868080, 1.582328, 300, 0, 79.840);

# add escort script to NPC skywing for quest 10898
UPDATE `creature_template` SET `ScriptName` = "npc_skywing" WHERE `entry` =22424;