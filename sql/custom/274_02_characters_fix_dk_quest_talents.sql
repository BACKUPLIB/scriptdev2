-- add and missing quests to deathknightplayers and set them revarded

-- this will take every character having the last quest of the deathknight questline active or complete 
-- and add all missing deathknight quests that give talent-points to its queststatus as rewarded quests.
-- player will not get any questreward items or gold

-- remove wrong added spells / quests
DELETE FROM `character_spell` WHERE `spell` IN ('50977', '48778') AND `GUID` IN (SELECT `GUID` FROM `characters` WHERE `class` !=6);
DELETE FROM `character_queststatus` WHERE `quest` IN ('12678','12679','12680','12687','12698','12701','12706','12716','12719','12720','12722','12724','12725','12727','12733','12739','12751','12754','12755','12756','12757','12779','12801') AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` !=6);

INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12678', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12679', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12680', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12687', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12698', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12701', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12706', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12716', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12719', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12720', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12722', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12724', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12725', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12727', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12733', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12739', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12751', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12754', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12755', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12756', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12757', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12779', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));
INSERT IGNORE INTO `character_queststatus` (`guid`,`quest`,`status`,`rewarded`) 
(SELECT `guid`, '12801', '0','1' FROM `character_queststatus` WHERE quest = 13181 OR quest = 13188 AND `guid` IN (SELECT `GUID` FROM `characters` WHERE `class` =6));