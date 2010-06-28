# fix horses-attack-each-other-and-others-bug in dk start area stables of havenau
UPDATE `creature_template` SET `faction_A` = '2096', `faction_H` = '2096' WHERE `entry` = 28605;