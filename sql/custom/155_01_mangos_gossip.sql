-- not perfect script but should do

-- gossip for npc 25059 / quests 11532,11533,11542,11543
-- creature_template update for npc 25059
UPDATE `creature_template` SET `gossip_menu_id` = 20005 WHERE `entry` = 25059;
-- add gossip menu, gossip_menu_option and gossip_scripts
DELETE FROM `gossip_menu` WHERE `entry` = 20005;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (20005,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 20005;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_script_id`,`cond_1`,`cond_1_val_1`,`cond_1_val_2`,`cond_2`,`cond_2_val_1`,`cond_2_val_2`) VALUES 
(20005,0,0,"Speaking of action, I've been ordered to undertake an air strike.",1,1,200050,9,11532,0,0,0,0),
(20005,1,0,"Speaking of action, I've been ordered to undertake an air strike.",1,1,200050,9,11533,0,0,0,0),
(20005,2,0,"I need to intercept the Dawnblade reinforcements.",1,1,200051,9,11542,0,0,0,0),
(20005,3,0,"I need to intercept the Dawnblade reinforcements.",1,1,200051,9,11543,0,0,0,0);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 20005;
INSERT INTO `locales_gossip_menu_option` (`menu_id`,`id`,`option_text_loc3`) VALUES 
(20005,0,"Ich habe den Befehl erhalten, einen Luftangriff zu starten"),
(20005,1,"Ich habe den Befehl erhalten, einen Luftangriff zu starten"),
(20005,2,"Ich muss die die Verstärkungen der Dämmerklinge abfangen."),
(20005,3,"Ich muss die die Verstärkungen der Dämmerklinge abfangen.");
DELETE FROM `gossip_scripts` WHERE `id` IN (200050,200051);
INSERT INTO `gossip_scripts` (`id`,`command`,`datalong`,`datalong2`) VALUES 
(200050,15,45071,0),
(200051,15,45113,0);

-- gossip for NPC 25236 / quests 11542, 11543
-- creature_template update for npc 25236
UPDATE `creature_template` SET `gossip_menu_id` = 20006 WHERE `entry` = 25236;
-- add gossip menu, gossip_menu_option and gossip_scripts
DELETE FROM `gossip_menu` WHERE `entry` = 20006;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (20006,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 20006;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_script_id`,`cond_1`,`cond_1_val_1`,`cond_1_val_2`,`cond_2`,`cond_2_val_1`,`cond_2_val_2`) VALUES 
(20006,0,0,"<Ride the dragonhawk to Sun's Reach>",1,1,200060,9,11542,0,0,0,0),
(20006,1,0,"<Ride the dragonhawk to Sun's Reach>",1,1,200060,9,11543,0,0,0,0);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 20005;
INSERT INTO `locales_gossip_menu_option` (`menu_id`,`id`,`option_text_loc3`) VALUES 
(20006,0,"<Fliege auf dem Drachenfalken zurück zum  Hafen der Sonnenweiten>"),
(20006,1,"<Fliege auf dem Drachenfalken zurück zum  Hafen der Sonnenweiten>");
DELETE FROM `gossip_scripts` WHERE `id` = 200060;
INSERT INTO `gossip_scripts` (`id`,`command`,`datalong`,`datalong2`) VALUES (200060,15,45353,0);