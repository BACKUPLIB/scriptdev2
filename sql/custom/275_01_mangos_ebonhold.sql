-- Into the Realm of Shadows
UPDATE `creature_template` SET `ScriptName`='npc_salanar_the_horseman',ainame="" WHERE `entry`='28653';
UPDATE `creature_template` SET `ScriptName`='mob_dark_rider_of_acherus',ainame="" WHERE `entry`='28768';
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 28768);
DELETE FROM `creature_template_addon` WHERE entry = 28768;
INSERT INTO creature_template_addon (entry,mount,bytes1, bytes2, emote, moveflags, vehicle_id, passengers, auras) VALUES
(28768, 25678, 0, 0, 0, 0, 0, "", "");
UPDATE creature SET spawnMask = 0 WHERE id = 28782;
/* "Salanar the Horseman" (shadow realm version), scriptName & SPLINEFLAG_WALKMODE */
UPDATE creature_template SET ScriptName = "npc_salanar_the_horseman_shadow_realm" WHERE entry = 28788;
DELETE FROM `creature_template_addon` WHERE `entry` = 28788;
INSERT INTO creature_template_addon (entry,mount,bytes1, bytes2, emote, moveflags, vehicle_id, passengers, auras) VALUES
(28788, 0, 0, 0, 0, 0x1000, 0, "", "");
/* quests start should send you into the shadow realm right now */
UPDATE quest_template SET SrcSpell = 52693 WHERE entry = 12687;

-- The Gift That Keeps On Giving
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_miner',ainame="" WHERE `entry` IN ('28822','28819','28841');
UPDATE `creature_template` SET `type_flags` = 4096, `minlevel` = 44, `maxlevel` = 46, `minhealth` = 891, `maxhealth` = 960, `armor` = 2750, `mindmg` = 77, `maxdmg` = 102, `type` = 6,`ScriptName` = "npc_scarlet_ghoul" WHERE `entry` = 28845;
UPDATE `quest_template` SET `ReqItemId1` = 39253 WHERE `entry` = 12698;

-- How To Win Friends And Influence Enemies
UPDATE `creature_template` SET `ScriptName`='npc_crusade_persuaded',ainame="" WHERE `entry` IN (28939,28940,28610);
UPDATE `quest_template` SET `ReqItemId1` = 39371 WHERE `entry` = 12720;

-- An End To All Things...
UPDATE creature_template SET InhabitType = 3 WHERE entry = 28670;

-- The Plaguebringers Request
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 12751;

--  quest 12701 (massacre at light's point)
DELETE FROM `event_scripts` WHERE `id` = 190767;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`x`,`y`,`z`,`o`,`comments`) VALUES (190767,0,6,609,2263.7,-6202.6,13,1.98,"");
UPDATE `gameobject_template` SET `data2` = 190767 WHERE `entry` = 190767;
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 4298;

