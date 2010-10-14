-- vendor fixes (PvP items etc)

# fix for mantis id 2506 by Alphawolf
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES 
('12781', '44957', '0', '0', '165'),
('12793', '44957', '0', '0', '165');

-- Begnadigung des _Brutalen Gladiators, korrekte Preis/Arenawertung
UPDATE `npc_vendor` SET `ExtendedCost` =  '2283' WHERE `item` =35074;
-- Begandigung des Brutalen Gladiators, keine Wertung nötig
UPDATE `npc_vendor` SET `ExtendedCost` = '2364' WHERE `item` IN (35094, 35073, 34986);

# fix mantis bug http://mantis.orangevir.us/view.php?id=2507 by Alphawolf
UPDATE `npc_vendor` SET `ExtendedCost` = '146' WHERE `item` IN (35105, 35104, 35019, 35020, 35041, 35039);
UPDATE `npc_vendor` SET `ExtendedCost` = '2283' WHERE `item` IN (35008, 35016, 35074);
UPDATE `npc_vendor` SET `ExtendedCost` = '2285' WHERE `item` IN (35094, 35073, 34986);
UPDATE `npc_vendor` SET `ExtendedCost` = '1758' WHERE `item` IN (35040, 35021, 35106, 34985, 35065, 35107, 35108);

-- nether drake
DELETE FROM npc_vendor WHERE entry=88000 AND item=30609;
INSERT INTO npc_vendor (`entry`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES(88000, 30609, 0, 0, 0);
