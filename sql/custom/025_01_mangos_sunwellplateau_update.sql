# remove felmyst and kalecgos_humanoid from creature, they are summoned by sd2 script now
DELETE FROM `creature` WHERE `guid` IN (700000,600000);