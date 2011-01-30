-- instance halls of reflection fixxes

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(38112,38113,38599,38603);
