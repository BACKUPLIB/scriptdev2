-- general trainer fixxes

-- Frostweave Bandage & heavy netherweave bandage skillfix
-- mantis bug #0003231
UPDATE `npc_trainer` SET `reqskillvalue` = 330 WHERE `spell` = 27033;
UPDATE `npc_trainer` SET `reqskillvalue` = 350 WHERE `spell` = 45545;
