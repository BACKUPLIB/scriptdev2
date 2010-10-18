/* Mod speed of add in anub'arak fight and set scriptname*/
UPDATE creature_template SET speed_run=2.5, speed_walk=2.5, ScriptName='npc_elite_anub' WHERE entry=28732;

DELETE FROM creature_template WHERE entry IN (105000, 105001);
INSERT INTO creature_template(entry, difficulty_entry_1, modelid_1, modelid_2, modelid_3, modelid_4, NAME, subname, IconName, gossip_menu_id, minlevel, maxlevel, minhealth, maxhealth, minmana, maxmana, armor, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, TYPE, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, PetSpellDataId, mingold, maxgold, AIName, MovementType, InhabitType, unk16, unk17, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName) VALUES 
('105000', '105001', '31043', '0', '0', '0', 'Impale Trigger', '', '','0','83', '83', '20000', '20000', '0', '0', '5000', '14', '14', '0', '0.1', '0.1', '1', '0', '1', '2', '0', '1', '1', '1', '1', '0', '33554434', '0', '0','0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', 'EventAI','0', '3', '1.0', '1.0', '0','0','0', '0', '0', '0', '0', '0', '1', '0', '0', '2', ''),
('105001', '0', '31043', '0', '0', '0', 'Impale Trigger', '', '','0','83', '83', '20000', '20000', '0', '0', '5000', '14', '14', '0', '0.1', '0.1', '1', '0', '1', '2', '0', '1', '1', '1', '1', '0', '33554434', '0', '0','0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', 'EventAI','0', '3', '1.0', '1.0', '0','0','0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '');

DELETE FROM creature_ai_scripts WHERE creature_id=105000;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, COMMENT) VALUES
(10500001, 105000, 0, 100, 2, 2500, 2700, 50000, 60000, 11, 53454, 0, 1, 'Impale trigger - Cast Impale (normal mode)'),
(10500002, 105000, 0, 100, 4, 2500, 2700, 50000, 60000, 11, 59446, 0, 1, 'Impale trigger - Cast Impale (heroic mode)'),
(10500003, 105000, 1, 100, 2, 2500, 2700, 50000, 60000, 11, 53454, 0, 1, 'Impale trigger - Cast Impale OOC (normal mode)'),
(10500004, 105000, 1, 100, 4, 2500, 2700, 50000, 60000, 11, 59446, 0, 1, 'Impale trigger - Cast Impale OOC (heroic mode)'),
(10500005, 105000, 1, 100, 6, 100, 150, 50000, 60000, 11, 42373, 0, 1, 'Impale trigger - Burrow OOC'),
(10500006, 105000, 0, 100, 6, 100, 150, 50000, 60000, 11, 42373, 0, 1, 'Impale trigger - Burrow'),
(10500007, 105000, 0, 100, 6, 100, 150, 0, 0, 20, 0, 0, 0, 'Impale trigger - Set no auto attack'),
(10500008, 105000, 0, 100, 6, 100, 150, 0, 0, 21, 0, 0, 0, 'Impale trigger - Set no combat movement');

-- set immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(28684,28921,29120,31561,31610,31611);

-- remote possible reputation bug
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` = 31647;
