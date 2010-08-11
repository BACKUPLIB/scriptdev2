-- gossip options (haupmenü + dualspec infomenü)
DELETE FROM `gossip_menu_option` WHERE
`menu_id` = 0 AND `id` = 16 OR `menu_id` = 5623;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(0, 16, 0, 'Informationen zur dualen Talentspezialisierung.', 1, 16, 5623, 0, 0, 0, 0, NULL, 17, 63645, 1, 0, 0, 0, 0, 0, 0),
(5623, 0, 0, 'Duale Talentspezialisierung erwerben', 1, 16, 5624, 0, 19998, 0, 10000000, 'Seid Ihr sicher, dass Ihr eine zweite Talentspezialisierung erwerben möchtet?', 15, 40, 1, 0, 0, 0, 0, 0, 0);

-- gossip menü, dualspec info & gratulationsmenü
DELETE FROM `gossip_menu` WHERE `entry` IN (5623, 5624);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(5623, 9999, 0, 0, 0, 0, 0, 0),
(5624, 9998, 0, 0, 0, 0, 0, 0);

-- gossip text, dualspec info (id's willkürlich gewählt)
DELETE FROM `npc_text` WHERE `ID` IN (9999, 9998);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(9999, 'Die duale Talentspezialisierung ist ab Level 40 verfügbar. Damit seid Ihr jederzeit in der Lage zwischen einer von zwei Talentspezialisierungen zu wählen! Tüdeldüm!', '', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(9998, 'Herzlichen Glückwunsch! Ihr könnt jetzt zwischen zwei Talentspezialisierungen auswählen!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);

-- lern script (id willkürlich gewählt)
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(19998, 0, 15, 63624, 2, 0, 0, 0, 0, 0);
