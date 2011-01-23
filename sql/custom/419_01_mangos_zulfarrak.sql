-- instance Zul Farrak fixes

-- fix npc 7271 Witch Doctor Zum'rah
UPDATE `creature_ai_scripts` SET `event_param1` = '1', `event_param2` = '5' WHERE `creature_id` = '7271' AND `event_type` = '10';
