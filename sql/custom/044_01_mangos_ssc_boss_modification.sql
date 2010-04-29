UPDATE creature_template SET maxhealth=5944300, minhealth=5944300 WHERE entry=21212; -- Vashj
UPDATE creature_template SET maxhealth=4892300, minhealth=4892300 WHERE entry=21216; -- Hydross
UPDATE creature_template SET maxhealth=4322330, minhealth=4322330 WHERE entry=21217; -- Grauen
UPDATE creature_template SET maxhealth=6324499, minhealth=6324499 WHERE entry=21213; -- Morogrim
UPDATE creature_template SET maxhealth=2345390, minhealth=2345390 WHERE entry=21214; -- Karathrass
UPDATE creature_template SET maxhealth=1236849, minhealth=1236849 WHERE entry=21966; -- Karathrass - Add
UPDATE creature_template SET maxhealth=1236849, minhealth=1236849 WHERE entry=21965; -- Karathrass - Add
UPDATE creature_template SET maxhealth=1236849, minhealth=1236849 WHERE entry=21964; -- Karathrass - Add
UPDATE creature_template SET maxhealth=5129930, minhealth=5129930 WHERE entry=21215; -- Leotheras
UPDATE creature_template SET maxhealth=10329, minhealth=10329 WHERE entry=21958; -- Elemental
UPDATE creature_template SET maxhealth=234130, minhealth=234130, dmg_multiplier=12 WHERE entry=22055; -- Vashj - Add
UPDATE creature_template SET maxhealth=214130, minhealth=214130, dmg_multiplier=12 WHERE entry=22056; -- Vashj - Add

UPDATE creature SET curhealth=5944300 WHERE id=21212; -- Vashj
UPDATE creature SET curhealth=4892300 WHERE id=21216; -- Hydross
UPDATE creature SET curhealth=4322330 WHERE id=21217; -- Grauen
UPDATE creature SET curhealth=6324499 WHERE id=21213; -- Morogrim
UPDATE creature SET curhealth=2345390 WHERE id=21214; -- Karathrass
UPDATE creature SET curhealth=1236849 WHERE id=21966; -- Karathrass - Add
UPDATE creature SET curhealth=1236849 WHERE id=21965; -- Karathrass - Add
UPDATE creature SET curhealth=1236849 WHERE id=21964; -- Karathrass - Add
UPDATE creature SET curhealth=5129930 WHERE id=21215; -- Leotheras
UPDATE creature SET curhealth=10329 WHERE id=21958; -- Elemental
UPDATE creature SET curhealth=234130 WHERE id=22055; -- Vashj - Add
UPDATE creature SET curhealth=214130 WHERE id=22056; -- Vashj - Add

UPDATE creature_template SET dmg_multiplier=47 WHERE entry IN (21212, 21216, 21217, 21213, 21214, 21215);
UPDATE creature_template SET dmg_multiplier=1.5 WHERE entry IN  (21966, 21965, 21964);
