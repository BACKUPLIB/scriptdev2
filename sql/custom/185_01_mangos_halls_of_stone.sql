UPDATE `creature_template` SET `ScriptName` = 'boss_krystallus' WHERE `entry` =27977;
UPDATE `creature_template` SET `ScriptName` = 'mob_tribuna_controller' WHERE `entry` =28234;

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `entry` =191293;
UPDATE `gameobject_template` SET `faction` = '0', `flags` = '0'  WHERE `entry` IN (193996,190586);
UPDATE `gameobject` SET `phaseMask` = '65535' WHERE `guid` =37577;
UPDATE `gameobject` SET `phaseMask` = '65535' WHERE `guid` =37583;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(27975,27977,27978,31381,31384,31386);
