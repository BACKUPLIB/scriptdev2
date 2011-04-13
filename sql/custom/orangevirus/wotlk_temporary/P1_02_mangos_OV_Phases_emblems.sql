/* 
===================================================================================================
= emblem of heroism(emblem des heldentums) 	Phase 1 (Hero /10er Raid)		ID: 40752 =
= emblem of valor(emblem der ehre) 	 	Phase 1 (25er Raid)			ID: 40753 =
= emblem of conquest(emblem der eroberung) 	Phase 2 (Ulduar)			ID: 45624 =
= emblem of triumph(emblem des triumphs)	Phase 3 (trial of the crusader)		ID: 47241 =
= emblem of frost(emblem des frosts)	 	Phase 4 (ICC, Ruby Sanktum)		ID: 49426 =
===================================================================================================
*/


/*
===========================================================================================
Emblems Phase 1 									  =
emblem of heroism(emblem des heldentums)	Phase 1 (Hero /10er Raid)	ID: 40752 =
===========================================================================================
*/

-- set  looted emblems to emblem of heroism
UPDATE `item_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
UPDATE `gameobject_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
-- todo creature_loot update later
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
-- give naxx25 bosses emblem of valor (anub'rekhan, faerlina, maexxna, noth, patchwerk, grobbulus, gluth, thaddius,noth,heigan,loatheb,razuvious,gothik,sapphiron,kelthuzad)
UPDATE `creature_loot_template` SET `item` = 40753 WHERE `entry` IN (29249,29268,29278,29615,29324,29373,29417,29448,29615,29701,29718,29940,29955,29991,30061) AND `item` = 40752;
-- horsemen chest
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `entry` IN  (193426) AND `item` = 40752;
-- give eoe boss malygos chest emblem of valor
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `entry` IN  (193905) AND `item` = 40752;


-- set all quest reward emblems to emblem of heroism, 
-- note: quests with emblems as RewItemId2/3/4 are only added in the last phase (frost + triumph, patch 3.3.0) and are anyway not available (see quest query)
-- dungeon daylie
UPDATE `quest_template` SET `RewItemId1` = 40752 WHERE `entry` IN (13240, 13241, 13243, 13244) AND `RewItemId1` IN (40752,40753,45624,47241,49426);
-- hero daylie
UPDATE `quest_template` SET `RewItemId1` = 40752 WHERE `entry` IN (13245, 13246, 13247, 13248, 13249, 13250, 13251, 13252, 13253, 13254, 13255, 13256, 14199) AND `RewItemId1` IN (40752,40753,45624,47241,49426);


/*
emblem of heroism(emblem des heldentums) Phase 1 (Hero /10er Raid)		ID: 40752
emblem of valor(emblem der ehre) 	 Phase 1 (25er Raid)			ID: 40753
emblem of conquest(emblem der eroberung) Phase 2 (Ulduar 25)			ID: 45624
emblem of triumph(emblem des triumphs)	 Phase 3 (trial of the crusader)	ID: 47241
emblem of frost(emblem des frosts)	 Phase 4 (ICC, Ruby Sanktum)		ID: 49426
*/


/*
===========================================================================================
Emblems Phase 2 									  =
emblem of conquest(emblem der eroberung) Phase 2 (Ulduar, eye of eternity)	ID: 45624 =
===========================================================================================

ulduar 10 emblem of valor(emblem der ehre) 	 	Phase 1 (25er Raid)			ID: 40753
ulduar 25 emblem of conquest(emblem der eroberung) 	Phase 2 (Ulduar)			ID: 45624


-- set normal looted emblems to emblem of valor
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `entry` IN (26097, 27061, 27068, 27030, 27074, 27069, 27078, 27085, 26094, 26929, 26950, 26946, 26955, 27081, 26962, 26974, 27086, 26967) AND `item` IN (40752,40753,45624,47241,49426);

-- set hero looted emblems to emblem of conquest
UPDATE `item_loot_template` SET `item` = 45624 WHERE `entry` IN (45878) AND `item` IN (40752,40753,45624,47241,49426);
*/
/*
===========================================================================================
Emblems Phase 3 									  =
emblem of triumph(emblem des triumphs)	 Phase 3 (trial of the crusader)	ID: 47241 =
===========================================================================================

10 +25er variante

UPDATE `gameobject_loot_template` SET `item` = 47241 WHERE `entry` IN (27356, 27335, 27503, 27498)  AND `item` IN (40752,40753,45624,47241,49426);
*/
/*
===========================================================================================
Emblems Phase 4 									  =
emblem of frost(emblem des frosts)	 Phase 4 (ICC, Ruby Sanktum)		ID: 49426 =
===========================================================================================

icc 10+25 frost

-- set  looted emblems to emblem of heroism
UPDATE `item_loot_template` SET `item` = 49426 WHERE `entry` IN (52006, 54536)  AND `item` IN (40752,40753,45624,47241,49426);
*/