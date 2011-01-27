-- instance Ahn'kahet fixes

-- texts for boss herals volazj
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1619044 AND -1619033;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`, `emote`,`language`,`comment`) VALUES 
(-1619033, 'Shgla\'yos plahf mh\'naus.', 14043, 1, 0, 0, 'volazj SAY_AGGRO'),
(-1619034, 'Gul\'kafh an\'shel. Yoq\'al shn ky ywaq nuul.', 14044, 1, 0, 0, 'volazj SAY_INSANITY'),
(-1619035, 'Ywaq puul skshgn: on\'ma yeh\'glu zuq.', 14045, 1, 0, 0, 'volazj SAY_SLAY_1'),
(-1619036, 'Ywaq ma phgwa\'cul hnakf.', 14046, 1, 0, 0, 'volazj SAY_SLAY_2'),
(-1619037, 'Ywaq maq oou; ywaq maq ssaggh. Ywaq ma shg\'fhn.', 14047, 1, 0, 0, 'volazj SAY_SLAY_3'),
(-1619038, 'Iilth vwah, uhn\'agth fhssh za.', 14048, 1, 0, 0, 'volazj SAY_DEATH_1'),
(-1619039, 'Where one falls, many shall take its place.', 14049, 1, 0, 0, 'volazj SAY_DEATH_2');
