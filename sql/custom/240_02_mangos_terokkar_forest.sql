-- terokkar forest fixes

-- fix NPC 1860 (Isla Starmane) for quests 10051 & 10052
UPDATE `creature_template` SET `ScriptName` = 'npc_isla_starmane' WHERE `entry` = 18760;
