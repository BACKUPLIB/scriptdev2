-- player
UPDATE `command` SET `security` = 0 WHERE `name` IN ('gm ingame','commands','account','server info','start','help','account lock','server motd');
-- trial
UPDATE `command` SET `security` = 1 WHERE `name` IN ('lookup tele','tele name','recall','showarea','hidearea','gm fly','go creature','go','gps','hover','go zonexy',
'lookup spell','lookup skill','lookup quest','lookup object','lookup itemset','lookup item','lookup creature','modify aspeed','modify bwalk','modify energy','modify hp',
'modify mana','modify rage','modify scale','modify swim','goname','pinfo','go xyz','gm','save','saveall','go grid','gm visible','unaura','whispers','go xyz','send mail',
'send message','go graveyard','npc info','lookup area','tele','modify morph','gobject target','lookup event','combatstop','lookup account ip','lookup account email',
'gm chat','gm list','modify speed','waterwalk','go taxinode','lookup title','npc say','npc yell','list talents','lookup account name','lookup player account',
'lookup player email','lookup player ip','go object','go trigger','lookup achievement','gm setview','lookup pool','pool list','pool spawns','pool','ircpm');
-- gm,mod,pr
UPDATE `command` SET `security` = 2 WHERE `name` IN ('npc whisper','bank','distance','npc delete','npc add','guid','kick','npc setmodel','npc subname','reset honor',
'ban character','modify mount','gobject add','gobject delete','ban ip','guild uninvite','baninfo ip','neargrave','npc name','npc playemote','npc move','cast back',
'banlist character','banlist account','respawn','modify standstate','npc setphase','wchange','honor add','auction','quest remove','send money','baninfo account',
'modify drunk','list creature','honor update','list object','list item','modify rep','modify honor','lookup faction','npc delitem','reset specs','tele group',
'tele add','tele del','baninfo character','event','event start','event stop','instance unbind','instance listbinds','instance stats','modify money','account set addon',
'account characters','ban account','banlist ip','repairitems','npc unfollow','npc follow','npc tame','account friend add','modify gender','send items','npc additem',
'character reputation','modify runicpower','modify phase','gobject near','npc setdeathstate','reset stats','reset all','unban account','explorecheat','levelup',
'unban character','unban ip','npc textemote','mute','unmute','guild delete','quit','die','quest add','delticket','demorph','dismount','account password','maxskill'
'character deleted list','stable','auction alliance','auction horde', 'auction goblin','send mass items','send mass mail','send mass money','account friend delete',
'account friend list','additem','additemset','ticket','learn','cast','setskill','notify','learn _all','learn all_crafts','learn all_gm','learn all_lang','learn all_myclass',
'learn all_myspells','learn all_mytalents','guild invite','groupgo','learn all_default','damage','quest complete','cast self','cast target','cast dist','learn all_recipes',
'reset spells','reset level','server set motd','character titles','learn all_mypettalents','namego','titles add','titles remove','titles current','titles setmask'
'guild create','guild rank','modify faction','modify arena','modify runicpower','modify phase','gobject setphase','announce','aura','cooldown','revive','taxicheat',
'modify fly','reset talents','character achievements','gobject setstate');
-- dev
UPDATE `command` SET `security` = 3 WHERE `name` IN ('npc factionid','npc changelevel','npc add weapon','honor addkill','itemmove','linkgrave','gobject move',
'debug getitemvalue','debug moditemvalue','npc addmove','npc allowmove','debug getvalue','debug anim','debug play cinematic','debug play movie','reload all',
'reload all_spell','reload all_area','reload all_loot','reload all_quest','debug play sound','npc spawndist','npc spawntime','npc setmovetype','gobject turn',
'movegens','reload all_locales','server corpses','achievement','achievement add','achievement remove','reset achievements','achievement criteria add',
'achievement criteria remove','npc flag','npc addweapon','trigger active','wp add','wp modify','wp show','instance savedata','reload config','reload all_achievemtn',
'reload all_eventai','reload all_item','reload all_npc','reload all_scripts','trigger','trigger near','debug modvalue','debug setitemvalue','debug setvalue',
'debug spellmods','debug spellcoefs');
-- admin
UPDATE `command` SET `security` = 4 WHERE `name` IN ('server idleshutdown cancel','server idleshutdown','loadscripts','flusharenapoints','account onlinelist',
'server restart','server restart cancel','server shutdown','server shutdown cancel','debug arena','debug bg','character customize','character rename','character level',
'modify tp','server idlerestart','server idlerestart cancel','character deleted old','character deleted delete','character deleted restore','account create','account delete',
'server log filter','account set gmlevel','character erase','account set password','server log level');
-- console
UPDATE `command` SET `security` = 5 WHERE `name` IN ('server exit','server plimit','wp import','wp export','pdump load','pdump write');
