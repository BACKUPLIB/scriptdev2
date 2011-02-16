-- battleground alterac valley fixes

UPDATE `creature` SET `spawnMask` = 15 WHERE `map` = 30;
UPDATE `gameobject` SET `spawnMask` = 15 WHERE `map` = 30;

