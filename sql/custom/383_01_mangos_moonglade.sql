-- fixes for moonglade

-- fix quest 13074
UPDATE `quest_template` SET `SrcSpell` = '57413' WHERE `entry` =13074;

-- fix quest 8447
UPDATE `creature_template` SET `ScriptName` = 'npc_keeper_remulos' WHERE `entry` =11832;
