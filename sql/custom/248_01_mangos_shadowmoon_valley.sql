-- shadowmoon valley fixes

-- fix quest 10688 / NPC 21506 (timers not blizzlike!)
UPDATE `quest_template` SET `ReqSpellCast1` = 0 WHERE `entry` = 10688;
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 21506;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 21506;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
(2150601,21506,0,0,100,1,0,0,10000,15000,11,38750,0,0,"Azaloth - Cast War Stomp"),
(2150602,21506,0,0,100,1,2000,5000,3000,8000,11,40504,1,0,"Azaloth - Cast Cleave"),
(2150603,21506,0,0,100,1,1000,1000,20000,30000,11,11443,1,0,"Azaloth - Cast Cripple"),
(2150604,21506,0,0,100,1,20000,30000,20000,30000,11,38741,1,1,"Azaloth - Cast Rain of Fire");