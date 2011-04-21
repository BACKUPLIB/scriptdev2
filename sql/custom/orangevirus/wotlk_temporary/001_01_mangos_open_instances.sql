-- =================================
-- phase 1 - T7 - itemlevel max 213
-- =================================

/* open instances in phase 1
utgarde keep
nexus
azjol-nerub
drak'tharon
violet Hold
gundrak
ahnkahnet
halls of lightning
culling of stratholme
naxxramas 10 & 25
obsidiansanctum 10
culling of stratholme 
halls of stone
eye of eternity
*/

-- open closed phase 1 instances
UPDATE `areatrigger_teleport` SET `required_level` = 80 WHERE `target_map` = 616;
UPDATE `areatrigger_teleport` SET `required_level` = 72 WHERE `target_map` = 599;
/*UPDATE `areatrigger_teleport` SET `required_level` = 75 WHERE `target_map` = 575; -- utgarde pinnacle
UPDATE `areatrigger_teleport` SET `required_level` = 75 WHERE `target_map` = 578; -- oculus
*/

-- =================================
-- phase 2 - T8 - itemlevel max 232
-- =================================

/* open instances in phase 2
ulduar (map 603)
eye of eternity (map 616) 25er variante 
halls of reflection (map 668)
pit of saron (map 658)
forge of souls (map 632)
trial of the champion(map 650)
 */
 
-- open instances eye of eternity, ulduar, forge of souls, trial of the champion
-- UPDATE `areatrigger_teleport` SET `required_level` = 80 WHERE `target_map` IN (603,632,650);
-- open instance halls of reflection, pit of saron
-- UPDATE `areatrigger_teleport` SET `required_level` = 75 WHERE `target_map` IN (668,658);

-- open instanc eye of eternity
-- von hand anpassen
-- UPDATE `creature` SET `spawnMask` =  WHERE `map` IN (616); 


-- =====================================================
-- phase 3 - T9 - itemlevel max 272 - Emblem of Triumph
-- =====================================================

/* open instances in phase 3
onyxias lair (map 249)
trial of the crusader (map 649) 
*/

-- open instances onyxias lair, trial of the crusader
-- UPDATE `areatrigger_teleport` SET `required_level` = 80 WHERE `target_map` IN (249,649);



-- ===============================
-- phase 4 - T10 - Emblem of Frost 
-- ===============================

/* open instances in phase 4
icecrown citadel (map 631)
The Ruby Sanctum (map 724)
vault of archavon (map 624)  
*/

-- open instances icecrown citadel, The Ruby Sanctum
-- UPDATE `areatrigger_teleport` SET `required_level` = 80 WHERE `target_map` IN (624,631,724);
