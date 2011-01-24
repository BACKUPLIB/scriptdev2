-- map ashenvale forest fixes

-- fix creatures
-- NPC 4484 (Feero Ironhand for quest 976)
UPDATE `creature_template` SET `faction_A` = '11', `faction_H` = '11', `ScriptName` = 'npc_feero_ironhand' WHERE `entry` = 4484;
