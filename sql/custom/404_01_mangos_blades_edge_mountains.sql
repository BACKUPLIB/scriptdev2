-- blade's edge mountains

-- Mantis ID 0002838
-- HP angepasst
UPDATE `creature_template` SET `minhealth` = '5400', `maxhealth` = '5400' WHERE `entry` = 21383;
UPDATE `creature` SET `curhealth` = 5400 WHERE `id` = 21383;

-- fix quest 10506
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` =20058;
DELETE FROM `creature_ai_scripts` WHERE `id` =2005801;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES
('2005801', '20058', '8', '1', '36310', '-1', '33', '21176', '6', 'Quest Credit for Quest 10506');

-- fix quest 10488
UPDATE `quest_template` SET `ReqSpellCast1` = '0' WHERE `entry` =10488;
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` =20748;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 20748;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `comment`) VALUES
(2074801, 20748, 1, 0, 100, 0, 60000, 600000, 120000, 600000, 4, 1018, 0, 0, 5, 393, 0, 0, 'Thunderlord Dire Wolf - Howl and Emote OOC'),
(2074802, 20748, 9, 0, 100, 1, 0, 5, 45000, 45000, 11, 5781, 1, 0, 0, 0, 0, 0, 'Thunderlord Dire Wolf - Cast Threatening Growl');
DELETE FROM `event_scripts` WHERE `id` = 13489 AND `command` = 8 AND `datalong` = 21142;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES
('13489', '0', '8', '21142', 'Quest 10488 - Credit 21142');
