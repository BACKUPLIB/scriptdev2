-- fixes for ashenvale forest

-- add waypoints and script texts for quest 976
DELETE FROM `script_waypoint` WHERE `entry` = 4484;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('4484', '1', '3196.91', '194.31', '5.47', '0', NULL),
('4484', '2', '3214.98', '184.95', '6.33', '0', NULL),
('4484', '3', '3225.66', '188.49', '6.87', '0', NULL),
('4484', '4', '3233.24', '223.18', '10.05', '0', NULL),
('4484', '5', '3269.69', '224.21', '10.64', '3000', NULL),
('4484', '6', '3306.72', '211.11', '11.56', '0', NULL),
('4484', '7', '3346.48', '216.01', '13.26', '0', NULL),
('4484', '8', '3381.14', '225.85', '10.89', '0', NULL),
('4484', '9', '3423.36', '226.25', '9.35', '0', NULL),
('4484', '10', '3494.44', '211.60', '10.88', '0', NULL),
('4484', '11', '3561.73', '218.45', '5.71', '0', NULL),
('4484', '12', '3642.53', '213.89', '1.61', '3000', NULL),
('4484', '13', '3740.86', '173.90', '6.90', '0', NULL),
('4484', '14', '3837.51', '99.70', '12.33', '0', NULL),
('4484', '15', '3882.11', '53.18', '15.02', '0', NULL),
('4484', '16', '3939.20', '15.20', '16.85', '0', NULL),
('4484', '17', '3984.16', '-2.87', '16.70', '0', NULL),
('4484', '18', '4025.72', '-8.03', '16.64', '0', NULL),
('4484', '19', '4113.58', '24.62', '18.49', '0', NULL),
('4484', '20', '4201.66', '82.94', '32.16', '3000', NULL),
('4484', '21', '4220.21', '96.94', '34.93', '25000', 'quest complete');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1999956 AND -1999947;
INSERT INTO `script_texts` (`entry`, `content_default`,`content_loc3`,`type`, `language`, `emote`, `comment`) VALUES
('-1999947', 'Wohlan Fremder, begleitet mich ein Stück auf meinem Weg nach Auberdine. Etwas Gesellschaft kann sicher nicht schaden.', 'Wohlan Fremder, begleitet mich ein Stück auf meinem Weg nach Auberdine. Etwas Gesellschaft kann sicher nicht schaden.', '0', '0', '0', "Feero - say start"),
('-1999948', 'It looks like we\'re in trouble. Look lively, here they come!','Sieht aus als wären wir in Schwierigkeiten. Schaut, da sind sie bereits!','0', '0', '0', "Feero - say first attack"),
('-1999949', 'Assassins from that cult you found... Let\'s get moving before someone else finds us out here.','Assassinen aus dem Kult den Ihr gefunden habt... Weiter, bevor uns noch jemand hier findet!','0', '0', '0', "Feero - say first attack end"),
('-1999950', 'Hold! I sense an evil presence... Undead!','Moment, Ich spüre eine teuflische Präsenz ... UNTOTE!','0', '0', '0', "Feero - say second attack"),
('-1999951', 'A paladin! Slaying him would please the master. Attack!','Ein Paladin! Es wird dem Meister gefallen wenn wir ihn schlachten. Angriff!','0', '0', '0', "Forsaken Scout - say second attack"),
('-1999952', 'They\'re coming out of the woodwork today. Let\'s keep moving or we may find more things that want me dead.','Sie kommen heute aus dem Gebälk. Los weiter, sonst treffen wir noch mehr Dinge die mich töten wollen.', '0', '0', '0', "Feero - say second attack end"),
('-1999953', 'These three again?','Nicht schon wieder diese drei ...', '0', '0', '0', "Feero - say third attack"),
('-1999954', 'Not quite so sure of yourself without the Purifier, hm?','Fühlst dich wohl nicht wohl ohne den Reiniger, hm?', '0', '0', '0', "Balizar - say third attack"),
('-1999955', 'I\'ll finish you off for good this time!','Diesmal werde ich euch entgültig vernichten!', '0', '0', '0', "Feero - say third attack2"),
('-1999956', 'Well done! I should be fine on my own from here. Remember to talk to Delgren when you return to Maestra\'s Post in Ashenvale.','Gut gemacht! Ich sollte von hier ab gut alleine zurechtkommen. Denkt dran, mit Delgren zu sprechen, wenn ihr zu Maestras Posten zurückkehrt.','0', '0', '0', "Feero - say third attack end");
