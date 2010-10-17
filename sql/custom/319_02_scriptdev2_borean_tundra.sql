-- borean tundra fixes

-- fix quest 11664
DELETE FROM `script_waypoint` WHERE `entry` = 25504;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
('25504', '1', '2883.32', '6735.41', '32.89', '0', NULL),
('25504', '2', '2876.46', '6732.59', '32.86', '0', NULL),
('25504', '3', '2876.73', '6729.31', '32.49', '0', NULL),
('25504', '4', '2873.07', '6725.03', '29.55', '0', NULL),
('25504', '5', '2866.09', '6726.04', '26.73', '0', NULL),
('25504', '6', '2864.12', '6731.34', '23.86', '0', NULL),
('25504', '7', '2868.84', '6736.58', '20.52', '0', NULL),
('25504', '8', '2873.37', '6731.82', '18.50', '0', NULL),
('25504', '9', '2918.60', '6748.23', '13.99', '0', NULL),
('25504', '10', '2931.06', '6752.57', '12.95', '0', NULL),
('25504', '11', '2925.00', '6784.54', '9.65', '0', NULL),
('25504', '12', '2879.22', '6811.86', '4.07', '0', NULL),
('25504', '13', '2829.29', '6799.99', '4.55', '0', NULL),
('25504', '14', '2813.17', '6773.95', '6.28', '0', NULL),
('25504', '15', '2809.57', '6755.63', '7.01', '25000', 'quest complete');
DELETE FROM `script_texts` WHERE `entry` IN (-1999932,-1999933,-1999934);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1999932', 'Ich freue mich euch zu sehen Fremder. Ihr müsst mir helfen, von hier zu entkommen. Alleine schaffe ich das nicht.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-1999933', 'Wir haben es fast geschafft.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-1999934', 'Habt vielen Dank, dass ihr mir bis hier her geholfen habt. Sprecht mit dem Ältesten Muhtoo, damit er euch angemessen entlohnen kann.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL);

-- script text for npc 25201 / quest 11560
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1039999 AND -1039983; -- change this to "AND -1039993" after applying once
INSERT INTO `script_texts` (`entry`,`content_default`,`comment`) VALUES
(-1039999, "Eww.. $r!", "tadpole SAY_RACE"),
(-1039998, "No go with stranger!", "tadpole SAY_2"),
(-1039997, "Close!", "tadpole SAY_3"),
(-1039996, "Me go home?", "tadpole SAY_4"),
(-1039995, "Play!", "tadpole SAY_5"),
(-1039994, "Alurglgl!", "tadpole SAY_6"),
(-1039993, "da-da?", "tadpole SAY_7");

-- fix quest 11673 (mantis bug #0003113)
DELETE FROM `script_waypoint` WHERE `entry` =25589;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('25589', '1', '4477.85', '5370.52', '-14.88', '0', NULL),
('25589', '2', '4488.51', '5388.26', '-15.26', '0', NULL),
('25589', '3', '4469.62', '5421.90', '-15.74', '0', NULL),
('25589', '4', '4431.22', '5437.05', '-15.24', '0', NULL),
('25589', '5', '4400.60', '5421.76', '-14.32', '0', NULL),
('25589', '6', '4386.71', '5384.00', '-3.90', '0', NULL),
('25589', '7', '4406.25', '5337.60', '6.68', '0', NULL),
('25589', '8', '4443.88', '5336.77', '14.06', '0', NULL),
('25589', '9', '4480.47', '5363.64', '19.50', '0', NULL),
('25589', '10', '4483.98', '5410.55', '28.69', '0', NULL),
('25589', '11', '4461.75', '5429.60', '34.28', '0', NULL),
('25589', '12', '4411.48', '5436.50', '40.36', '0', NULL),
('25589', '13', '4362.50', '5468.33', '48.61', '25000', 'quest complete');
DELETE FROM `script_texts` WHERE `entry` IN ('-1029999', '-1029998', '-1029997');
-- texts not blizzlike!
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc3`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1029999', 'Right then, no time to waste. Lets get outa here!', 'Ihr müsst mir helfen, Fremder. Die bei der Landebahn haben mich wohl vergessen, nachdem ich in Gefangenschaft geriet. Zusammen werden wir es aber hier hinaus schaffen.', '0', '0', '0', '0', NULL),
('-1029998', 'Wenn wir hier lebend rauskommen, werde ich denen mal die Meinung sagen!', 'Wenn wir hier lebend rauskommen, werde ich denen mal die Meinung sagen!', '0', '0', '0', '0', NULL),
('-1029997', 'Vielen Dank für eure Hilfe. Geht zu Kurbelzisch und sagt ihm er soll euch belohnen.', 'Vielen Dank für eure Hilfe. Geht zu Kurbelzisch und sagt ihm er soll euch belohnen.', '0', '0', '0', '0', NULL);
