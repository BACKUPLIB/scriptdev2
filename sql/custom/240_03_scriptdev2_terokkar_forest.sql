-- terokkar forest fixes

-- add waypoints and script text for NPC 18760 (Isla Starmane) for quests 10051 & 10052
DELETE FROM `script_waypoint` WHERE `entry` = 18760;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
('18760', '1', '-2287.472900', '3095.203857', '13.826787', '0', NULL),
('18760', '2', '-2311.886719', '3129.350098', '12.144577', '0', NULL),
('18760', '3', '-2349.842041', '3153.418213', '7.341877', '0', NULL),
('18760', '4', '-2371.047363', '3184.919189', '0.961656', '0', NULL),
('18760', '5', '-2372.279053', '3199.797607', '-1.023255', '0', NULL),
('18760', '6', '-2386.342529', '3232.974609', '-1.262486', '0', NULL),
('18760', '7', '-2379.695801', '3254.263428', '-1.253316', '0', NULL),
('18760', '8', '-2348.133789', '3280.836670', '-0.904500', '0', NULL),
('18760', '9', '-2351.991943', '3317.531006', '-1.631526', '0', NULL),
('18760', '10', '-2345.971191', '3369.614014', '-3.451267', '0', NULL),
('18760', '11', '-2317.684082', '3386.684814', '-8.185443', '0', NULL),
('18760', '12', '-2315.380127', '3406.951660', '-11.102516', '0', NULL),
('18760', '13', '-2341.692627', '3433.670898', '-11.345046', '5000', 'quest complete');
-- insert german text as default content because we do not have original text
DELETE FROM `script_texts` WHERE `entry` IN (-1999939,-1999940,-1999941);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc3`, `type`, `language`, `emote`, `comment`) VALUES
('-1999939', 'Ihr müsst mir bei meiner Flucht helfen, Fremder. Begleitet und beschützt mich auf meinem Weg in die Freiheit.','Ihr müsst mir bei meiner Flucht helfen, Fremder. Begleitet und beschützt mich auf meinem Weg in die Freiheit.','0','0','0', "Isla Starmane - Say Start"),
('-1999940', 'Kehrt zurück zu Hauptmann Auric Sonnenjäger und berichtet ihm von den Vorkommnissen hier. Ich werde ab jetzt wieder alleine klarkommen.','Kehrt zurück zu Hauptmann Auric Sonnenjäger und berichtet ihm von den Vorkommnissen hier. Ich werde ab jetzt wieder alleine klarkommen.','0','0','0', "Isla Starmane - Say End Alliance"),
('-1999941', 'Kehrt zurück zu Beraterin Faila und berichtet ihr von den Vorkommnissen hier. Ich werde ab jetzt wieder alleine klarkommen.','Kehrt zurück zu Beraterin Faila und berichtet ihr von den Vorkommnissen hier. Ich werde ab jetzt wieder alleine klarkommen.','0','0','0',"Isla Starmane - Say End Horde"); 
