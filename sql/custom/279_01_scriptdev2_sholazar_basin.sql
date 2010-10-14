
-- fix quest 12688
DELETE FROM `script_waypoint` WHERE `entry` = 28787;
INSERT INTO `script_waypoint` (entry, pointid, location_x, location_y, location_z, waittime, point_comment) VALUES
(28787, 1, 5926.399902, 5373.770020, -98.901802, 6.047510, NULL),
(28787, 2, 5928.290039, 5377.782715, -99.031799, 1.500054, NULL),
(28787, 3, 5916.380371, 5383.412109, -106.309975, 2.691506, NULL),
(28787, 4, 5904.631348, 5391.954590, -104.998711, 2.467674, NULL),
(28787, 5, 5902.749512, 5404.356445, -96.881393, 1.427021, NULL),
(28787, 6, 5879.392090, 5393.845215, -92.679749, 3.555451, NULL),
(28787, 7, 5876.169922, 5368.767578, -96.532730, 4.483795, NULL),
(28787, 8, 5864.340332, 5357.849121, -98.547554, 3.882966, NULL),
(28787, 9, 5834.825684, 5327.166504, -99.319473, 3.953652, NULL),
(28787, 10, 5816.554199, 5305.958008, -97.237198, 4.004703, "quest complete");
DELETE FROM `script_texts` WHERE `entry` IN (-1039981,-1039982);
INSERT INTO `script_texts` (`entry`,`content_default`,`type`,`language`,`comment`) VALUES
(-1039981,"Let's get the hell out of here.",0,0,"engineer helice SAY START"),
(-1039982,"We made it! Thank you for getting me out of that hell hole. Tell Hemet to expect me!",0,0,"engineer helice SAY END");

-- fix quest 12544
DELETE FROM `script_texts` WHERE `entry` IN (-1594190,-1594191,-1594192,-1594193,-1594194);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc3`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1594190','Also hat das Orakel beschlossen, Euch zu helfen, Fremder. Nun gut, ich werde mein Wissen mit Euch teilen.','Also hat das Orakel beschlossen, Euch zu helfen, Fremder. Nun gut, ich werde mein Wissen mit Euch teilen.','0','0','0','0','SAY_NOZRONN1'),
('-1594191','Euer Gefährte sucht den Splitterhornpatriarchen Farunn, der sich von seinen Brüdern fernhält.','Euer Gefährte sucht den Splitterhornpatriarchen Farunn, der sich von seinen Brüdern fernhält.','0','0','0','0','SAY_NOZRONN2'),
('-1594192','Farunn durchstreift die Länder nördlich dessen, was Euer Volk die Bittertidenfälle nennt. Ihr werdet ihn allein vorfinden, aber Ihr werdet sehen, dass er keiner Verteidiger bedarf.','Farunn durchstreift die Länder nördlich dessen, was Euer Volk die Bittertidenfälle nennt. Ihr werdet ihn allein vorfinden, aber Ihr werdet sehen, dass er keiner Verteidiger bedarf.','0','0','0','0','SAY_NOZRONN3'),
('-1594193','Kehrt zu Eurem Gefährten zurück. Sagt ihm, dass er losgehen und in Farunn seinen Preis einfordern soll.','Kehrt zu Eurem Gefährten zurück. Sagt ihm, dass er losgehen und in Farunn seinen Preis einfordern soll.','0','0','0','0','SAY_NOZRONN4'),
('-1594194','Sobald er dies getan hat, sagt ihm, dass er dieses Land friedlich verlassen soll. Er gehört hier nicht her.','Sobald er dies getan hat, sagt ihm, dass er dieses Land friedlich verlassen soll. Er gehört hier nicht her.','0','0','0','0','SAY_NOZRONN5');
