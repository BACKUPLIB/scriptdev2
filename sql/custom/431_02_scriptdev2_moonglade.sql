-- map moonglade fixes

-- quest 8447 (Waking Legends)
DELETE FROM `script_waypoint` WHERE `entry` = 11832;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
('11832', '0', '7828.056', '-2247.903', '463.337', '0', NULL), 
('11832', '1', '7825.714', '-2278.487', '459.487', '0', NULL), 
('11832', '2', '7815.497', '-2301.261', '456.320', '0', NULL), 
('11832', '3', '7780.470', '-2323.802', '454.168', '0', NULL), 
('11832', '4', '7754.532', '-2319.568', '454.826', '0', 'Summon Malfurion, do conversation and complete quest'), 
('11832', '5', '7776.210', '-2281.537', '454.971', '0', NULL), 
('11832', '6', '7790.259', '-2259.419', '458.166', '0', NULL), 
('11832', '7', '7792.737', '-2252.336', '458.593', '0', NULL), 
('11832', '8', '7849.307', '-2214.621', '471.377', '0', NULL), 
('11832', '9', '7848.299', '-2216.35', '470.888', '0', NULL);

DELETE FROM `script_texts` WHERE entry BETWEEN -1059999 AND -1059988;
INSERT INTO `script_texts` (`entry`, `content_default`,`comment`) VALUES 
('-1059999', 'Come $N, the lake is right around the bend.', 'keeper remulos SAY_START_REMULOS'), 
('-1059998', 'Stand near me, $N, in case anything should go wrong.', 'keeper remulos SAY_ARRIVE_REMULOS'), 
('-1059997', 'Remulos, old friend. It is good to see you once more. I knew this message would find its way to you - one way or another.', 'malfurion stormrage SAY_CONVERSATION_01'), 
('-1059996', 'It was shrouded in nightmares, Malfurion. What is happening in the Dream? What could cause such atrocities?', 'keeper remulos SAY_CONVERSATION_02'), 
('-1059995', 'I fear for the worst, old friend. Within the Dream we fight a new foe, born of an ancient evil. Ysera''s ancient brood has fallen victim to the old whisperings. It seems as though the Nightmare has broken through the realm and seeks a new host on Azeroth.', 'malfurion stormrage SAY_CONVERSATION_03'), 
('-1059994', 'I sensed as much, Malfurion. Dark days loom ahead.', 'keeper remulos SAY_CONVERSATION_04'), 
('-1059993', 'Aye, Remulos. Prepare the mortal races.', 'malfurion stormrage SAY_CONVERSATION_05'), 
('-1059992', 'You have been gone too long, Malfurion. Peace between the children of Azeroth is tenuous at best. What of my father? Of your brother? Have you any news?', 'keeper remulos SAY_CONVERSATION_06'), 
('-1059991', 'Cenarius fights at my side. Illidan sits upon his throne in the Outland - brooding. I am afraid his loss to Arthas proved to be his breaking point. Madness has embraced him, Remulos. He replays the events in his head a thousand times per day, but in his mind, he is the victor and Arthas is utterly defeated. He is too far gone, old friend. I fear the time may soon come that our bond is tested and it will not be as it was at the Well in Zin-Azshari. ', 'malfurion stormrage SAY_CONVERSATION_07'), 
('-1059990', 'Remulos, I am being drawn back... Tyrande... send her my love... Tell her I am safe. Tell her... Tell her I will return... Farewell...', 'malfurion stormrage SAY_CONVERSATION_08'), 
('-1059989', 'Farewell, old friend... Farewell...', 'keeper remulos SAY_CONVERSATION_09'), 
('-1059988', 'Let us return to the grove, mortal.', 'keeper remulos SAY_RETURN_REMULOS');
