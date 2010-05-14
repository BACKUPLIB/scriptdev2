#fixes by Carsten
#fix creature 17901
UPDATE `creature` SET `position_x` = -322.21, `position_y` = 5508.77, `position_z` = 23.91, `orientation` = 0.202367 WHERE `id` = 17901;
#fix item 29108: spell 38164 proccs too often -> removed
UPDATE `item_template` SET `spellid_2` = 0, `spelltrigger_2` = 0 WHERE `entry` = 29108;