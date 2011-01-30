-- instance halls of stone fixes

UPDATE `creature_template` SET `ScriptName` = 'mob_tribuna_controller' WHERE `entry` =28234;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(27975,27977,27978,31381,31384,31386);
