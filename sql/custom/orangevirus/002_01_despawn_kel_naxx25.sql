-- despawn kelthuzad in naxx25
UPDATE `creature` SET `spawnMask` = '1' WHERE `entry` = '15990';