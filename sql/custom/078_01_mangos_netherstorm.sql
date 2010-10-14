# fix mantis bug 2162
# fix quest 10182
DELETE FROM `event_scripts` WHERE `id` = 12608;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12608,8,19549,1,"");
UPDATE `quest_template` SET `ReqSpellCast2` = 0 WHERE `entry` = 10182;
# fix quest 10305
DELETE FROM `event_scripts` WHERE `id` = 12607;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12607,8,19547,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10305;
# fix quest 10306
DELETE FROM `event_scripts` WHERE `id` = 12609;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12609,8,19548,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10306;
# fix quest 10307
DELETE FROM `event_scripts` WHERE `id` = 12610;
INSERT INTO `event_scripts` (`id`,`command`,`datalong`,`datalong2`,`comments`) VALUES (12610,8,19550,1,"");
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10307;

-- Flags für dummy target mobs von quest 10233 
UPDATE `creature_template` SET `unit_flags` = 0x00000200, `flags_extra` = 0x08 WHERE `entry` IN (19723, 19724);
