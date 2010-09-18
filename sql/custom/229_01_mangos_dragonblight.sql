-- fixes for dragonblight

-- fix quest 12173
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 27135;
UPDATE `quest_template` SET `Method` = 2 WHERE `entry` = 12173;

-- fix quest 12111
UPDATE `quest_template` SET `ReqItemId1` = 36818, `ReqItemCount1` = 1, ReqSourceId1 = 0, ReqSpellCast1 = 47628, ReqSpellCast2 = 47628, ReqCreatureOrGOId1 = 26615, ReqCreatureOrGOId2 = 26482 WHERE `entry` = 12111;
