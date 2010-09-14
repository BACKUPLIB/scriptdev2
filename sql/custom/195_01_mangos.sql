-- Mantis ID 0002838
-- HP angepasst
UPDATE `creature_template` SET `minhealth` = '5400', `maxhealth` = '5400' WHERE `entry` = 21383;
UPDATE `creature` SET `curhealth` = 5400 WHERE `id` = 21383;