-- Ambush At The Overlook
DELETE FROM `creature` WHERE `id` = 28957;
INSERT INTO `creature` (`id`, `map`, `phaseMask`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(28957, 609, 4, 1, 0, 0, 1416.466, -6017.807, 116.357, 1, 360, 0, 0, 1, 0, 0, 1);
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier_controller',flags_extra=130,ainame="" WHERE `entry`='28957';
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier',ainame="" WHERE `entry`='29076';

-- Bloody Breakout
UPDATE `creature_template` SET `ScriptName`='mob_high_inquisitor_valroth',minmana=6489,maxmana=6489,unit_flags=32768,ainame="" WHERE `entry`='29001';
UPDATE `creature_template` SET `AIName`='EventAI',minmana=1020,maxmana=1058,unit_flags=32768 WHERE (`entry`='29007');
DELETE FROM creature_ai_scripts WHERE id BETWEEN 90030 AND 90033;
INSERT INTO `creature_ai_scripts` VALUES ('90030', '29007', '0', '0', '100', '1', '1000', '4000', '1000', '4000', '11', '15498', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Holy Smite');
INSERT INTO `creature_ai_scripts` VALUES ('90031', '29007', '0', '0', '100', '1', '1000', '10000', '20000', '21000', '11', '34809', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Holy Fury');
INSERT INTO `creature_ai_scripts` VALUES ('90032', '29007', '0', '0', '100', '1', '1000', '5000', '1000', '5000', '11', '19725', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Turn Undead');
INSERT INTO `creature_ai_scripts` VALUES ('90033', '29007', '4', '0', '100', '0', '0', '0', '0', '0', '11', '15498', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte aggro');

-- The Light of Dawn
-- set quest not-autocomplete 
UPDATE quest_template SET method = 2 WHERE entry = 12801;
UPDATE `creature_template` SET `ScriptName`='npc_highlord_darion_mograine',ainame="" WHERE `entry`='29173';
UPDATE `creature_template` SET `ScriptName`='npc_the_lich_king_tirion_dawn',ainame="" WHERE `entry` IN (29183,29175);
UPDATE creature_template SET AIName='EventAI',unit_flags=0,type_flags=8 WHERE entry IN (29199,29204,29200,29174,29182,29186,29190,29219,29206,29176,29178,29179,29180,29177,29181);
DELETE FROM `spell_script_target` WHERE `entry` IN (53658, 53679, 53701, 53705, 53706, 53677, 53685);
-- insert into spell_script_target values (53658, 1, 29173);
INSERT INTO spell_script_target VALUES (53679, 1, 29183);
INSERT INTO spell_script_target VALUES (53701, 1, 29175);
INSERT INTO spell_script_target VALUES (53705, 1, 29183);
INSERT INTO spell_script_target VALUES (53706, 1, 29183);
INSERT INTO spell_script_target VALUES (53677, 1, 29227);
INSERT INTO spell_script_target VALUES (53685, 1, 29175);

DELETE FROM `gameobject` WHERE `id` IN (191330);
INSERT INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('160011','191330','609','1','128','2283.896','-5287.914','83.066','1','0.0','0.0','0.0','1.0','180','0','1');

DELETE FROM creature_ai_scripts WHERE id BETWEEN 90051 AND 90084;
INSERT INTO `creature_ai_scripts` VALUES ('90051', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90052', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90053', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90054', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90055', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90056', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90057', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90058', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90059', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90060', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90061', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90062', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90063', '29174', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '29427', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_LIGHT1');
INSERT INTO `creature_ai_scripts` VALUES ('90064', '29174', '4', '0', '100', '0', '0', '0', '0', '0', '11', '53625', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light aggro');
INSERT INTO `creature_ai_scripts` VALUES ('90065', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53625', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HEROIC_LEAP');
INSERT INTO `creature_ai_scripts` VALUES ('90066', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53643', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_STRIKE');
INSERT INTO `creature_ai_scripts` VALUES ('90067', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53638', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_WRATH');
INSERT INTO `creature_ai_scripts` VALUES ('90068', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53629', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_UPPERCUT');
INSERT INTO `creature_ai_scripts` VALUES ('90069', '29182', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '33642', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rimblat Earthshatter - SPELL_CHAIN_HEAL');
INSERT INTO `creature_ai_scripts` VALUES ('90070', '29182', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53630', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rimblat Earthshatter - SPELL_THUNDER');
INSERT INTO `creature_ai_scripts` VALUES ('90071', '29186', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53633', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rampaging Abomination - SPELL_CLEAVE1');
INSERT INTO `creature_ai_scripts` VALUES ('90072', '29186', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '50335', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rampaging Abomination - SPELL_SCOURGE_HOOK');
INSERT INTO `creature_ai_scripts` VALUES ('90073', '29190', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53634', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_SCOURGE_HOOK');
INSERT INTO `creature_ai_scripts` VALUES ('90074', '29190', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '36706', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_THUNDERCLAP');
INSERT INTO `creature_ai_scripts` VALUES ('90075', '29190', '0', '0', '100', '3', '5000', '10000', '5000', '10000', '11', '53627', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_THUNDERCLAP');
INSERT INTO `creature_ai_scripts` VALUES ('90076', '29219', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53632', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Volatile Ghoul - SPELL_GHOULPLOSION');
INSERT INTO `creature_ai_scripts` VALUES ('90077', '29206', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53631', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Warrior of the Frozen Wastes - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90078', '29176', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53631', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Korfax - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90079', '29176', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53625', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Korfax - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90080', '29177', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '37979', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Commander Eligor Dawnbringer - SPELL_HOLY_LIGHT2');
INSERT INTO `creature_ai_scripts` VALUES ('90081', '29181', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '20664', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_REJUVENATION');
INSERT INTO `creature_ai_scripts` VALUES ('90082', '29181', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '25817', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_TRANQUILITY');
INSERT INTO `creature_ai_scripts` VALUES ('90083', '29181', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '20678', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_STARFALL');
INSERT INTO `creature_ai_scripts` VALUES ('90084', '29181', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '21807', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_WRATH');

# Wachen
UPDATE creature_template SET unit_flags=0 WHERE entry=31094;

# Flickwerk
UPDATE creature_template SET dmg_multiplier=12, rank=1 WHERE entry=31099;
UPDATE creature SET spawntimesecs=360 WHERE id=31099;

# citizen of new-avalon
UPDATE creature_template SET dynamicflags=0 WHERE entry=28942;

# Horn of Frostbrood
UPDATE item_template SET ScriptName='item_horn_of_the_frostbrood' WHERE entry=39700;

# fix horses-attack-each-other-and-others-bug in dk start area stables of havenau
UPDATE `creature_template` SET `faction_A` = '2096', `faction_H` = '2096' WHERE `entry` = 28605;

-- eye of acherus quest
UPDATE creature_template SET ScriptName = "npc_eye_of_acherus", InhabitType = 3, minlevel = 55, maxlevel = 55, armor = 9730 WHERE entry = 28511;
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `vehicle_id`, `passengers`, `auras`) VALUES
('28511','0','0','0','0',0x2000,'0',NULL,'51890 0 51890 1 51890 2');
-- Eye of Acherus Control Mechanism
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES
(191609, 10, 8123, 'Kontrollmechanismus des Auges von Acherus', '', '', '', 0, 6553636, 1, 0, 0, 0, 0, 0, 0, 1635, 12641, 0, 0, 0, 0, 0, 0, 0, 0, 51888, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
-- dummy targets for eye of acherus quest
UPDATE creature_template SET modelid_1 = 16925, modelid_3 = 16925, scale = 2, ScriptName = "npc_death_comes_from_on_high_dummy_targetsAI" WHERE entry IN (28525,28542,28543,28544);
REPLACE INTO creature_template_addon (`entry`,`moveflags`,`auras`) VALUES
(28525,0,'64328 0'),
(28542,0,'64328 0'),
(28543,0,'64328 0'),
(28544,0,'64328 0');
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28511,28525,28542,28543,28544));
/* All harmful npc's and GO's */
UPDATE creature SET phaseMask = 2 WHERE guid IN
(128627,128628,128629,128630,128631,128632,128633,128634,128635,128636,128637,128643,128644,128645,128646,
128647,128648,128649,128650,128651,128652,128653,128654,128655,128656,128657,128658,128659,128660,128661,
128662,128663,128664,128665,128666,128667,128668,128669,128670,128671,128672,128673,128674,128675,128676,
128677,128678,128679,128680,128681,128682,128683,128684,128685,128687,128688,128689,128690,128691,128692,
128693,128694,128695,128696,128698,128699,128700,128701,128702,128705,128706,128707,128708,128709,128710,
128711,128712,128713,128714,128715,128716,128717,128718,128719,128720,128721,128722,128723,128724,128725,
128726,128727,128728,128729,128730,128731,128732,128733,128734,128735,128736,128737,128752,128796,128797,
128798,128799,128800,128801,128802,128958,129165,129168,129169,129170,129171,129474,129475,129476,129477,
129478,129479,129483,129484,129485,129486,129487,129488,129489,129490,129491);
UPDATE creature SET phaseMask = (phaseMask | 2) WHERE guid IN
(65961,65962,65963,65964,65965,65966);
/*Lich King*/
UPDATE creature SET phaseMask = (phaseMask | 2) WHERE guid = 128738;
