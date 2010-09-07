-- fixes for instance violet hold
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`='30658';
UPDATE `creature_template` SET `ScriptName`='npc_azure_saboteur' WHERE `entry`='31079';
UPDATE `creature_template` SET `ScriptName`='boss_cyanigosa' WHERE `entry`='31134';
UPDATE `creature_template` SET `ScriptName`='boss_erekem' WHERE `entry`='29315';
UPDATE `creature_template` SET `ScriptName`='mob_erekem_guard' WHERE `entry`='29395';
UPDATE `creature_template` SET `ScriptName`='boss_ichoron' WHERE `entry`='29313';
UPDATE `creature_template` SET `ScriptName`='mob_ichor_globule',`modelid_1`=5492, `modelid_3`=5492 WHERE `entry`='29321';
UPDATE `creature_template` SET `modelid_1`=5492, `modelid_3`=5492 WHERE `entry`='31515'; -- heroic
UPDATE `creature_template` SET `ScriptName`='boss_lavanthor' WHERE `entry`='29312';
UPDATE `creature_template` SET `ScriptName`='boss_moragg' WHERE `entry`='29316';
UPDATE `creature_template` SET `ScriptName`='boss_xevozz' WHERE `entry`='29266';
UPDATE `creature_template` SET `ScriptName`='mob_ethereal_sphere' WHERE `entry`='29271';
UPDATE `creature_template` SET `ScriptName`='boss_zuramat' WHERE `entry`='29314';
UPDATE `creature_template` SET `ScriptName`='mob_zuramat_sentry' WHERE `entry`='29364';

UPDATE `gameobject_template` SET `flags`=`flags`|4 WHERE `entry` IN (191723,191564,191563,191562,191606,191722,191556,191566,191565); -- door untargetable

DELETE FROM `spell_script_target` WHERE `entry` IN (54160,59474);
INSERT INTO `spell_script_target` VALUES (54160, 1, 29266);
INSERT INTO `spell_script_target` VALUES (59474, 1, 29266);

UPDATE `creature_template` SET `minhealth` = 500, `maxhealth` = 700, `minlevel` = 77, `maxlevel` = 77, `mindmg` = 220, `maxdmg` = 270, `minrangedmg` = 170, `maxrangedmg` = 260, `attackpower` = 350, `rangedattackpower` = 60 WHERE `entry` = 29364;

-- not known if needed
-- UPDATE `creature_template` SET `unit_flags`=33816580 WHERE `entry`=30896;