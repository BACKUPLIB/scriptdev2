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
naxxramas 10
obsidiansanctum 10
culling of stratholme */

-- close instances of later phases
-- close instances eye of eternity(80), ulduar(80), onyxias lair(80), trial of the crusader(80), icecrown citadel(80) 
-- vault of archavon(80), The Ruby Sanctum(80), halls of reflection(75), pit of saron(75), forge of souls(80), trial of the champion(80)
UPDATE `areatrigger_teleport` SET `required_level` = 90 WHERE `target_map` IN (616,603,249,649,631,624,724,668,658,632,650);

-- close unfinished phase 1 instances (levelMin)
-- halls of stone(72), utgarde pinnacle(75), oculus(75), eye of eternity (map 616) 10er
UPDATE `areatrigger_teleport` SET `required_level` = 90 WHERE `target_map` IN (599,575,578, 616);

-- despawn unfinished phase 1 instances
-- despawn naxxramas 25, obsidiansanctum 25
UPDATE `creature` SET `spawnMask` = `spawnMask` &~ 2 WHERE `map` IN (533,615);

-- despawn later difficulty instances
-- despawn eye of eternity 25er
UPDATE `creature` SET `spawnMask` = `spawnMask` &~ 2 WHERE `map` IN (616);

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
