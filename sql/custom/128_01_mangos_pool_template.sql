# update herb pools, setting limit to ~50% of herb max count for testserver
UPDATE `pool_template` SET `max_limit` = 30 WHERE `entry` IN (979,948,947);

UPDATE `pool_template` SET `max_limit` = 50 WHERE `entry` IN (997,991,987,986,984,971,969);

UPDATE `pool_template` SET `max_limit` = 75 WHERE `entry` IN (999,998,993,985,983,982,981,980,978,976,974,973,970,963,962,957,955,953);

UPDATE `pool_template` SET `max_limit` = 100 WHERE `entry` IN (989,956,954,952,950);

UPDATE `pool_template` SET `max_limit` = 150 WHERE `entry` IN (995,992,977,975,972,967,966,965,964,958,951,949);

UPDATE `pool_template` SET `max_limit` = 200 WHERE `entry` IN (996,994,968,961,960);

UPDATE `pool_template` SET `max_limit` = 250 WHERE `entry` IN (990,959);

UPDATE `pool_template` SET `max_limit` = 350 WHERE `entry` IN (988);

# lookup herb pools with
# SELECT * FROM pool_template WHERE description LIKE "%MASTER Herbs%";
# lookup pool entrys with
# SELECT * FROM pool_gameobject WHERE pool_entry = xyz;