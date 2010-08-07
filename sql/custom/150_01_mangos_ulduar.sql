# instance ulduar (from rsa)

UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;

UPDATE `creature_template` SET `ScriptName`='boss_ignis' WHERE `entry`=33118;

UPDATE `creature_template` SET `ScriptName`='boss_xt002' WHERE `entry`=33293;

UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan' WHERE `entry`=33113;

UPDATE `creature_template` SET `ScriptName`='boss_auriaya' WHERE `entry`=33515;

UPDATE `creature_template` SET `ScriptName`='boss_kologarn' WHERE `entry`=32930;

UPDATE `creature_template` SET `ScriptName`='boss_kologarn_left_arm' WHERE `entry`=32933;

UPDATE `creature_template` SET `ScriptName`='boss_kologarn_right_arm' WHERE `entry`=32934;

UPDATE `creature_template` SET `ScriptName`='boss_steelbreaker' WHERE `entry`=32867;

UPDATE `creature_template` SET `ScriptName`='boss_molgeim' WHERE `entry`=32927;

UPDATE `creature_template` SET `ScriptName`='boss_brundir' WHERE `entry`=32857;

UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE `entry`=32865;

UPDATE `creature_template` SET `ScriptName`='boss_hodir' WHERE `entry`=32845;

UPDATE `creature_template` SET `ScriptName`='boss_freya' WHERE `entry`=32906;

UPDATE `creature_template` SET `ScriptName`='boss_mimiron' WHERE `entry`=33350;

UPDATE `creature_template` SET `ScriptName`='boss_vezax' WHERE `entry`=33271;

UPDATE `creature_template` SET `ScriptName`='boss_yogg_saron' WHERE `entry`=33288;

UPDATE `creature_template` SET `ScriptName`='boss_algalon' WHERE `entry`=32871;

UPDATE `instance_template` SET `ScriptName`='instance_ulduar' WHERE `map`=603;


UPDATE `gameobject_template` SET `flags` = 0, `ScriptName` = 'go_ulduar_teleporter' WHERE `entry`  IN (194569);



# kologarn

DELETE FROM creature WHERE id IN (32933, 32934, 232933);

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) 

VALUES (9327991, 32933, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0);

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) 

VALUES (9327992, 32934, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0);

UPDATE creature_model_info SET bounding_radius=15, combat_reach=15 WHERE modelid IN (28638, 28822, 28821);

UPDATE creature_template SET scriptname='mob_ulduar_rubble' WHERE entry=33768;
