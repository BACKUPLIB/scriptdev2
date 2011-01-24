-- map arathi highlands fixes

-- fix creatures
-- update npc 2713 (Kinelory - Script for Quest 660)
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_kinelory' WHERE `entry` =2713;

-- update creature 2733 (Apothecary Jorell say on aggro)
UPDATE `creature_ai_texts` SET `content_default` = 'You will never stop the Forsaken. The Dark Lady shall make you suffer.',
`content_loc3` = 'Ihr werdet die Verlassenen niemals aufhalten. Die dunkle Fürstin wird Euch leiden lassen.' WHERE `entry` = -469;
UPDATE `creature_ai_texts` SET `content_default` = 'You have my word that I shall find a use for your body after I\'ve killed you.',
 `content_loc3` = 'Ihr habt mein Wort darauf, dass ich für Euren Körper eine Verwendung finden werde, nachdem ich Euch getötet habe.' WHERE `entry` = -470;
 