-- cleanup mangos server-start-warnings by Alphawolf

-- Fix for errors in item_template
UPDATE `item_template` SET  `BuyCount` = '1',`SellPrice` = '120000' WHERE `entry` =49050; 
UPDATE `item_template` SET `Material` = '4' WHERE `entry` =49362;
UPDATE `item_template` SET `displayid` = '58830' WHERE `entry` =50045;
UPDATE `item_template` SET `displayid` = '36488',`Material` = '4' WHERE `entry` =50166;



-- Fix for errors in creature
UPDATE `creature` SET `MovementType` = '0' WHERE `guid` =300039;
UPDATE `creature` SET `spawndist` = '0' WHERE `guid` =300040;
UPDATE `creature` SET `curhealth` = '80300' WHERE `guid` =700035;
UPDATE `creature` SET `curhealth` = '2614', `spawndist` = '0' WHERE `guid` =900051;
UPDATE `creature` SET `spawndist` = '0', `curhealth` = '4050' WHERE `guid` =900052;
UPDATE `creature` SET `curhealth` = '13522' WHERE `guid` =300000;
UPDATE `creature` SET `curhealth` = '13522' WHERE `guid` =300001;
UPDATE `creature` SET `curhealth` = '32400' WHERE `guid` =934473;
UPDATE `creature` SET `equipment_id` = '0' WHERE `equipment_id` = '100001';
UPDATE `creature` SET `equipment_id` = '0' WHERE `equipment_id` = '100003';
UPDATE `creature` SET `spawndist` = '0',`curhealth` = '275000',`curmana` = '3640' WHERE `guid` =700031;
UPDATE `creature` SET `curhealth` = '3524', `spawndist` = '0' WHERE `guid` =900050;
UPDATE `creature` SET `curhealth` = '13522' WHERE `guid` =300002;
UPDATE `creature` SET `curhealth` = '10818' WHERE `guid` =300003;
UPDATE `creature` SET `curhealth` = '10818' WHERE `guid` =300004;
UPDATE `creature` SET `curhealth` = '10818' WHERE `guid` =300005;
UPDATE `creature` SET `curhealth` = '9144',`curmana` = '13525' WHERE `guid` =300006;
UPDATE `creature` SET `curhealth` = '9144',`curmana` = '13525' WHERE `guid` =300007;
UPDATE `creature` SET `curhealth` = '9144',`curmana` = '13525' WHERE `guid` =300008;
UPDATE `creature` SET `curhealth` = '10985' WHERE `guid` =300009;
UPDATE `creature` SET `curhealth` = '10985' WHERE `guid` =300010;
UPDATE `creature` SET `curhealth` = '10985' WHERE `guid` =300011;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300018;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300019;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300020;
UPDATE `creature` SET `curhealth` = '10466',`curmana` = '5982' WHERE `guid` =300021;
UPDATE `creature` SET `curhealth` = '10466',`curmana` = '5982' WHERE `guid` =300022;
UPDATE `creature` SET `curhealth` = '10466',`curmana` = '5982' WHERE `guid` =300023;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300024;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300025;
UPDATE `creature` SET `curhealth` = '11828' WHERE `guid` =300026;
UPDATE `creature` SET `curmana` = '8973' WHERE `guid` =300030;
UPDATE `creature` SET `curmana` = '8973' WHERE `guid` =300031;
UPDATE `creature` SET `curmana` = '8973' WHERE `guid` =300032;
UPDATE `creature` SET `spawndist` = '0' WHERE `guid` =966399;
UPDATE `creature` SET `curmana` = '3643' WHERE `guid` =700031;
UPDATE `creature` SET `spawndist` = '0' WHERE `guid` =966424;



-- Fix for errors in creature_Template
UPDATE `creature_template` SET `minlevel` = '70',`maxlevel` = '70',`minhealth` = '4050',`maxhealth` = '4050' WHERE `entry` =28329;
UPDATE `creature_template` SET `minhealth` = '224018',`maxhealth` = '224018' WHERE `entry` =21601;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =21599;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =21600;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =25552;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =31344;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =31362;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =31360;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =31349;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` =31474;


-- Fix for gameobject errors
DELETE FROM `pool_gameobject` WHERE `guid` = 200075;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('200075', '30005', '0', 'The Schools of Arcane Magic - Divination');


-- Fix for Quest errors
UPDATE `quest_template` SET `ReqItemCount1` = '1' WHERE `entry` =12698;
UPDATE `quest_template` SET `ReqItemCount1` = '1' WHERE `entry` =12720;