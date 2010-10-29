-- duswallow marsh fixes

-- update npc 4880 for quest 1270 & 1222
UPDATE `creature_template` SET `ScriptName` = 'npc_stinky_ignatz' WHERE `entry` = 4880;

-- fix quest 11198
DELETE FROM `creature_ai_scripts` WHERE `id` = 2389902;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2389902', '23899', '6', '0', '100', '0', '0', '0', '0', '0', '26', '11198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thetyr - Complete quest on kill');
