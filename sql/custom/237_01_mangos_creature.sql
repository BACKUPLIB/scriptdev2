/*          Nargle Lashcord

    Arena set vedor in Dalaran: Sells set items of the current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    3.0.2 -> s5
    3.0.1 -> No Vendor?
*/
DELETE FROM `creature` where `id` IN (33936, 33927, 33921, 31863);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(NULL, 33936, 571, 1, 3, 26463, 0, 5753.74, 585.413, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.2.0 version */(NULL, 33927, 571, 0, 3, 26463, 0, 5753.74, 585.413, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.1.1 version */(NULL, 33921, 571, 0, 3, 26463, 0, 5753.74, 585.413, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.0.2 version */(NULL, 31863, 571, 0, 3, 26463, 0, 5753.74, 585.413, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0);
/* 3.0.1 version, we don't need this guy. (NULL, 29539, 571, 0, 3, 26463, 0, 5753.74, 585.413, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0); */


/*          Xazi Smolderpipe

    Arena set vedor in Dalaraan: Sells set items of the last season.

    3.3.2 -> s7
    3.2.0 -> s6
    3.1.1 -> s5
    3.0.2 -> "lower s5" (Hateful Gladiator)
    3.0.1 -> No Vendor?
*/
DELETE FROM `creature` where `id` IN (33926, 33922, 31864, 33937);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* Future patch!? We don't need him. (NULL, 33926, 571, 1, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),*/
/* 3.3.2 version, already in UDB 392 */(88648, 33937, 571, 1, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.2.0 version */(NULL, 33926, 571, 0, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.1.1 version */(NULL, 33922, 571, 0, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.0.2 version */(NULL, 31864, 571, 0, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0);
/* 3.0.1 version, we don't need this guy. (NULL, 33937, 571, 0, 3, 26464, 0, 5751.54, 584.66, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0)*/


/*          Zom Bocom

    Arena set vedor in Dalaraan: Sells set items of the second last season.

    3.3.2 -> s6
    3.2.0 -> s5
    3.1.1 -> "lower s5" (Hateful Gladiator)
    3.0.2 -> "even lower s5" :-P (Savage Gladiator)
    3.0.1 -> No Vendor?
*/
DELETE FROM `creature` where `id` IN (33925, 33923, 31865, 33938);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(88649, 33938, 571, 1, 3, 26465, 0, 5751.73, 582.943, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.2.0 version */(NULL, 33925, 571, 0, 3, 26465, 0, 5751.73, 582.943, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.1.1 version */(NULL, 33923, 571, 0, 3, 26465, 0, 5751.73, 582.943, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0),
/* 3.0.2 version */(NULL, 31865, 571, 0, 3, 26465, 0, 5751.73, 582.943, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0);
/* 3.0.1 version, we don't need this guy. (NULL, 33925, 571, 0, 3, 26465, 0, 5751.73, 582.943, 615.052, 0, 180, 0, 0, 8025, 0, 0, 0); */


/*          Trapjaw Rix

    Arena weapon vedor in Dalaraan: Sells set items of current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    No Versions of lower patches!?
*/
DELETE FROM `creature` where `id` IN (34092, 34087, 34095);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(88397, 34095, 571, 1, 3, 29076, 0, 5761.32, 578.753, 615.052, 2.09439, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version */ (NULL, 34092, 571, 0, 3, 29076, 0, 5761.32, 578.753, 615.052, 2.09439, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */ (NULL, 34087, 571, 0, 3, 29076, 0, 5761.32, 578.753, 615.052, 2.09439, 180, 0, 0, 6986, 0, 0, 0);


/*          Kezzik the Striker

    Arena set and weapon vendor in Area52: Sells set items of current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    3.0.2 -> s5, and another version as non-vendor
*/
DELETE FROM `creature` where `id` IN (33940, 33918, 32356, 33931);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version */(NULL, 33940, 530, 0, 1, 0, 0, 3075.46, 3641.53, 143.779, 3.95074, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version, already in UDB 392 */(88318, 33931, 530, 1, 1, 0, 0, 3075.46, 3641.53, 143.779, 3.95074, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33918, 530, 0, 1, 0, 0, 3075.46, 3641.53, 143.779, 3.95074, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version, non vendor, we don't need this guy. (NULL, 32405, 530, 0, 1, 0, 0, 3075.46, 3641.53, 143.779, 3.95074, 180, 0, 0, 6986, 0, 0, 0),*/
/* 3.0.2 version */(NULL, 32356, 530, 0, 1, 0, 0, 3075.46, 3641.53, 143.779, 3.95074, 180, 0, 0, 6986, 0, 0, 0);


/*          Big Zokk Torquewrench

    Arena set and weapon vendor in Area52: Sells set items of last season.

    3.3.2 -> s7
    3.2.0 -> s6
    3.1.1 -> s5
    3.0.2 -> "lower s5" (Hateful Gladiator)
    2.4.2 -> s4
*/
DELETE FROM `creature` where `id` IN (33933, 33916, 32355, 33932);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version */(NULL, 33933, 530, 0, 1, 0, 0, 3076.22, 3632.76, 143.781, 2.35717, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version, already in UDB 392 */(88319, 33932, 530, 1, 1, 0, 0, 3076.22, 3632.76, 143.781, 2.35717, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33916, 530, 0, 1, 0, 0, 3076.22, 3632.76, 143.781, 2.35717, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version */(NULL, 32355, 530, 0, 1, 0, 0, 3076.22, 3632.76, 143.781, 2.35717, 180, 0, 0, 6986, 0, 0, 0);
/* 2.4.2 version, we don't need this guy. (NULL, 26352, 530, 0, 1, 0, 0, 3076.22, 3632.76, 143.781, 2.35717, 180, 0, 0, 6986, 0, 0, 0),*/


/*          Leeni "Smiley" Small

    Arena set and weapon vendor in Area52: Sells set items of second last season.

    3.3.2 -> s6
    3.2.0 -> s5
    3.1.1 -> "lower s5" (Hateful Gladiator)
    3.0.2 -> "even lower s5" :-P (Savage Gladiator)
    2.3.0 -> s3
*/
DELETE FROM `creature` where `id` IN (33941, 33919, 32354, 33930);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version */(NULL, 33941, 530, 0, 1, 0, 0, 3070.05, 3632.7, 143.781, 1.42907, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version, already in UDB 392 */(88320, 33930, 530, 1, 1, 0, 0, 3070.05, 3632.7, 143.781, 1.42907, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33919, 530, 0, 1, 0, 0, 3070.05, 3632.7, 143.781, 1.42907, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version */(NULL, 32354, 530, 0, 1, 0, 0, 3070.05, 3632.7, 143.781, 1.42907, 180, 0, 0, 6986, 0, 0, 0);
/* 2.3.0 version, we don't need this guy. (NULL, 24392, 530, 0, 1, 0, 0, 3070.05, 3632.7, 143.781, 1.42907, 180, 0, 0, 6986, 0, 0, 0);*/


/*          Argex Irongut

    Arena set and weapon vendor in Gadgetzan: Sells set items of current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    3.0.2 -> s5, and another version as non-vendor
*/
DELETE FROM `creature` where `id` IN (33924, 33915, 32359, 33939);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* Future patch!? We don't need him. (NULL, 40215, 1, 0, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0),*/
/* 3.3.2 version, already in UDB 392 */(90187, 33939, 1, 1, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version */(NULL, 33924, 1, 0, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33915, 1, 0, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version, non vendor, we don't need this guy. (NULL, 32407, 1, 0, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0),*/
/* 3.0.2 version */(NULL, 32359, 1, 0, 1, 27953, 0, -7123.33, -3766.68, 9.40339, 0, 180, 0, 0, 6986, 0, 0, 0);


/*          Evee Copperspring

    Arena set and weapon vendor in Gadgetzan: Sells set items of last season.

    3.3.2 -> s7
    3.2.0 -> s6
    3.1.1 -> s5
    3.0.2 -> "lower s5" (Hateful Gladiator)
    2.4.2 -> s4
    2.3.0 -> s3
*/
DELETE FROM `creature` where `id` IN (33928, 33920, 32362, 33935);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* Future patch!? We don't need him. (NULL, 40214, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),*/
/* 3.3.2 version, already in UDB 392 */(90186, 33935, 1, 1, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version */(NULL, 33928, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33920, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version */(NULL, 32362, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0);
/* 2.4.2 version, we don't need this guy. (NULL, 26378, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),*/
/* 2.3.0 version, we don't need this guy. (NULL, 25177, 1, 0, 1, 22438, 0, -7122.35, -3770.56, 9.35682, 0, 180, 0, 0, 6986, 0, 0, 0),*/


/*          Ecton Brasstumbler

    Arena set and weapon vendor in Gadgetzan: Sells set items of second last season.

    3.3.2 -> s6
    3.2.0 -> s5
    3.1.1 -> "lower s5" (Hateful Gladiator)
    3.0.2 -> "even lower s5" :-P (Savage Gladiator)
    2.3.0 -> s3
*/
DELETE FROM `creature` where `id` IN (33929, 33917, 32360, 33934);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* Future patch!? We don't need him. (NULL, 40214, 1, 0, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0),*/
/* 3.3.2 version, already in UDB 392 */(90185, 33934, 1, 1, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0),
/* 3.2.0 version */(NULL, 33929, 1, 0, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0),
/* 3.1.1 version */(NULL, 33917, 1, 0, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0),
/* 3.0.2 version */(NULL, 32360, 1, 0, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0);
/* 2.3.0 version, we don't need this guy. (NULL, 25178, 1, 0, 1, 22399, 0, -7120.75, -3774.16, 9.0363, 0.767945, 180, 0, 0, 6986, 0, 0, 0);*/


/*          Knight-Lieutenant Moonstrike

    Arena set vendor in Stormwind: Sells set items of the second last season.

    3.3.2 -> s6
    3.2.0 -> s5
    3.1.1 -> "lower s5" (Hateful Gladiator)
    3.0.3 -> "even lower s5" :-P (Savage Gladiator)
*/
DELETE FROM `creature` where `id` IN (34083, 34082, 32834, 34084);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(88804, 34084, 0, 1, 1, 28301, 0, -8775.79, 423.707, 105.316, 5.21853, 180, 0, 0, 21270, 0, 0, 0),
/* 3.2.0 version */(NULL, 34083, 0, 0, 1, 28301, 0, -8775.79, 423.707, 105.316, 5.21853, 180, 0, 0, 21270, 0, 0, 0),
/* 3.1.1 version */(NULL, 34082, 0, 0, 1, 28301, 0, -8775.79, 423.707, 105.316, 5.21853, 180, 0, 0, 21270, 0, 0, 0),
/* 3.0.3 version */(NULL, 32834, 0, 0, 1, 28301, 0, -8775.79, 423.707, 105.316, 5.21853, 180, 0, 0, 21270, 0, 0, 0);


/*          Blood Guard Zar'shie

    Arena set vendor in Ogrimmar: Sells set items of the second last season.

    3.3.2 -> s6
    3.2.0 -> s5
    3.1.1 -> "lower s5" (Hateful Gladiator)
    3.0.3 -> "even lower s5" :-P (Savage Gladiator)
*/
DELETE FROM `creature` where `id` IN (34062, 34061, 32832, 34063);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(104095, 34063, 1, 1, 1, 28300, 0, 1670.9, -4199.57, 56.466, 3.82227, 180, 0, 0, 11828, 0, 0, 0),
/* 3.2.0 version */(NULL, 34062, 1, 0, 1, 28300, 0, 1670.9, -4199.57, 56.466, 3.82227, 180, 0, 0, 11828, 0, 0, 0),
/* 3.1.1 version */(NULL, 34061, 1, 0, 1, 28300, 0, 1670.9, -4199.57, 56.466, 3.82227, 180, 0, 0, 11828, 0, 0, 0),
/* 3.0.2 version */(NULL, 32832, 1, 0, 1, 28300, 0, 1670.9, -4199.57, 56.466, 3.82227, 180, 0, 0, 11828, 0, 0, 0);


/*          Lieutenant Tristia

    Arena offset vendor (waist, wrist, trinkets, etc.) in Stormwind: Sells set items of the current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    3.0.2 -> s5
*/
DELETE FROM `creature` where `id` IN (34077, 34076, 32380, 34078);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(88799, 34078, 0, 1, 1, 21512, 0, -8772.83, 426.068, 105.316, 4.57276, 180, 0, 0, 21270, 0, 0, 0),
/* 3.2.0 version */(NULL, 34077, 0, 0, 1, 21512, 0, -8772.83, 426.068, 105.316, 4.57276, 180, 0, 0, 21270, 0, 0, 0),
/* 3.1.1 version */(NULL, 34076, 0, 0, 1, 21512, 0, -8772.83, 426.068, 105.316, 4.57276, 180, 0, 0, 21270, 0, 0, 0),
/* 3.0.2 version */(NULL, 32380, 0, 0, 1, 21512, 0, -8772.83, 426.068, 105.316, 4.57276, 180, 0, 0, 21270, 0, 0, 0);


/*          Captain Dirgehammer

    Arena offset vendor (waist, wrist, trinkets, etc.) in Stormwind: Sells set items of the last season.

    3.3.2 -> s7
    3.2.0 -> s6
    3.1.1 -> s5
    3.0.2 -> "lower s5" (Hateful Gladiator)
*/
DELETE FROM `creature` where `id` IN (34074, 34073, 32381, 34075);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(88797, 34075, 0, 1, 1, 12917, 0, -8781.05, 419.582, 105.316, 6.02139, 180, 0, 0, 11828, 0, 0, 0),
/* 3.2.0 version */(NULL, 34074, 0, 0, 1, 12917, 0, -8781.05, 419.582, 105.316, 6.02139, 180, 0, 0, 11828, 0, 0, 0),
/* 3.1.1 version */(NULL, 34073, 0, 0, 1, 12917, 0, -8781.05, 419.582, 105.316, 6.02139, 180, 0, 0, 11828, 0, 0, 0),
/* 3.0.2 version */(NULL, 32381, 0, 0, 1, 12917, 0, -8781.05, 419.582, 105.316, 6.02139, 180, 0, 0, 11828, 0, 0, 0);


/*          Doris Volanthius

    Arena offset vendor (waist, wrist, trinkets, etc.) in Ogrimmar: Sells set items of the current season.

    3.3.2 -> s8
    3.2.0 -> s7
    3.1.1 -> s6
    3.0.2 -> s5
*/
DELETE FROM `creature` where `id` IN (34059, 34058, 32385, 34060);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(104055, 34060, 1, 1, 1, 22602, 0, 1672.85, -4202.31, 56.4653, 3.54302, 180, 0, 0, 9780, 14392, 0, 0),
/* 3.2.0 version */(NULL, 34059, 1, 0, 1, 22602, 0, 1672.85, -4202.31, 56.4653, 3.54302, 180, 0, 0, 9780, 14392, 0, 0),
/* 3.1.1 version */(NULL, 34058, 1, 0, 1, 22602, 0, 1672.85, -4202.31, 56.4653, 3.54302, 180, 0, 0, 9780, 14392, 0, 0),
/* 3.0.2 version */(NULL, 32385, 1, 0, 1, 22602, 0, 1672.85, -4202.31, 56.4653, 3.54302, 180, 0, 0, 9780, 14392, 0, 0);


/*          Sergeant Thunderhorn

    Arena offset vendor (waist, wrist, trinkets, etc.) in Stormwind: Sells set items of the last season.

    3.3.2 -> s7
    3.2.0 -> s6
    3.1.1 -> s5
    3.0.2 -> "lower s5" (Hateful Gladiator)
*/
DELETE FROM `creature` where `id` IN (34037, 34036, 32383, 34038);
INSERT INTO `creature` (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
/* 3.3.2 version, already in UDB 392 */(104896, 34038, 1, 1, 1, 14612, 0, 1667.87, -4196.97, 56.4671, 4.31096, 180, 0, 0, 11828, 0, 0, 0),
/* 3.2.0 version */(NULL, 34037, 1, 0, 1, 14612, 0, 1667.87, -4196.97, 56.4671, 4.31096, 180, 0, 0, 11828, 0, 0, 0),
/* 3.1.1 version */(NULL, 34036, 1, 0, 1, 14612, 0, 1667.87, -4196.97, 56.4671, 4.31096, 180, 0, 0, 11828, 0, 0, 0),
/* 3.0.2 version */(NULL, 32383, 1, 0, 1, 14612, 0, 1667.87, -4196.97, 56.4671, 4.31096, 180, 0, 0, 11828, 0, 0, 0);
