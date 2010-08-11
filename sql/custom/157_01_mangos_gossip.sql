/*  Keine Ahnung ob das so stimmt. Normalerweise haben Trainer alle die menu_id 0. Dann wird das automatisch ausgesucht.
    Eventuell haben die extra 'ne andere genommen, damit die nicht resetten können sollen etc. (ich wieß nicht wie's auf blizz ist).
 */
DELETE FROM `gossip_menu_option` WHERE (`menu_id` BETWEEN 4469 AND 4471) AND (`id` = 14 OR `id` = 16);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
('4471','14','0','I wish to unlearn my talents.','16','16','0','0','0','0','0',NULL,'0','0','0','0','0','0','0','0','0'),
('4471','16','0','Informationen zur dualen Talentspezialisierung.','1','32','5623','0','0','0','0',NULL,'17','63645','1','0','0','0','0','0','0'),
('4470','14','0','I wish to unlearn my talents.','16','16','0','0','0','0','0',NULL,'0','0','0','0','0','0','0','0','0'),
('4470','16','0','Informationen zur dualen Talentspezialisierung.','1','32','5623','0','0','0','0',NULL,'17','63645','1','0','0','0','0','0','0'),
('4469','14','0','I wish to unlearn my talents.','16','16','0','0','0','0','0',NULL,'0','0','0','0','0','0','0','0','0'),
('4469','16','0','Informationen zur dualen Talentspezialisierung.','1','32','5623','0','0','0','0',NULL,'17','63645','1','0','0','0','0','0','0');
