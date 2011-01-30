-- instance arkatraz fixes

-- Spawnt Game-Objekte im Heroischen Modus
UPDATE gameobject SET spawnMask=3 WHERE map=557;

-- Eredar_Deathbringer (not known if position change is right)
UPDATE `creature` SET `position_x` = 445.53, `position_y` = -23.19, `position_z` = 48.21, `orientation` = 1.5, `spawntimesecs` = 12620 WHERE `id` = 20880;

-- Arkatraz_Warder
UPDATE creature_template SET unit_flags=68 WHERE entry=20859;

-- Updates for some ohter fixes
UPDATE creature_template SET minhealth=28808, maxhealth=28808, ScriptName='boss_harbinger_skyriss_illusion', flags_extra=0, lootid=0, questitem1=0, unit_flags=524864 WHERE entry IN (21599, 21600);
UPDATE creature_template SET lootid=21599, questitem1=33861, minhealth=162000, maxhealth=162000 WHERE entry=21601;
UPDATE creature_template SET maxhealth=100000, minhealth=100000, flags_extra=2 WHERE entry IN (21620, 21101);
DELETE FROM creature_template_addon WHERE entry=20886;

-- Set Lootid for Eredar_Deathbringer in Heroic Mode
UPDATE creature_template SET lootid=20880 WHERE entry=21594;

-- Update Loot-ID's for Creatures in Heroic Mode
UPDATE creature_template SET lootid=20859 WHERE entry=21587;
UPDATE creature_template SET lootid=20857 WHERE entry=21585;
UPDATE creature_template SET lootid=20900 WHERE entry=21621;
UPDATE creature_template SET lootid=20865 WHERE entry=21607;
UPDATE creature_template SET lootid=20898 WHERE entry=21598;
UPDATE creature_template SET lootid=20864 WHERE entry=21608;
UPDATE creature_template SET lootid=20875 WHERE entry=21604;
UPDATE creature_template SET lootid=20873 WHERE entry=21605;
UPDATE creature_template SET lootid=20866 WHERE entry=21614;
UPDATE creature_template SET lootid=20867 WHERE entry=21591;
UPDATE creature_template SET lootid=20881 WHERE entry=21619;
UPDATE creature_template SET lootid=20883 WHERE entry=21615;
UPDATE creature_template SET lootid=20882 WHERE entry=21613;
UPDATE creature_template SET lootid=20896 WHERE entry=21596;
UPDATE creature_template SET lootid=21702 WHERE entry=22346;
UPDATE creature_template SET lootid=20897 WHERE entry=21597;
UPDATE creature_template SET lootid=20901 WHERE entry=21610;
UPDATE creature_template SET lootid=20902 WHERE entry=21611;
UPDATE creature_template SET lootid=20879 WHERE entry=21595;
UPDATE creature_template SET lootid=20869 WHERE entry=21586;
