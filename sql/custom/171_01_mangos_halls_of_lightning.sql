/* Hack to prevent autohit dmg */
UPDATE creature_template SET baseattacktime=100000, dmg_multiplier=0.1, mindmg=1, maxdmg=1, unit_flags=33554434 WHERE entry IN (28926, 31867);

-- mechanic immune masks
UPDATE creature_template SET mechanic_immune_mask = '617299803' WHERE entry IN(28586,28587,28546,28923,31533,31536,31537,31538);
