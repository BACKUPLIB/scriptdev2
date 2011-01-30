-- map terokkar forest fixes

-- fix eventAI of npc 22993 (mantis bug 2582)
UPDATE `creature_ai_scripts` SET `action2_type` = 20 WHERE `id` = 2299305;

-- fix NPC 1860 (Isla Starmane) for quests 10051 & 10052
UPDATE `creature_template` SET `ScriptName` = 'npc_isla_starmane' WHERE `entry` = 18760;

# add escort script to NPC skywing for quest 10898
UPDATE `creature_template` SET `ScriptName` = "npc_skywing" WHERE `entry` =22424;
