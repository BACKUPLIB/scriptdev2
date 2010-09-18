-- howling fjord fixes

-- fix quest 11255
UPDATE `gameobject_template` SET `type` = 1 WHERE `entry` IN (186566,186567);

DELETE FROM `gameobject_scripts` WHERE `id` IN(60407,60414,60426,60432,60438,60452,60459,60471,60485,60511);
INSERT INTO `gameobject_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES 
(60407,0,8,24124,1),
(60414,0,8,24124,1),
(60426,0,8,24124,1),
(60432,0,8,24124,1),
(60438,0,8,24124,1),
(60452,0,8,24124,1),
(60459,0,8,24124,1),
(60471,0,8,24124,1),
(60485,0,8,24124,1),
(60511,0,8,24124,1);

-- fix bug on item for quest 11281
UPDATE `item_template` SET `spellcharges_1` = 1 WHERE entry = 33450;
UPDATE `quest_template` SET `ReqItemId1` = 33450, `ReqItemCount1` = 1, ReqSourceId1 = 0 WHERE `entry` = 11281;

-- fix quest 11227
DELETE FROM `spell_script_target` WHERE `entry` = 42788;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES (42788,1,23943);
