# sunwell plateau scriptdev2 db update

# boss_felmyst
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1930007 AND -1930000;
INSERT INTO `script_texts` VALUES(-1930000,"Glory to Kil'jaeden! Death to all who oppose!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_AGGRO");
INSERT INTO `script_texts` VALUES(-1930001,"I am stronger than ever before!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_TAKEOFF");
INSERT INTO `script_texts` VALUES(-1930002,"Choke on your final breath!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_BREATH");
INSERT INTO `script_texts` VALUES(-1930003,"I kill for the master!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_SLAY1");
INSERT INTO `script_texts` VALUES(-1930004,"The end has come!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_SLAY2");
INSERT INTO `script_texts` VALUES(-1930005,"Kil'jaeden... will... prevail...",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_DEATH");
INSERT INTO `script_texts` VALUES(-1930006,"No more hesitation! Your fates are written!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_BERSERK");
INSERT INTO `script_texts` VALUES(-1930007,"Madrigosa deserved a far better fate. You did what had to be done, but this battle is far from over.",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"felmyst YELL_OUTRO (kalecgos)");

# boss_eredar_twins
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1940019 AND -1940000;
INSERT INTO `script_texts` VALUES(-1940000,"Misery...",NULL,NULL,"Elend...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_AGGRO_1");
INSERT INTO `script_texts` VALUES(-1940001,"Confusion...",NULL,NULL,"Verwirrung...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_AGGRO_2");
INSERT INTO `script_texts` VALUES(-1940002,"Mistrust...",NULL,NULL,"Misstrauen...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_AGGRO_3");
INSERT INTO `script_texts` VALUES(-1940003,"These are the hallmarks...",NULL,NULL,"Dies sind die Kennzeichen...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_AGGRO_4");
INSERT INTO `script_texts` VALUES(-1940004,"Depravity...",NULL,NULL,"Leid...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_AGGRO_1");
INSERT INTO `script_texts` VALUES(-1940005,"Hatred...",NULL,NULL,"Hass...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_AGGRO_2");
INSERT INTO `script_texts` VALUES(-1940006,"Chaos...",NULL,NULL,"Chaos...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_AGGRO_3");
INSERT INTO `script_texts` VALUES(-1940007,"These are the pillars...",NULL,NULL,"Dies sind die Säulen...",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_AGGRO_4");
INSERT INTO `script_texts` VALUES(-1940008,"I... fade.",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_DEATH");
INSERT INTO `script_texts` VALUES(-1940009,"Alythess! Your fire burns within me!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_EMPOWER");
INSERT INTO `script_texts` VALUES(-1940010,"Shadow to the aid of fire!",NULL,NULL,"Schatten dem Feuer zu Hilfe!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_NOVA");
INSERT INTO `script_texts` VALUES(-1940011,"Time is a luxury you no longer possess!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_BERSERK");
INSERT INTO `script_texts` VALUES(-1940012,"Shadows, engulf!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_KILL_1");
INSERT INTO `script_texts` VALUES(-1940013,"Ee-nok Kryul!",NULL,NULL,"Ee-nok Kryul!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_SACROLASH_KILL_2");
INSERT INTO `script_texts` VALUES(-1940014,"Fire to the aid of shadow!",NULL,NULL,"Feuer dem Schatten zu Hilfe!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_CONFLAGRATE");
INSERT INTO `script_texts` VALUES(-1940015,"Sacrolash!",NULL,NULL,"Sacrolash!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_EMPOWER");
INSERT INTO `script_texts` VALUES(-1940016,"Fire, consume!",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_KILL_1");
INSERT INTO `script_texts` VALUES(-1940017,"Ed-ir Halach!",NULL,NULL,"Ed-ir Halach!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_KILL_2");
INSERT INTO `script_texts` VALUES(-1940018,"Your luck has run its course!",NULL,NULL,"Euer Glück ist verbraucht!spell_scripts",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_BERSERK");
INSERT INTO `script_texts` VALUES(-1940019,"Der'ek manul!",NULL,NULL,"Der'ek manul!",NULL,NULL,NULL,NULL,NULL,0,1,0,7,"YELL_ALYTHESS_DEATH");