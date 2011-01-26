-- map terokkar forest fixes

-- fix eventAI of npc 22993 (mantis bug 2582)
UPDATE `creature_ai_scripts` SET `event_type` = 1, `event_param1` = 1000, `event_param2` = 1000, `event_param3` = 0, `event_param4` = 0 WHERE `id` = 2299303;
UPDATE `creature_ai_scripts` SET `event_type` = 1, `event_param1` = 7500, `event_param2` = 7500, `event_param3` = 0, `event_param4` = 0 WHERE `id` = 2299304;
UPDATE `creature_ai_scripts` SET `event_type` = 1, `event_param1` = 12000, `event_param2` = 12000, `event_param3` = 0, `event_param4` = 0 WHERE `id` IN (2299305,2299306);
UPDATE `creature_ai_scripts` SET `action2_type` = 20 WHERE `id` = 2299305;

-- fix NPC 1860 (Isla Starmane) for quests 10051 & 10052
UPDATE `creature_template` SET `ScriptName` = 'npc_isla_starmane' WHERE `entry` = 18760;

# add escort script to NPC skywing for quest 10898
UPDATE `creature_template` SET `ScriptName` = "npc_skywing" WHERE `entry` =22424;
