-- Flags für dummy target mobs von quest 10233 
UPDATE `creature_template` SET `unit_flags` = 0x00000200, `flags_extra` = 0x08 WHERE `entry` IN (19723, 19724);
