-- map hellfire peninsula fixes

-- fix npc 16852
	UPDATE `creature_template` SET `dynamicflags` = `dynamicflags` | 32, `type_flags` = `type_flags` | 1024 WHERE entry = 16852;

-- fix mantis bug 2570
	UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 11515;

-- fix quest 10909
	UPDATE `gameobject_template` SET flags = 5 WHERE `entry` = 185298;
	UPDATE `creature_template` SET `ScriptName` = "npc_anchronite_relic_bunny" WHERE `entry` = 22444;

-- fix quest 9545
	UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `entry` = 9545;
