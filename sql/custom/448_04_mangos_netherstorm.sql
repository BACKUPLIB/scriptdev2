-- map netherstorm fixes

-- fix quests
-- quest 10182 (Battle-Mage Dathric) mantis bug 2162
DELETE FROM `event_scripts` WHERE `id` = 12608;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12608,8,19549,1,"");
UPDATE `quest_template` SET `ReqSpellCast2` = 0 WHERE `entry` = 10182;

-- quest 10233 (Torching Sunfury Hold - Flags for dummy target mobs)
UPDATE `creature_template` SET `unit_flags` = 0x00000200, `flags_extra` = 0x08 WHERE `entry` IN (19723, 19724);

-- quest 10305 (Abjurist Belmara)
DELETE FROM `event_scripts` WHERE `id` = 12607;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12607,8,19547,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10305;

-- quest 10306 (Conjurer Luminrath)
DELETE FROM `event_scripts` WHERE `id` = 12609;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12609,8,19548,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10306;

-- quest 10307 (Cohlien Frostweaver)
DELETE FROM `event_scripts` WHERE `id` = 12610;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12610,8,19550,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10307;

-- quest 10427 (Creatures of the Eco-Domes)
UPDATE `creature_template` SET `AIName` ='EventAI' WHERE `entry` IN('20777', '20610');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN('20777', '20610');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2077701', '20777', '8', '0', '100', '1', '35771', '-1', '25000', '30000', '33', '20982', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 10427'),
('2061001', '20610', '8', '0', '100', '1', '35771', '-1', '25000', '30000', '33', '20982', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Credit for Quest 10427');

-- quest 10855 (Fel Reavers, No Thanks)
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `entry` =10855;
