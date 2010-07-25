# update naxxramas instance

# remove widows embrace from naxxramas worshipper AI
DELETE FROM `creature_ai_scripts` WHERE `id` = 1650612;

# add boss scripts for boss_grobbulus
UPDATE `creature_template` SET `ScriptName` = "boss_grobbulus" WHERE `entry` = 15931;
UPDATE `creature_template` SET `ScriptName` = "npc_grobbulus_poison_cloud" WHERE `entry` = 16363;
