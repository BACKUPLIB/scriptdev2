-- duskwood fixes

# fix quest 1043
UPDATE gameobject_template SET flags = 32 WHERE entry = 19030;
