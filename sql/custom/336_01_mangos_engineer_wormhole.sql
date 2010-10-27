DELETE FROM gossip_menu WHERE entry=10668;
INSERT INTO gossip_menu (entry, text_id) VALUES
	(10668, 14785);

DELETE FROM gossip_menu_option WHERE menu_id=10668;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_script_id) VALUES
	(10668, 0, 0, "Heulender Fjord", 1, 1, 106681),
	(10668, 1, 0, "Boreanische Tundra", 1, 1, 106682),
	(10668, 2, 0, "Sholazarbecken", 1, 1, 106683),
	(10668, 3, 0, "Sturmgipfel", 1, 1, 106684),
	(10668, 4, 0, "Eiskrone", 1, 1, 106685);

DELETE FROM gossip_scripts WHERE id IN (106681, 106682, 106683, 106684, 106685);
INSERT INTO gossip_scripts (id, command, datalong, x, y, z, o, comments) VALUES
	(106681, 6, 571, 902.623169, -4770.512695, 49.574825, 4.825640, 'port to howling fjord'),
	(106682, 6, 571, 3161.010742, 5545.121094, 61.381855, 4.365778, 'port to borean tundra'),
	(106683, 6, 571, 5243.817383, 5755.433105, -53.677101, 4.977101, 'port to sholazar basin'),
	(106684, 6, 571, 8711.413086, -1254.094360, 1002.148132, 3.085897, 'port to storm peaks'),
	(106685, 6, 571, 8148.338867, 1316.298706, 813.930542, 5.721620, 'port to icecrown');
