-- =======
-- phase 1
-- =======

/* open instances in phase 1
utgarde keep
nexus
azjol-nerub
drak'tharon
violet Hold
gundrak
halls of lightning
naxxramas 10 non hero
obsidiansanctum 10 non hero
culling of stratholme */

-- close unfinished phase 1 instances (levelMin)
-- ahnkahnet(68), halls of stone(72), utgarde pinnacle(75), oculus(75), forge of souls(80), pit of saron(75),
-- halls of reflection(75), vault of archavon(80), trial of the champion(80) 
UPDATE `areatrigger_teleport` SET `required_level` = 90 WHERE `target_map` IN (619,599,575,578,632,658,668,624,650);

-- close/despawn instances of later phases
-- despawn naxxramas 25, obsidiansanctum 25
UPDATE `creature` SET `spawnMask` = `spawnMask` & 1 WHERE `map` IN (533,615);
-- close instances eye of eternity, ulduar, onyxias lair, trial of the crusader, icecrown citadel, culling of stratholme
UPDATE `areatrigger_teleport` SET `required_level` = 90 WHERE `target_map` IN (616,603,249,649,631,595);