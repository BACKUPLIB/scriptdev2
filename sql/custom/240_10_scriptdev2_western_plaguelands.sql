-- fixes for western plaguelands

-- waypoints and script text for NPC 12738 for quest 9446
DELETE FROM `script_waypoint` WHERE `entry` = 17238;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('17238', '1', '950.18', '-1428.22', '64.27', '0', NULL),
('17238', '2', '970.17', '-1454.24', '63.43', '0', NULL),
('17238', '3', '1022.25', '-1465.45', '62.59', '0', NULL),
('17238', '4', '1035.97', '-1482.94', '64.51', '0', NULL),
('17238', '5', '1039.43', '-1504.19', '65.37', '0', NULL),
('17238', '6', '1035.30', '-1585.24', '61.61', '0', NULL),
('17238', '7', '1037.39', '-1650.96', '60.35', '0', NULL),
('17238', '8', '1053.67', '-1695.22', '60.52', '0', NULL),
('17238', '9', '1082.71', '-1726.51', '60.90', '0', NULL),
('17238', '10', '1112.67', '-1746.86', '60.78', '0', NULL),
('17238', '11', '1156.47', '-1762.04', '60.60', '0', NULL),
('17238', '12', '1150.77', '-1772.72', '60.76', '0', NULL),
('17238', '13', '1082.89', '-1802.75', '63.96', '0', NULL),
('17238', '14', '1034.98', '-1805.39', '75.79', '0', NULL),
('17238', '15', '993.59', '-1819.12', '80.49', '5000', "quest complete"),
('17238', '16', '976.99', '-1823.56', '80,86', '60000',NULL);
-- add german text as default because we do not have original text
DELETE FROM `script_texts` WHERE `entry` IN (-1999957,-1999958,-1999959);
INSERT INTO `script_texts` (`entry`, `content_default`,`content_loc3`,`type`, `language`, `emote`, `comment`) VALUES
('-1999957', 'Lasst uns gehen Fremder. Seit langem warte ich nun auf den Tag, an dem ich einmal zum Denkmal des ehrwürdigen Uther gehen kann. Wir sollten und jedoch vorsehen, ob der Kreaturen die hier lauern.', 'Lasst uns gehen Fremder. Seit langem warte ich nun auf den Tag, an dem ich einmal zum Denkmal des ehrwürdigen Uther gehen kann. Wir sollten und jedoch vorsehen, ob der Kreaturen die hier lauern.', '0', '0', '0', "Truuen - say start"),
('-1999958', 'Habt vielen Dank, dass ihr mir bis hier her geholfen habt. Geht zurück zum Lager und sprecht mit Hohepriesterin MacDonnell, sie wird euch für eure Dienste entlohnen.', 'Habt vielen Dank, dass ihr mir bis hier her geholfen habt. Geht zurück zum Lager und sprecht mit Hohepriesterin MacDonnell, sie wird euch für eure Dienste entlohnen.', '0', '0', '0', "Truuen - say complete"),
('-1999959', 'Thank you for coming here in remembrance of me. Your efforts in recovering that symbol, while unnecessary, are certainly touching to an old man\'s heart. Please, rise my friend. Keep the Blessing as a symbol of the strength of the Light and how heroes long gone might once again rise in each of us to inspire.', 'Ich danke euch, dass ihr in Erinnerung an mich hierher kamt. Eure bemühungen das Symbol zu erlangen waren unnötig, aber haben trotzdem das Herz eines alten Mannes berührt. Bitte erhebt Euch, mein Freund. Behaltet den Segen als Symbol der Stärke des Lichts und der lange vergangenen Helden, die wieder in uns erwachen können.', '0', '0', '0', "Uthers Ghost - say complete");
