DELETE FROM creature_loot_template WHERE entry=25593 AND item IN (35209, 35213);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
  ('25593', '35209', '0.4', '0', '1', '1', '7', '164', '365'),
  ('25593', '35213', '0.2', '0', '1', '1', '7', '165', '365');