DELETE FROM creature_ai_scripts WHERE creature_id=17818; 
INSERT INTO creature_ai_scripts VALUES 
(1781801, 17818, 11, 0, 100, 2, 0, 0, 0, 0, 11, 31302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Towering Infernal - Cast Inferno Effect on Spawn'), 
(1781802, 17818, 4, 0, 100, 2, 0, 0, 0, 0, 11, 31304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Towering Infernal - Cast Immolation aura on Aggro');

UPDATE `creature_template` SET `npcflag` = npcflag|1 WHERE `entry` = '17948';