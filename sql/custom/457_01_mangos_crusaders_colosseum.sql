-- instance crusaders colosseum fixes

-- set snobold vasall selectable
UPDATE `creature_template` SET `unit_flags` = 0 WHERE entry = 34800;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(35119,34928,35451,35490,35517,35518);
