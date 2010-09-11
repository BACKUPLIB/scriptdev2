-- add Season 5 vendors

UPDATE creature_template SET faction_A = 7, faction_H = 7 WHERE entry = 34073;
DELETE FROM creature WHERE id IN (33929, 34073, 32359, 33916, 34093, 32355, 31865, 31864, 31863);

/* Area52 NPC's */
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, curhealth) VALUES 
(NULL, 34073, 530, 1, 1, 3076.219971, 3632.760010, 143.781006, 2.357170, 11828),
(NULL, 33929, 530, 1, 1, 3076.991942, 3636.742188, 143.780792, 3.449997, 6986),
/* Gadgetan */
(NULL, 34073, 1, 1, 1, -7125.754883, -3763.133545, 9.292520, 0.4089116, 11828),
(NULL, 33929, 1, 1, 1, -7123.330078, -3766.679936, 9.403390, 0.000000, 6986),
/* Dalaran */
(NULL, 32359, 571, 1, 1, 5753.707520, 585.488098, 614.968811, 5.894027, 6986),
(NULL, 34073, 571, 1, 1, 5751.486816, 584.650818, 614.968811, 5.831595, 11828),
(NULL, 33929, 571, 1, 1, 5751.687988, 583.033081, 614.968811, 5.775832, 6986);

-- add medallion of the horde
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES (34073,42122,0,0,2559,2605);