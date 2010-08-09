-- gossip for npc 25059 / quests 11532,11533,11542,11543
-- creature_template update for npc 25059
UPDATE `creature_template` SET `gossip_menu_id` = 9062 WHERE `entry` = 25059;
-- add gossip menu, gossip_menu_option and gossip_scripts
INSERT IGNORE INTO gossip_menu (entry, text_id) VALUES (9062, 12252);
INSERT IGNORE INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES 
(9062, 0, 0, 'Speaking of action, I\'ve been ordered to undertake an air strike.', 1, 1, 0, 0, 906201, 0, 0, '', 9, 11532, 0, 19, 11533, 0, 0, 0, 0),
(9062, 1, 0, 'Speaking of action, I\'ve been ordered to undertake an air strike.', 1, 1, 0, 0, 906201, 0, 0, '', 9, 11533, 0, 19, 11532, 0, 0, 0, 0),
(9062, 2, 0, 'Speaking of action, I\'ve been ordered to undertake an air strike.', 1, 1, 0, 0, 906201, 0, 0, '', 9, 11532, 0, 9, 11533, 0, 0, 0, 0);
INSERT IGNORE INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES 
(9062, 3, 0, 'I need to intercept the Dawnblade reinforcements.', 1, 1, 0, 0, 906202, 0, 0, '', 9, 11542, 0, 19, 11543, 0, 0, 0, 0),
(9062, 4, 0, 'I need to intercept the Dawnblade reinforcements.', 1, 1, 0, 0, 906202, 0, 0, '', 9, 11543, 0, 19, 11542, 0, 0, 0, 0),
(9062, 5, 0, 'I need to intercept the Dawnblade reinforcements.', 1, 1, 0, 0, 906202, 0, 0, '', 9, 11542, 0, 9, 11542, 0, 0, 0, 0);
INSERT IGNORE INTO `locales_gossip_menu_option` (`menu_id`,`id`,`option_text_loc3`) VALUES 
(9062,0,"Ich habe den Befehl erhalten, einen Luftangriff zu starten"),
(9062,1,"Ich habe den Befehl erhalten, einen Luftangriff zu starten"),
(9062,2,"Ich habe den Befehl erhalten, einen Luftangriff zu starten"),
(9062,3,"Ich muss die die Verstärkungen der Dämmerklinge abfangen."),
(9062,4,"Ich muss die die Verstärkungen der Dämmerklinge abfangen."),
(9062,5,"Ich muss die die Verstärkungen der Dämmerklinge abfangen.");
INSERT IGNORE INTO `gossip_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`datalong3`,`datalong4`,`data_flags`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(906201,0,15,45071,0,0,0,0,0,0,0,0,0),
(906202,0,15,45113,0,0,0,0,0,0,0,0,0);

-- gossip for NPC 25236 / quests 11542, 11543
-- creature_template update for npc 25236
UPDATE `creature_template` SET `gossip_menu_id` = 9143 WHERE `entry` = 25236;
-- add gossip menu, gossip_menu_option and gossip_scripts
INSERT IGNORE INTO gossip_menu (entry, text_id) VALUES (9143, 12371);
INSERT IGNORE INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES 
(9143, 0, 0, '<Ride the dragonhawk to Sun\'s Reach.>', 1, 1, 0, 0, 914301, 0, 0, '', 9, 11542, 0, 19, 11543, 0, 0, 0, 0),
(9143, 1, 0, '<Ride the dragonhawk to Sun\'s Reach.>', 1, 1, 0, 0, 914301, 0, 0, '', 9, 11543, 0, 19, 11542, 0, 0, 0, 0),
(9143, 2, 0, '<Ride the dragonhawk to Sun\'s Reach.>', 1, 1, 0, 0, 914301, 0, 0, '', 9, 11542, 0, 9, 11543, 0, 0, 0, 0);
INSERT IGNORE INTO `locales_gossip_menu_option` (`menu_id`,`id`,`option_text_loc3`) VALUES 
(9143,0,"<Fliege auf dem Drachenfalken zurück zum  Hafen der Sonnenweiten>"),
(9143,1,"<Fliege auf dem Drachenfalken zurück zum  Hafen der Sonnenweiten>"),
(9143,2,"<Fliege auf dem Drachenfalken zurück zum  Hafen der Sonnenweiten>");
INSERT IGNORE INTO `gossip_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`datalong3`,`datalong4`,`data_flags`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(914301,0,15,445353,0,0,0,0,0,0,0,0,0);