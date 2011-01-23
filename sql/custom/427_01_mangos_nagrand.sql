-- map nagrand fixes

--fix npc 19055 (Windroc Matriarch - remove unitflag 320)
UPDATE creature_template SET unit_flags=0 WHERE entry=19055;

-- fix npc 18209 (Kurenai Captive)
UPDATE `creature_template` SET `ScriptName` = 'npc_Kurenai_Captive' WHERE `entry` =18209;
