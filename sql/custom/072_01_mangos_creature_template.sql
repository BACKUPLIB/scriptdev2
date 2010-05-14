# fix mantis bug 2574
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 21419; 