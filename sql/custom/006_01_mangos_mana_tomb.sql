##########
## Fixes für Managruft und die Questreihe für Yor
## benötigt 'go_shaffars_stasis' und 'go_mana_tomb_stasis' in go_scripts.cpp
##########

# Insert Chamber-Templates in Managruft
UPDATE `gameobject_template` SET `type` = 10, `flags` = 32, `data0` = 1731, `ScriptName` = "go_shaffars_stasis" WHERE `entry` = 185522;
UPDATE `gameobject_template` SET `type` = 10, `flags` = 32, `data0` = 1730, `ScriptName` = "go_mana_tomb_stasis" WHERE `entry` = 185519;

# Setzt die Fraktion auf Feindlich (Horde und Allianz)
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry=22930; /* Yor */
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry IN (22825, 20888, 22827, 22826, 22828, 22920); /* Mobs in den Stasiskammer von Schergrat */

# Spawnt die Stasiskammern in der Managruft
DELETE FROM gameobject WHERE id IN (185519,185522);
INSERT INTO gameobject (`guid`,id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(160005, 185519, 557, 2, -233.793915, -21.134533, 16.786190, 1.534669, 680000, 100, 1),
(160006, 185522, 557, 2, -21.752764, -226.521759, 0.467569, 2.825080, 680000, 100, 1); 

# Spawnt die Sockeln der Stasiskammern in der Managruft
DELETE FROM gameobject WHERE id=184998 AND map=557;
INSERT INTO gameobject (`guid`,id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(160007, 184998, 557, 2, -233.793915, -21.134533, 16.786190, 1.534669, 680000, 100, 1),
(160008, 184998, 557, 2, -21.752764, -226.521759, 0.467569, 2.825080, 680000, 100, 1); 

# Gibt Yor das AI scrip
DELETE FROM creature_ai_scripts WHERE `id`=2293002;
INSERT INTO creature_ai_scripts (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
(2293002, 22930, 0, 0, 70, 5, 8000, 9000, 12000, 13000, 11, 50868, 0, 0, 'Yor - Stamp');

#  Fixes für den Trash in Managruft 
UPDATE creature_ai_scripts SET action1_param1=39672, COMMENT='Nexus Terror - Cast Curse of Pain'  WHERE id=1930704; /* Fluch der Pain statt Fluch der Machtlosigkeit, da der Spell in zusammenwirken mit Feenfeuer (Tiergestalt) buggt. */
UPDATE creature_ai_scripts SET action1_param3=0 WHERE id IN (1831701, 1831702, 1831703, 1831704, 1831705, 1831706); /* Verhindert ein unterbrechen beim heilen */
