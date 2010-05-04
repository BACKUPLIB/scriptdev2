/* Set correct FactionID to the right quest (change runcloth for reputation) */
UPDATE quest_template SET RewRepFaction1=530 WHERE entry IN (7824, 7832);
UPDATE quest_template SET RewRepFaction1=76 WHERE entry IN (7836, 7837);