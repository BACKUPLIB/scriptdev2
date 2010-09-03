/* Emblems Phase I */

-- set all looted emblems to emblem of heroism
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
UPDATE `gameobject_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
UPDATE `reference_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);
UPDATE `item_loot_template` SET `item` = 40752 WHERE `item` IN (40753,45624,47241,49426);

-- set all quest reward emblems to emblem of heroism
-- note: quests with emblems as RewItemId2/3/4 are only added in the last phase (frost + triumph, patch 3.3.0) and are anyway not available (see quest query)
UPDATE `quest_template` SET `RewItemId1` = 40752 WHERE `RewItemId1` IN (40753,45624,47241,49426);

-- remove quests with reward emblem of frost + emblem of triumph (they were added with patch 3.3.0 and will be added to ov later)
DELETE FROM `creature_questrelation` WHERE `quest` IN (24580,24579,24581,24582,24583,24584,24585,24586,24587,24588,24589,24590);


/*
emblem of heroism(emblem des heldentums) 	ID: 40752
emblem of valor(emblem der ehre) 		ID: 40753
emblem of conquest(emblem der eroberung)	ID: 45624
emblem of triumph(emblem des triumphs)		ID: 47241
emblem of frost(emblem des frosts)		ID: 49426
*/
