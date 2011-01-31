-- general reputation fixes

-- remove reward rate from faction kirin tor, The Wyrmrest Accord, Knights of the Ebon Blade, Argent Crusade, The Sons of Hodir
DELETE FROM `reputation_reward_rate` WHERE `faction` IN (1090,1091,1098,1106,1119);
