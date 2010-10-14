# sunwell plateau scriptdev2 db update

# boss_felmyst
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1930007 AND -1930000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1930000,"Glory to Kil\'jaeden! Death to all who oppose!",0,1,0,7,"felmyst YELL_AGGRO"),
(-1930001,"I am stronger than ever before!",0,1,0,7,"felmyst YELL_TAKEOFF"),
(-1930002,"Choke on your final breath!",0,1,0,7,"felmyst YELL_BREATH"),
(-1930003,"I kill for the master!",0,1,0,7,"felmyst YELL_SLAY1"),
(-1930004,"The end has come!",0,1,0,7,"elmyst YELL_SLAY2"),
(-1930005,"Kil\'jaeden... will... prevail...",0,1,0,7,"felmyst YELL_DEATH"),
(-1930006,"No more hesitation! Your fates are written!",0,1,0,7,"felmyst YELL_BERSERK"),
(-1930007,"Madrigosa deserved a far better fate. You did what had to be done, but this battle is far from over.",0,1,0,7,"felmyst YELL_OUTRO (kalecgos)");

# boss_eredar_twins
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1940019 AND -1940000;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc3`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1940000,"Misery...","Elend...",0,1,0,7,"YELL_SACROLASH_AGGRO_1"),
(-1940001,"Confusion...","Verwirrung...",0,1,0,7,"YELL_SACROLASH_AGGRO_2"),
(-1940002,"Mistrust...","Misstrauen...",0,1,0,7,"YELL_SACROLASH_AGGRO_3"),
(-1940003,"These are the hallmarks...","Dies sind die Kennzeichen...",0,1,0,7,"YELL_SACROLASH_AGGRO_4"),
(-1940004,"Depravity...","Leid...",0,1,0,7,"YELL_ALYTHESS_AGGRO_1"),
(-1940005,"Hatred...","Hass...",0,1,0,7,"YELL_ALYTHESS_AGGRO_2"),
(-1940006,"Chaos...","Chaos...",0,1,0,7,"YELL_ALYTHESS_AGGRO_3"),
(-1940007,"These are the pillars...","Dies sind die Säulen...",0,1,0,7,"YELL_ALYTHESS_AGGRO_4"),
(-1940008,"I... fade.",NULL,0,1,0,7,"YELL_SACROLASH_DEATH"),
(-1940009,"Alythess! Your fire burns within me!",NULL,0,1,0,7,"YELL_SACROLASH_EMPOWER"),
(-1940010,"Shadow to the aid of fire!","Schatten dem Feuer zu Hilfe!",0,1,0,7,"YELL_SACROLASH_NOVA"),
(-1940011,"Time is a luxury you no longer possess!",NULL,0,1,0,7,"YELL_SACROLASH_BERSERK"),
(-1940012,"Shadows, engulf!",NULL,0,1,0,7,"YELL_SACROLASH_KILL_1"),
(-1940013,"Ee-nok Kryul!","Ee-nok Kryul!",0,1,0,7,"YELL_SACROLASH_KILL_2"),
(-1940014,"Fire to the aid of shadow!","Feuer dem Schatten zu Hilfe!",0,1,0,7,"YELL_ALYTHESS_CONFLAGRATE"),
(-1940015,"Sacrolash!","Sacrolash!",0,1,0,7,"YELL_ALYTHESS_EMPOWER"),
(-1940016,"Fire, consume!",NULL,0,1,0,7,"YELL_ALYTHESS_KILL_1"),
(-1940017,"Ed-ir Halach!","Ed-ir Halach!",0,1,0,7,"YELL_ALYTHESS_KILL_2"),
(-1940018,"Your luck has run its course!","Euer Glück ist verbraucht!spell_scripts",0,1,0,7,"YELL_ALYTHESS_BERSERK"),
(-1940019,"Der\'ek manul!","Der\'ek manul!",0,1,0,7,"YELL_ALYTHESS_DEATH");