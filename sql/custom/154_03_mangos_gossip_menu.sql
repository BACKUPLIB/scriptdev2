DELETE FROM gossip_menu WHERE entry=25200;
INSERT INTO gossip_menu (entry, text_id) VALUES
	(25200, 1);

DELETE FROM gossip_menu_option WHERE menu_id=25200;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_script_id) VALUES
	(25200, 25200, 0, "Ich will über die Brücke.", 1, 1, 25200);

DELETE FROM gossip_scripts WHERE id=25200;
INSERT INTO gossip_scripts (id, command, datalong, x, y, z, o) VALUES
	(25200, 6, 604, 1801.600952, 743.734192, 119.207565, 0.000943);