-- Quest 14111 fix: Nich blizzlike, aber eigentlich sogar schöner so!
UPDATE `quest_template` SET `RewSpell` = '0', `RewSpellCast` = '0', `RewItemId1` = '46978', `RewItemCount1` = '1'
WHERE `entry` IN (14111, 14100);
