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


