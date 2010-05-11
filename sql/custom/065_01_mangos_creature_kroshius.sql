# fix quest 7603 / npc 14467: Kroshius, koordinaten geupdatet (da wo das GO auch steht) + ein paar flags
UPDATE `creature_template` SET `unit_flags` = '256', `dynamicflags` = '36', `ScriptName` = 'npc_kroshius' WHERE `entry` = 14467;
UPDATE `creature` SET `position_x` = '5800.89', `position_y` = '-985.82', `position_z` = '409.78' WHERE `guid` = 39715;