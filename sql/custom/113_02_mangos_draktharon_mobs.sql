# fix for some drak'tharon instance mobs
# make risen drakkari bat rider selectable
UPDATE `creature_template` SET `unit_flags` = 64 WHERE `entry` IN (26638,31351);
# update hulking corpse (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 13000, `maxhealth` = 13000, `minlevel` = 74, `maxlevel` = 74, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27597;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `name` = "hulking corpse" WHERE `entry` = 31348;
# update risen shadowcaster (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 1700, `maxhealth` = 1700, `minlevel` = 70, `maxlevel` = 70, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27600;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `name` = "risen shadowcaster" WHERE `entry` = 31356;
# update fetid troll corpse (normal and heroic) values probably not blizzlike
UPDATE `creature_template` SET `minhealth` = 2100, `maxhealth` = 2100, `minlevel` = 69, `maxlevel` = 69, `mindmg` = 200, `maxdmg` = 260, `minrangedmg` = 200, `maxrangedmg` = 260 WHERE `entry` = 27598;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `name` = "risen shadowcaster" WHERE `entry` = 31873;
# update crystal handler (normal)
UPDATE `creature_template` SET `maxlevel` = 75 WHERE `entry` = 26627;