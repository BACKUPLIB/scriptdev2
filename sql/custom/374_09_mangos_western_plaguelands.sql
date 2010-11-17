-- fixes for western plaguelands

-- update NPC 17238 for quest 9446
UPDATE `creature_template` SET `ScriptName` = 'npc_anchorite_truuen' WHERE `entry` =17238;

-- fix quest 9444
UPDATE `creature_template` SET `AIName` = 'EventAI', `MovementType` = '0' WHERE `entry` =17233;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '17233' WHERE `entry` =9444;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '17233';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('1723301', '17233', '1', '0', '100', '0', '1000', '1000', '0', '0', '1', '-2005', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ghost of Uther - Say text 01'), 
('1723302', '17233', '1', '0', '100', '0', '5000', '5000', '0', '0', '1', '-2006', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ghost of Uther - Say text 02'), 
('1723303', '17233', '1', '0', '100', '0', '10000', '10000', '0', '0', '1', '-2007', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ghost of Uther - Say text 03');

DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-2005','-2006','-2007');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
('-2005', 'Why do you do this? Did I somehow wrong you in life?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'Ghost of Uther text 01'), 
('-2006', 'Ah, I see it now in your mind. This is the work of one of my former students... Mehlar Dawnblade. It is sad to know that his heart has turned so dark.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'Ghost of Uther text 02'), 
('-2007', 'Return to him. Return to Mehlar and tell him that I forgive him and that I understand why he believes what he does.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', 'Ghost of Uther text 03');

DELETE FROM `event_scripts` WHERE `id` = 10561 AND `command` = 8;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('10561', '12', '8', '17233', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
