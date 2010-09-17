UPDATE creature_template SET ScriptName = "npc_goblin_prisoner" WHERE entry = 29466;
UPDATE gameobject_template SET Scriptname = "go_rusty_cage", data3 = 30000 WHERE entry = 191544;

-- Some goblins, who stand in their prison
UPDATE creature SET orientation = 3.8746 WHERE guid = 98286;
UPDATE creature SET orientation = 5.208 WHERE guid = 98303;
