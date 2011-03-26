-- despawn kelthuzad in naxx25
UPDATE `creature` SET `spawnMask` = '1' WHERE `id` = '15990';