-- map arathi highlands fixes

-- quest 660 (Hints of a New Plague)
DELETE FROM `script_waypoint` WHERE `entry` = 2713;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('2713', '1', '-1432.34', '-3034.61', '30.48', '0', NULL),
('2713', '2', '-1448.69', '-3034.74', '13.62', '0', NULL),
('2713', '3', '-1532.18', '-3034.17', '12.97', '0', NULL),
('2713', '4', '-1547.65', '-3039.42', '13.02', '0', NULL),
('2713', '5', '-1555.21', '-3030.93', '13.65', '15000', NULL),
('2713', '6', '-1546.83', '-3042.71', '13.25', '0', NULL),
('2713', '7', '-1549.97', '-3046.77', '14.53', '0', NULL),
('2713', '8', '-1596.13', '-3053.85', '13.60', '0', NULL),
('2713', '9', '-1613.99', '-3009.07', '23.16', '0', NULL),
('2713', '10', '-1581.05', '-2982.83', '32.61', '0', NULL),
('2713', '11', '-1528.97', '-2964.61', '31.43', '0', NULL),
('2713', '12', '-1488.97', '-2962.50', '31.33', '0', NULL),
('2713', '13', '-1441.59', '-2972.27', '42.97', '0', NULL),
('2713', '14', '-1415.88', '-3007.95', '35.10', '0', NULL),
('2713', '15', '-1423.51', '-3032.43', '33.43', '10000', 'quest complete');

DELETE FROM `script_texts` WHERE `entry` IN ('-1999935', '-1999936', '-1999937', '-1999938', '-1999939');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1999935', 'Well then, let\'s get this started. The longer we are here, the more damage the undead could be doing back in Hilsbrad.', NULL, NULL, 'Wir sollten uns dort unten etwas umschauen. Begleitet mich dabei und steht mir gegen diese Ungetüme bei.', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'NPC 2713 - say on start'),
('-1999936', 'All right, this is where we really have to be on our paws. Be ready!', NULL, NULL, 'Ich werde mich hier im Haus etwas Umsehen. Gebt acht, ob noch jemand kommt.', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'NPC 2713 - say on WP 5'),
('-1999937', 'Okay, let\'s get out of here quick quick! Try and keep up. I am going to make a break for it.', NULL, NULL, 'Ich habe alles, was ich brauche beisammen. Lasst uns diesem Ort den Rücken kehren.', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'NPC 2713 - say on WP 6'),
('-1999938', 'We made it! Quae, we made it!', NULL, NULL, 'Sprecht nun mit Quae, meiner Begleiterin. Sie wird alles weitere in die Wege leiten.', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'NPC 2713 - say on end WP 14'),
('-1999939', 'Attack me if you will, but you won\'t stop me from getting back to Quae.', NULL, NULL, 'Greif mich an, wenn du willst, aber du wirst mich nicht davon abhalten, wieder zu Quae zurückzukehren.', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'NPC 2713 - say on aggro');
