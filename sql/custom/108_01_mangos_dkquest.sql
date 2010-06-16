# hack for dk quest 12701 (massacre at light's point)
DELETE FROM `event_scripts` WHERE `id` = 190767;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`x`,`y`,`z`,`o`) VALUES (190767,0,6,609,2263.7,-6202.6,13,1.98);
UPDATE `gameobject_template` SET `data2` = 190767 WHERE `entry` = 190767;