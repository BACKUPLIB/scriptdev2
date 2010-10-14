DELETE FROM creature_template WHERE entry IN (105002);
INSERT INTO creature_template(entry, difficulty_entry_1, modelid_1, modelid_2, modelid_3, modelid_4, NAME, subname, IconName, gossip_menu_id, minlevel, maxlevel, minhealth, maxhealth, minmana, maxmana, armor, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, TYPE, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, PetSpellDataId, mingold, maxgold, AIName, MovementType, InhabitType, unk16, unk17, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName) VALUES 
('105002', '0', '2588', '0', '0', '0', 'Brückenwächter der Dakkari', '', '','25200','80', '80', '12445', '12445', '0', '0', '5000', '35', '35', '1', '0.1', '0.1', '1', '0', '1', '2', '0', '1', '1', '1', '1', '0', '0', '0', '0','0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', '','0', '3', '1.0', '1.0', '0','0','0', '0', '0', '0', '0', '0', '1', '0', '0', '2', 'npc_bridgewatcher');

DELETE FROM gossip_menu WHERE entry=25200;
INSERT INTO gossip_menu (entry, text_id) VALUES
(25200, 1);

DELETE FROM gossip_menu_option WHERE menu_id=25200;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_script_id) VALUES
(25200, 25200, 0, "Ich will über die Brücke.", 1, 1, 25200);

DELETE FROM gossip_scripts WHERE id=25200;
INSERT INTO gossip_scripts (id, command, datalong, `x`, `y`, `z`, `o`,`comments`) VALUES
(25200, 6, 604, 1801.600952, 743.734192, 119.207565, 0.000943,"");

UPDATE creature_template SET ScriptName='mob_colossus_elemental' WHERE entry=29573;
UPDATE creature_template SET ScriptName='', unit_flags=33554434, faction_A=35, faction_H=35 WHERE entry=29830;
DELETE FROM creature WHERE guid IN (127078, 127076, 127079, 127077);
UPDATE creature_template SET unit_flags=0, movementId=0 WHERE entry=29307;

UPDATE creature_template SET ScriptName='boss_eck_the_ferocious' WHERE entry=29932;
UPDATE creature SET position_x=1649.685669, position_y=942.886780, position_z=107.203957 WHERE guid=127203;
DELETE FROM creature WHERE id=29932;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(230017, 29932, 604, 2, 1, 26644, 0, 1640.287964, 932.298462, 107.414001, 0.864934, 900000, 0, 0, 431392, 0, 0, 0);

-- update loot 
UPDATE creature_loot_template SET ChanceOrQuestChance=2.3 WHERE entry=30510 AND item=21524;
UPDATE creature_loot_template SET ChanceOrQuestChance=0, groupid=1 WHERE entry=29304 AND item=35584;
DELETE FROM creature_loot_template WHERE entry=29932;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount) VALUES
(29932, 43313, 0, 1, 1, 1),
(29932, 43311, 0, 1, 1, 1),
(29932, 43312, 0, 1, 1, 1),
(29932, 43310, 0, 1, 1, 1),
(29932, 45624, 100, 2, 1, 1),
(29932, 43228, 23.8, 0, 1, 4);
UPDATE creature_template SET lootid=29932 WHERE entry=29932;
UPDATE creature_template SET lootid=31673 WHERE entry=31673;

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(29304,29307,29305,29306,29932,31360,31362,31365,31368,31370);
