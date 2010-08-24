/* Hack to prevent autohit dmg */
UPDATE creature_template SET baseattacktime=100000, dmg_multiplier=0.1, mindmg=1, maxdmg=1, unit_flags=33554434 WHERE entry IN (28926, 31867);