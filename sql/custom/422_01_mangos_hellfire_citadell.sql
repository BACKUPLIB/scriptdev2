-- instance hellfire citadell fixes

-- update npc 17307 (Vazruden the Herald - remove unitflag passive)
UPDATE creature_template SET unit_flags=64 WHERE entry=17307;
