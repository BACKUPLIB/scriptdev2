# fix xp bug of dk quest 12701
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 4298;