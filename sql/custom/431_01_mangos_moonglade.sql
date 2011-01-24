-- map moonglade fixes

-- fix creatures
-- npc 11832 (Keeper Remulos - set script for quest 8447 Waking Legends)
UPDATE `creature_template` SET `ScriptName` = 'npc_keeper_remulos' WHERE `entry` =11832;

-- fix quest
-- quest 13074 (Hope Within the Emerald Nightmare)
UPDATE `quest_template` SET `SrcSpell` = '57413' WHERE `entry` =13074;
