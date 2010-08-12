UPDATE creature_template SET ScriptName='mob_colossus_elemental' WHERE entry=29573;
UPDATE creature_template SET ScriptName='', unit_flags=33554434, faction_A=35, faction_H=35 WHERE entry=29830;
DELETE FROM creature WHERE guid IN (127078, 127076, 127079, 127077);
UPDATE creature_template SET unit_flags=0, movementId=0 WHERE entry=29307;