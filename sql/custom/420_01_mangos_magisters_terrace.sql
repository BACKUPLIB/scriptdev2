-- instance magisters terrace fixes

-- update npc 24674 (Phoenix)
UPDATE `creature_template` SET `resistance2`=1000, `mechanic_immune_mask`=619659263 WHERE `entry`=24674;

-- update npc 24708, 25543 (Arcane Sphere)
UPDATE `creature_template` SET `minlevel`=73, `maxlevel`=73, `speed_walk`=0.4, `speed_run`=0.4 WHERE `entry`=24708;
UPDATE `creature_template` SET `minlevel`=73, `maxlevel`=73, `speed_walk`=0.4, `speed_run`=0.4 WHERE `entry`=25543;

-- update npc 25552 (Fel Crystal)
UPDATE `creature_template` SET `ScriptName`='mob_fel_crystal', `unit_flags`=33816578 WHERE `entry`=25552;
UPDATE `creature_template` SET `maxmana`=6740, `minmana`=6740 WHERE `entry` IN (24722, 25552);
