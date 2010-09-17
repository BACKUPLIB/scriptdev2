-- fixes for dragonblight

-- fix quest 12173
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 27135;
UPDATE `quest_template` SET `Method` = 2 WHERE `entry` = 12173;