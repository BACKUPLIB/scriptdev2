-- instance gruuls lair fixes

-- update gameobject 184468 (removes autoclose at the door after maulgar)
UPDATE gameobject_template SET data2=0 WHERE entry=184468;
