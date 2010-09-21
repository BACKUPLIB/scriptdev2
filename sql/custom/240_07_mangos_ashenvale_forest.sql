-- fixes for ashenvale forest

-- update NPC 4484 for quest 976
UPDATE `creature_template` SET `ScriptName` = 'npc_feero_ironhand' WHERE `entry` = 4484;