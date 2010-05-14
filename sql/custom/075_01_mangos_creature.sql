#spawn npc 25003 (mantis bug 2571)
DELETE FROM `creature` WHERE `id` = 25003;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`curmana`) VALUES (25003,530,1,1,12588.90,-6916.43,4.602,6.12,500,7000,3309);