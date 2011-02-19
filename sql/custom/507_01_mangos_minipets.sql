-- fix HP for minipets so they do not appear dead
update `creature_template` set minhealth = 64, maxhealth = 64 WHERE type = 12 and (minhealth = 0 or maxhealth = 0);