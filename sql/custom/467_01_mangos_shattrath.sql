-- map shattrath fixxes

UPDATE quest_template SET ExclusiveGroup=11362 WHERE entry IN (11384, 11382, 11368, 11378, 11374, 11499, 11370, 11372, 11369, 11388, 11362, 11363, 11375, 11354, 11386, 11373);

-- fix quest 11379
DELETE FROM spell_scripts WHERE id = 43723;
INSERT INTO spell_scripts (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES (43723,0,15,43753,1,"Quest 11379 - create quest item");
