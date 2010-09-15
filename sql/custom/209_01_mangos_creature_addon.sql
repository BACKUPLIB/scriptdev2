/* "Dark Rider of Acherus" - mount */
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 28768);
INSERT INTO creature_template_addon (entry,mount,bytes1, bytes2, emote, moveflags, vehicle_id, passengers, auras) VALUES
(28768, 25678, 0, 0, 0, 0, 0, "", "");

/* delete all "Acherus Deathcharger" horses */
DELETE FROM creature WHERE id = 28782;

/* "Salanar the Horseman" (shadow realm version), scriptName & SPLINEFLAG_WALKMODE */
UPDATE creature_template SET ScriptName = "npc_salanar_the_horseman_shadow_realm" WHERE entry = 28788;
INSERT INTO creature_template_addon (entry,mount,bytes1, bytes2, emote, moveflags, vehicle_id, passengers, auras) VALUES
(28788, 0, 0, 0, 0, 0x1000, 0, "", "");

/* quests start should send you into the shadow realm right now */
UPDATE quest_template SET SrcSpell = 52693 WHERE entry = 12687;
