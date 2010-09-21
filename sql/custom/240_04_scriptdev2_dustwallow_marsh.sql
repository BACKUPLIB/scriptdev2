-- duswallow marsh fixes

-- add waypoints and script text for quest 1270 & 1222
DELETE FROM `script_waypoint` WHERE `entry` = 4880;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('4880', '1', '-2656.41', '-3439.89', '34.62', '0', NULL),
('4880', '2', '-2676.03', '-3423.83', '33.99', '5000', NULL),
('4880', '3', '-2692.67', '-3442.20', '34.01', '0', NULL),
('4880', '4', '-2712.30', '-3413.72', '35.15', '5000', NULL),
('4880', '5', '-2743.21', '-3429.77', '33.47', '5000', NULL),
('4880', '6', '-2768.19', '-3471.90', '31.82', '5000', NULL),
('4880', '7', '-2766.19', '-3458.36', '30.94', '0', NULL),
('4880', '8', '-2838.06', '-3436.97', '33.86', '0', NULL),
('4880', '9', '-2876.54', '-3480.02', '34.34', '0', NULL),
('4880', '10', '-2880.49', '-3517.35', '34.47', '0', NULL),
('4880', '11', '-2888.34', '-3531.42', '34.30', '25000', 'quest complete');
-- add german text as default content because we do not have original text
DELETE FROM `script_texts` WHERE `entry` IN (-1999942,-1999943,-1999944,-1999945,-1999946);
INSERT INTO `script_texts` (`entry`, `content_default`,`content_loc3`,`type`,`language`,`emote`,`comment`) VALUES
('-1999942','Ihr müsst mir bei meiner Aufgabe helfen, Fremder. Begleitet und beschützt mich, während ich nach diesen verfluchten Kräutern suche.','Ihr müsst mir bei meiner Aufgabe helfen, Fremder. Begleitet und beschützt mich, während ich nach diesen verfluchten Kräutern suche.','0', '0', '0', "stinky ignatz - say start"),
('-1999943','%s wühlt in der Erde herum und scheint tatsächlich etwas gefunden zu haben.','%s wühlt in der Erde herum und scheint tatsächlich etwas gefunden zu haben.','2', '0', '0', "stinky ignatz 2"),
('-1999944','Ich denke, ich habe genügend Sumpfbohnenblätter beisammen. Wir sollten uns von hier verziehen.','Ich denke, ich habe genügend Sumpfbohnenblätter beisammen. Wir sollten uns von hier verziehen.','0', '0', '0', "stinky ignatz 2"),
('-1999945','Kehrt nun zurück zu Morgan Stern und übergebt ihm diese Blätter. Ich werde ab jetzt wieder alleine klarkommen.','Kehrt nun zurück zu Morgan Stern und übergebt ihm diese Blätter. Ich werde ab jetzt wieder alleine klarkommen.','0', '0', '0', "stinky ignatz - complete alliance"),
('-1999946','Kehrt nun zurück zu Mebok Mizzyrix und übergebt ihm diese Blätter. Ich werde ab jetzt wieder alleine klarkommen.','Kehrt nun zurück zu Mebok Mizzyrix und übergebt ihm diese Blätter. Ich werde ab jetzt wieder alleine klarkommen.','0', '0', '0', "stinky ignatz - complete horde");
