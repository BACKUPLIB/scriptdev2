/* The Eye itself */
UPDATE creature_template SET ScriptName = "npc_eye_of_acherus", InhabitType = 3, minlevel = 55, maxlevel = 55, armor = 9730 WHERE entry = 28511;
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `vehicle_id`, `passengers`, `auras`) VALUES
('28511','0','0','0','0',0x2000,'0',NULL,'51890 0 51890 1 51890 2');

/* Dummy target NPC's*/
UPDATE creature_template SET modelid_1 = 16925, modelid_3 = 16925, scale = 2, ScriptName = "npc_death_comes_from_on_high_dummy_targetsAI" WHERE entry IN (28525,28542,28543,28544);
REPLACE INTO creature_template_addon (`entry`,`moveflags`,`auras`) VALUES
(28525,0,'64328 0'),
(28542,0,'64328 0'),
(28543,0,'64328 0'),
(28544,0,'64328 0');
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28511,28525,28542,28543,28544));


/* All harmful npc's and GO's */
UPDATE creature SET phaseMask = 2 WHERE guid IN
(128627,128628,128629,128630,128631,128632,128633,128634,128635,128636,128637,128643,128644,128645,128646,
128647,128648,128649,128650,128651,128652,128653,128654,128655,128656,128657,128658,128659,128660,128661,
128662,128663,128664,128665,128666,128667,128668,128669,128670,128671,128672,128673,128674,128675,128676,
128677,128678,128679,128680,128681,128682,128683,128684,128685,128687,128688,128689,128690,128691,128692,
128693,128694,128695,128696,128698,128699,128700,128701,128702,128705,128706,128707,128708,128709,128710,
128711,128712,128713,128714,128715,128716,128717,128718,128719,128720,128721,128722,128723,128724,128725,
128726,128727,128728,128729,128730,128731,128732,128733,128734,128735,128736,128737,128752,128796,128797,
128798,128799,128800,128801,128802,128958,129165,129168,129169,129170,129171,129474,129475,129476,129477,
129478,129479,129483,129484,129485,129486,129487,129488,129489,129490,129491);
UPDATE creature SET phaseMask = (phaseMask | 2) WHERE guid IN
(65961,65962,65963,65964,65965,65966);

/*Lich King*/
UPDATE creature SET phaseMask = (phaseMask | 2) WHERE guid = 128738;