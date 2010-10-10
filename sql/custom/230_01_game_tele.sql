-- add teleport point to storm peaks
DELETE FROM game_tele WHERE id = 1422;
INSERT INTO game_tele (id, position_x, position_y, position_z, orientation, map, name) VALUES (1422, 7885.409668, -1481.846680, 1627.570923, 2.992628, 571, "Sturmgipfel");