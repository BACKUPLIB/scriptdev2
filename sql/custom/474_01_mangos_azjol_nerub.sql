-- instance halls of lightning fixes

-- Mod speed of add in anub'arak fight
UPDATE creature_template SET speed_run=2.5, speed_walk=2.5 WHERE entry=28732;

-- set immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(28684,28921,29120,31561,31610,31611);

-- remote possible reputation bug
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN (31614,31647);
