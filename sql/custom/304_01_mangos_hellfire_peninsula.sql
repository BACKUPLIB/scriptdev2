-- fixes for hellfire peninsula

-- fix npc 16852
UPDATE creature SET DeathState = 1 WHERE id = 16852;

-- fix mantis bug 2570
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 11515;
