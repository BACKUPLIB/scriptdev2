# add achievement criteria requirements (don't rly know if this is needed)
DELETE FROM `achievement_criteria_requirement` WHERE `criteria_id` IN(9098,9099);
INSERT INTO `achievement_criteria_requirement` (`criteria_id`,`type`,`value1`) VALUES (9098,12,0),(9099,12,1);