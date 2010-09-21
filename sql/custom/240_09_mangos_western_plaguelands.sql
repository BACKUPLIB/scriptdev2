-- fixes for western plaguelands

-- update NPC 17238 for quest 9446
UPDATE `creature_template` SET `ScriptName` = 'npc_anchorite_truuen' WHERE `entry` =17238;