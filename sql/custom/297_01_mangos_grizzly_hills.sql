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
