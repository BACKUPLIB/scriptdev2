-- map western plaquelands fixes

-- waypoints and script text for NPC 12738 for quest 9446
DELETE FROM `script_waypoint` WHERE `entry`=17238;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
(17238, 1, 953.061, -1432.52, 63.2255, 0, '0'),
(17238, 2, 969.607, -1438.15, 65.3669, 0, '0'),
(17238, 3, 980.073, -1441.5, 65.3997, 0, '0'),
(17238, 4, 995.001, -1450.47, 61.3227, 0, '0'),
(17238, 5, 1032.7, -1473.49, 63.7699, 0, '0'),
(17238, 6, 1039.69, -1491.42, 65.2801, 0, '0'),
(17238, 7, 1038.8, -1523.32, 64.4661, 0, '0'),
(17238, 8, 1035.43, -1572.97, 61.5412, 0, '0'),
(17238, 9, 1034.45, -1612.83, 61.6186, 0, '0'),
(17238, 10, 1040.12, -1663.41, 60.923, 0, '0'),
(17238, 11, 1059.75, -1703.75, 60.5768, 0, '0'),
(17238, 12, 1091.83, -1735.24, 60.8057, 0, '0'),
(17238, 13, 1131.75, -1755.32, 61.0073, 0, '0'),
(17238, 14, 1159.77, -1762.64, 60.5699, 0, '0'),
(17238, 15, 1153.79, -1772, 60.6475, 0, '0'),
(17238, 16, 1115.4, -1787.21, 61.0759, 0, '0'),
(17238, 17, 1091.88, -1799.06, 61.6055, 0, '0'),
(17238, 18, 1056.22, -1805.65, 71.8112, 0, '0'),
(17238, 19, 1024.03, -1807.93, 77.025, 0, '0'),
(17238, 20, 1012.74, -1811.67, 77.5636, 0, '0'),
(17238, 21, 1006.74, -1813.59, 80.4872, 0, '0'),
(17238, 22, 983.15, -1823.05, 80.4872, 0, '0'),
(17238, 23, 974.954, -1825.33, 81.3482, 5000, '0'),
(17238, 24, 974.954, -1825.33, 81.3482, 5000, '0'),
(17238, 25, 974.954, -1825.33, 81.3482, 5000, '0'),
(17238, 26, 974.954, -1825.33, 81.3482, 5000, '0');

-- add german text as default because we do not have original text
DELETE FROM `script_texts` WHERE `entry` IN (-1999980, -1999981, -1999982, -1999983, -1999984, -1999985, -1999986, -1999987);
INSERT INTO `script_texts` (`entry`, `content_default`,`content_loc3`,`type`, `language`, `emote`, `comment`) VALUES
('-1999980', 'Lasst uns gehen Fremder. Seit langem warte ich nun auf den Tag, an dem ich einmal zum Denkmal des ehrwürdigen Uther gehen kann. Wir sollten und jedoch vorsehen, ob der Kreaturen die hier lauern.', 'Lasst uns gehen Fremder. Seit langem warte ich nun auf den Tag, an dem ich einmal zum Denkmal des ehrwürdigen Uther gehen kann. Wir sollten und jedoch vorsehen, ob der Kreaturen die hier lauern.', '0', '0', '0', "Truuen - say start"),
('-1999981', 'Beware! We are attacked!', 'Vorsicht! Wir werden angegriffen!', '0', '0', '0', "Uthers Ghost - SAY_WP_8"),
('-1999982', 'It must be the purity of the Mark of the Lightbringer that is drawing forth the Scourge to attack us. We must proceed with caution lest we be overwhelmed!', 'Es muss die Reinheit des Mals des Lichtbringers sein, welche die Geißel zwingt uns anzugreifen. Wir müssen vorsichtig vorgehen damit wir nicht überwältigt werden!', '0', '0', '0', "Uthers Ghost - SAY_WP_9"),
('-1999983', 'This land truly needs to be cleansed by the Light! Let us continue on to the tomb. It isn\'t far now...', 'Dieses Land muss wirklich vom Licht gereinigt werden! Lasst uns zum Grab weiter gehen. Es ist nicht mehr weit ...', '0', '0', '0', "Uthers Ghost - SAY_WP_15"),
('-1999984', 'Be welcome, friends!', 'Seid willkommen, Freunde!', '0', '0', '0', "Uthers Ghost - SAY_WP_21"),
('-1999985', 'Thank you for coming here in remembrance of me. Your efforts in recovering that symbol, while unnecessary, are certainly touching to an old man\'s heart. Please, rise my friend. Keep the Blessing as a symbol of the strength of the Light and how heroes long gone might once again rise in each of us to inspire.', 'Ich danke euch, dass ihr in Erinnerung an mich hierher kamt. Eure bemühungen das Symbol zu erlangen waren unnötig, aber haben trotzdem das Herz eines alten Mannes berührt. Bitte erhebt Euch, mein Freund. Behaltet den Segen als Symbol der Stärke des Lichts und der lange vergangenen Helden, die wieder in uns erwachen können.', '0', '0', '0', "Uthers Ghost - SAY_WP_23"),
('-1999986', 'Please, rise my friend. Keep the Blessing as a symbol of the strength of the Light and how heroes long gone might once again rise in each of us to inspire.', 'Bitte erhebt euch mein Freund. Erhalte den Segen als ein Symbol für die Kraft des Lichts und wie längst vergangene Helden sich erneut erheben um uns zu begeistern.', '0', '0', '0', "Uthers Ghost - SAY_WP_24"),
('-1999987', 'Thank you my friend for making this possible. This is a day that I shall never forget! I think I will stay a while. Please return to High Priestess MacDonnell at the camp. I know that she\'ll be keenly interested to know of what has transpired here.', 'Habt vielen Dank, dass ihr mir bis hier her geholfen habt. Geht zurück zum Lager und sprecht mit Hohepriesterin MacDonnell, sie wird euch für eure Dienste entlohnen.', '0', '0', '0', "Truuen - SAY_WP_25");
