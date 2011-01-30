-- eye of eternity

-- boss malygos
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 28859;

-- change loot position
UPDATE `creature` SET `position_x` = 754.554, `position_z` = 295 WHERE `guid` = 132314;
-- fix loot
UPDATE `creature_template` SET `lootid` = 26097 WHERE `entry` = 193905; -- atm this is the same as hero-loot
