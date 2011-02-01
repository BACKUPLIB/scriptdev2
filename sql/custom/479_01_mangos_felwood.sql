-- map felwood fixes

-- fix quest 7603 / npc 14467 (Kroshius)
UPDATE `creature_template` SET `unit_flags` = '256', `dynamicflags` = '36' WHERE `entry` = 14467;
UPDATE `creature` SET `position_x` = '5800.89', `position_y` = '-985.82', `position_z` = '409.78' WHERE `guid` = 39715;
UPDATE `gameobject` SET `position_x` = '5800.890', `position_y` = '-985.820', `position_z` = '409.779' WHERE `guid` =99894;
