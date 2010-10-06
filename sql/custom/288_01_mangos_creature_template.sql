-- fix NPC 34364
UPDATE `creature_template` SET `minhealth` = '64', `maxhealth` = '64' WHERE `entry` =34364; 

-- fix NPC 40295
UPDATE `creature_template` SET `minhealth` = '64', `maxhealth` = '64' WHERE `entry` =40295; 

-- fix NPC 54343
-- not perfect, but it works!
UPDATE `creature_template` SET `modelid_1` = '21733', `minhealth` = '4270',
`maxhealth` = '4270',
`minmana` = '3990',
`maxmana` = '3990' WHERE `entry` =40281;