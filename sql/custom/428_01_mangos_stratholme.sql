-- instance stratholme fixes

-- fix gameobject 175967 (the Bastion Door)
UPDATE `gameobject_template` SET `data1` = '299', `data2` = '10000' WHERE `entry` =175967;
