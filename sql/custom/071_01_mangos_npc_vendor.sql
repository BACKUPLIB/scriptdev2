# fix mantis bug http://mantis.orangevir.us/view.php?id=2507 by Alphawolf
UPDATE `npc_vendor` SET `ExtendedCost` = '146' WHERE `npc_vendor`.`item` IN (35105, 35104, 35019, 35020, 35041, 35039);
UPDATE `npc_vendor` SET `ExtendedCost` = '2283' WHERE `npc_vendor`.`item` IN (35008, 35016, 35074);
UPDATE `npc_vendor` SET `ExtendedCost` = '2285' WHERE `npc_vendor`.`item` IN (35094, 35073, 34986);
UPDATE `npc_vendor` SET `ExtendedCost` = '1758' WHERE `npc_vendor`.`item` IN (35040, 35021, 35106, 34985, 35065, 35107, 35108);