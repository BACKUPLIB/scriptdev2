-- sholazar basin fixes

-- fix quest 12688
UPDATE `creature_template` SET `ScriptName` = 'npc_engineer_helice' WHERE entry = 28787;