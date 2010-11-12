-- grizzly hills fixes
-- add npc 26633 (Ursoc)
DELETE FROM `creature` WHERE id = 26633;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist,curhealth, curmana, DeathState, MovementType) VALUES 
(230026, 26633, 571, 1, 1, 4922.347646, -3843.324951, 338.575836, 2.873092, 1000, 5, 212.700, 0, 0, 0);

-- fix quest 12231 / 12247 (TODO: some of the script seems to be already done (menu_id 65535)
UPDATE `creature_template` SET `gossip_menu_id` = '20020' WHERE `entry` = 27275;
UPDATE `creature_template` SET `gossip_menu_id` = '20010' WHERE `entry` = 27274;
DELETE FROM `gossip_menu` WHERE `entry` IN ('20010','20011','20012','20020','20021') OR `text_id` IN ('12793','12794','12796','12797','12798');
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES 
('20010', '12793'),
('20011', '12794'),
('20012', '12796'),
('20020', '12797'),
('20021', '12798');
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (20010,20011,20012,20020,20021);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_script_id`,`cond_1`,`cond_1_val_1`,`cond_1_val_2`) VALUES
('20010', '0', '0', 'You are free to go Orsonn, but first tell me whats wrong with the furbolg.', '1', '1', '20011', '0', '9', '12231',  '0'),
('20010', '1', '0', 'You are free to go Orsonn, but first tell me whats wrong with the furbolg.', '1', '1', '20011', '0', '9', '12247',  '0'),
('20011', '2', '0', 'What happened then?', '1', '1', '20012', '0', '0', '0', '0'),
('20012', '3', '0', 'Thank you, Son of Ursoc. I will see what can be done.', '1', '1', '20012', '122311', '9', '12231', '0'),
('20012', '4', '0', 'Thank you, Son of Ursoc. I will see what can be done.', '1', '1', '20012', '122471', '9', '12247', '0'),
('20020', '0', '0', 'Who was this stranger?', '1', '1', '20021', '0', '9', '12231',  '0'),
('20020', '1', '0', 'Who was this stranger?', '1', '1', '20021', '0', '9', '12247',  '0'),
('20021', '2', '0', 'Thank you, Kodian. I will do what I can.', '1', '1', '20021', '122312',  '9', '12231',  '0'),
('20021', '3', '0', 'Thank you, Kodian. I will do what I can.', '1', '1', '20021', '122472',  '9', '12247',  '0');
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` IN (20010,20011,20012,20020,20021);
INSERT INTO `locales_gossip_menu_option` (`menu_id`,`id`,`option_text_loc3`) VALUES 
('20010', '0', 'Sie sind frei zu gehen Orsonn, aber zuerst sagen Sie mir, was ist mit den Furbolgs passiert ist.'),
('20010', '1', 'Sie sind frei zu gehen Orsonn, aber zuerst sagen Sie mir, was ist mit den Furbolgs passiert ist.'),
('20011', '2', 'Was passierte dann?'),
('20012', '3', 'Vielen Dank, Sohn von Ursoc. Ich werde sehen, was getan werden kann.'),
('20012', '4', 'Vielen Dank, Sohn von Ursoc. Ich werde sehen, was getan werden kann.'),
('20020', '0', 'Wer war dieser Fremde?'),
('20020', '1', 'Wer war dieser Fremde?'),
('20021', '2', 'Vielen Dank, Kodian. Ich werde tun was ich kann.'),
('20021', '3', 'Vielen Dank, Kodian. Ich werde tun was ich kann.');
DELETE FROM `gossip_scripts` WHERE `id` IN (122311, 122312, 122471, 122472);
INSERT INTO `gossip_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`)  VALUES 
('122311', '0', '8', '27322', '0', 'Quest 12231 Orsonn Credit'),
('122312', '0', '8', '27321', '0', 'Quest 12231 Kodian Credit'),
('122471', '0', '8', '27322', '0', 'Quest 12231 Orsonn Credit'),
('122472', '0', '8', '27321', '0', 'Quest 12231 Kodian Credit');

-- fix quest 12227
DELETE FROM `spell_scripts` WHERE `id` = 48340;
INSERT INTO `spell_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES
('48340', '2', '15', '48330', '1', 'Quest 12227 - cast spell to add quest item'); 

-- despawn some NPCs
UPDATE `creature` SET `spawnMask` = 0 WHERE guid IN (114879,114891,114892,114893,114894,114897,114898,114899,114902,114912,114913,114914,114917,114918,114919,114920,114923,114924,114926,114928,114929,114930,
114931,116183,116199,116563,116564,116566,116567,116568,116568,116569,116574,116579,116580);

-- fix quests 12203 & 12185
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` =27212;

UPDATE `gameobject_template` SET `data2` = '60046' WHERE `entry` =188596;

DELETE FROM `event_scripts` WHERE `id` =60046;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('60046', '0', '10', '27212', '120000', '0', '0', '0', '0', '0', '0', '0', '3404.324219', '-5394.511230', '270.199677', '1.148978', 'Image of Loken - Spawn'),
('60046', '22', '8', '27212', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Loken Podest - Quest Credit');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` =27212;
INSERT INTO `creature_ai_scripts` 
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
('2721201', '27212', '1', '0', '100', '0', '1000', '1000', '0', '0', '1', '-2000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Image of Loken - Text'),
('2721202', '27212', '1', '0', '100', '0', '6000', '6000', '0', '0', '1', '-2001', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Image of Loken - Text'),
('2721203', '27212', '1', '0', '100', '0', '11000', '11000', '0', '0', '1', '-2002', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Image of Loken - Text'),
('2721204', '27212', '1', '0', '100', '0', '16000', '16000', '0', '0', '1', '-2003', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Image of Loken - Text'),
('2721205', '27212', '1', '0', '100', '0', '21000', '21000', '0', '0', '1', '-2004', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Image of Loken - Text');

DELETE FROM `creature_ai_texts` WHERE `entry` IN('-2000', '-2001', '-2002', '-2003', '-2004');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
('-2000', 'You''re late, overseer.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-2001', 'Destiny will not wait. Your craftsmen must increase their production of the war golems before the stone giant leader and his army reach Ulduar.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-2002', 'Tell your rune-smiths to continue converting what stone giants you can. Those that will not submit must be destroyed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-2003', 'If the stone giants interfere with our work at Ulduar, I will hold you and your thane responsible. Mortal must not be allowed to come to the aid of the giants.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL),
('-2004', 'Return to your duties, overseer. Be certain to impress upon your workers the urgency of their tasks.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL);

