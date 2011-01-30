-- instance utgarde pinnacle fixxes

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(26668,26687,26693,26861,30774,30788,30807,30810);
