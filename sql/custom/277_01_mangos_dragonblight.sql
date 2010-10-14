-- fixes for dragonblight

-- fix quest 12173
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 27135;
UPDATE `quest_template` SET `Method` = 2 WHERE `entry` = 12173;

-- fix quest 12111
UPDATE `quest_template` SET `ReqItemId1` = 36818, `ReqItemCount1` = 1, ReqSourceId1 = 0, ReqSpellCast1 = 47628, ReqSpellCast2 = 47628, ReqCreatureOrGOId1 = 26615, ReqCreatureOrGOId2 = 26482 WHERE `entry` = 12111;

-- add npc 26859
DELETE FROM `creature` WHERE `id` = 26859;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
('900058', '26859', '571', '1', '1', '0', '0', '4341.036133', '978.466064', '91.479370', '5.435826', '120', '5', '0', '1', '0', '0', '0');

-- fix loot of gameobject 192773
-- mantis bug #0003114
DELETE FROM gameobject_loot_template WHERE entry = 192773;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES(192773, 43084, -100, 0, 1, 1, 0, 0, 0); 

-- Make event (kill credit, LOS) repeatable, repeat time of 2s to save cpu load
UPDATE creature_ai_scripts SET event_flags = 1, event_param3 = 2, event_param4 = 2  WHERE id = 2785301;
