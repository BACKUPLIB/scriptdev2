-- fixes for storm peak

-- fix quest 12843 (they took our men)
UPDATE `gameobject_template` SET `data2` = 191544 WHERE `entry` = 191544;

INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`) VALUES 
(191544,0,8,29466,1);
