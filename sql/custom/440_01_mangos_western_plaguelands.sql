-- map western plaquelands fixes

-- update NPC 17238 for quest 9446
UPDATE `creature_template` SET `ScriptName` = 'npc_anchorite_truuen' WHERE `entry` =17238;

-- fix quest 9444
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '17253' WHERE `entry` =9444;
DELETE FROM `item_required_target` WHERE `entry` = 23691;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES 
('23691', '1', '17253');
