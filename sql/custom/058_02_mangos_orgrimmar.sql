-- Quest 14100 fix: Nich blizzlike, aber eigentlich sogar schöner so!
UPDATE `quest_template` SET `RewSpell` = '0', `RewSpellCast` = '0', `RewItemId1` = '46978', `RewItemCount1` = '1' WHERE `entry` = 14100; 
-- Set correct FactionID to the right quest (change runcloth for reputation)
UPDATE quest_template SET RewRepFaction1=76 WHERE entry IN (7836, 7837);
UPDATE quest_template SET RewRepFaction1=530 WHERE entry IN (7824, 7832);
-- Spawnt das Portal auch in Orgrimmar
DELETE FROM gameobject WHERE id=195142 AND map = 1 AND guid!=56764;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(160009, 195142, 1, 1465.295068, -4214.662598, 59.221451, 5.256645, 180, 255, 1);
