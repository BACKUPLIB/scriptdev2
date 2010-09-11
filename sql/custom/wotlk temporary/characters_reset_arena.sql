-- reset arena ratings
UPDATE `arena_team_stats` SET `rating` = 0 WHERE `arenateamid` BETWEEN 0 AND 2500;
UPDATE `arena_team_member` SET `personal_rating` = 0 WHERE `arenateamid` BETWEEN 0 AND 2500;
UPDATE `characters` SET `arenaPoints` = 0, `totalHonorPoints` = 0;