
-- add new templates
DELETE FROM gameobject_template WHERE entry BETWEEN 300200 AND 300205;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`size`,`data1`) VALUES 
(300200,2,6404,'Candy Bucket',1,0), -- sanktum der sterne
(300201,2,6404,'Candy Bucket',1,0), -- allerias feste
(300202,2,6404,'Candy Bucket',1,0), -- ehrenfeste
(300203,2,6404,'Candy Bucket',1,0), -- shattrat seher
(300204,2,6404,'Candy Bucket',1,0), -- altar der shatar
(300205,2,6404,'Candy Bucket',1,0); -- der ewige hain


-- fix gameobject_template - gameobject relations
UPDATE `gameobject` SET `id` = 190074 WHERE `guid` = 37706; -- ewige Warte
UPDATE `gameobject` SET `id` = 190085 WHERE `guid` = 37721; -- splitterholzposten
UPDATE `gameobject` SET `id` = 190064 WHERE `guid` = 37715; -- hammerfall
UPDATE `gameobject` SET `id` = 190065 WHERE `guid` = 37716; -- tarrens mühle
UPDATE `gameobject` SET `id` = 190083 WHERE `guid` = 37719; -- camp taurajo
UPDATE `gameobject` SET `id` = 190082 WHERE `guid` = 37718; -- das wegekreuz
UPDATE `gameobject` SET `id` = 190067 WHERE `guid` = 39839; -- steinard
UPDATE `gameobject` SET `id` = 190087 WHERE `guid` = 37722; -- sonnenfels
UPDATE `gameobject` SET `id` = 190071 WHERE `guid` = 37694; -- orgrimmar
UPDATE `gameobject` SET `id` = 190070 WHERE `guid` = 37693; -- klingenhügel
UPDATE `gameobject` SET `id` = 190072 WHERE `guid` = 37700; -- dorf der bluthufe
UPDATE `gameobject` SET `id` = 190073 WHERE `guid` = 37701; -- donnerfels
UPDATE `gameobject` SET `id` = 190084 WHERE `guid` = 37720; -- freiwindposten
UPDATE `gameobject` SET `id` = 190075 WHERE `guid` = 37707; -- astranaar
UPDATE `gameobject` SET `id` = 190077 WHERE `guid` = 37709; -- theramore
UPDATE `gameobject` SET `id` = 190079 WHERE `guid` = 37711; -- mondfederfeste
UPDATE `gameobject` SET `id` = 190068 WHERE `guid` = 37675; -- dolanaar
UPDATE `gameobject` SET `id` = 190104 WHERE `guid` = 37677; -- azurwacht
UPDATE `gameobject` SET `id` = 190069 WHERE `guid` = 37676; -- auberdine
UPDATE `gameobject` SET `id` = 190078 WHERE `guid` = 37710; -- nijelspitze
UPDATE `gameobject` SET `id` = 190059 WHERE `guid` = 37705; -- thelsamar
UPDATE `gameobject` SET `id` = 190036 WHERE `guid` = 37674; -- sturmwind
UPDATE `gameobject` SET `id` = 190037 WHERE `guid` = 37691; -- menethil
UPDATE `gameobject` SET `id` = 190066 WHERE `guid` = 37717; -- beutebucht
UPDATE `gameobject` SET `id` = 190052 WHERE `guid` = 37703; -- dunkelhain
UPDATE `gameobject` SET `id` = 190057 WHERE `guid` = 37704; -- seenhain
UPDATE `gameobject` SET `id` = 300202 WHERE `guid` = 37682; -- ehrenfeste
UPDATE `gameobject` SET `id` = 191880 WHERE `guid` = 37678; -- telaar
UPDATE `gameobject` SET `id` = 300201 WHERE `guid` = 37679; -- allerias feste
UPDATE `gameobject` SET `id` = 190111 WHERE `guid` = 37681; -- wildhammerfeste
UPDATE `gameobject` SET `id` = 190042 WHERE `guid` = 37695; -- brill 
UPDATE `gameobject` SET `id` = 190097 WHERE `guid` = 37714; -- kargath
UPDATE `gameobject` SET `id` = 190102 WHERE `guid` = 37723; -- schattenflucht
UPDATE `gameobject` SET `id` = 190101 WHERE `guid` = 37730; -- thrallmar
UPDATE `gameobject` SET `id` = 190076 WHERE `guid` = 37708; -- ratschet
UPDATE `gameobject` SET `id` = 190043 WHERE `guid` = 37696; -- unterstadt
UPDATE `gameobject` SET `id` = 190080 WHERE `guid` = 37712; -- burg cenarius
UPDATE `gameobject` SET `id` = 300204 WHERE `guid` = 37680; -- altar der shatar
UPDATE `gameobject` SET `id` = 194066 WHERE `guid` = 37725; -- zabra'jin
UPDATE `gameobject` SET `id` = 194061 WHERE `guid` = 37728; -- schattenmond
UPDATE `gameobject` SET `id` = 194060 WHERE `guid` = 37731; -- flakenwacht
UPDATE `gameobject` SET `id` = 194057 WHERE `guid` = 37724; -- garadar
UPDATE `gameobject` SET `id` = 194077 WHERE `guid` = 37684; -- telredor
UPDATE `gameobject` SET `id` = 192018 WHERE `guid` = 37687; -- toshleys station
UPDATE `gameobject` SET `id` = 194056 WHERE `guid` = 37683; -- tempel von telhamat
UPDATE `gameobject` SET `id` = 190106 WHERE `guid` = 37698; -- silbermond basar
UPDATE `gameobject` SET `id` = 190088 WHERE `guid` = 37697; -- silbermond markt
UPDATE `gameobject` SET `id` = 190089 WHERE `guid` = 37699; -- falkenplatz
UPDATE `gameobject` SET `id` = 190115 WHERE `guid` = 37727; -- steinbrecherfeste
UPDATE `gameobject` SET `id` = 190098 WHERE `guid` = 37685; -- oreborzuflucht
UPDATE `gameobject` SET `id` = 300205 WHERE `guid` = 37688; -- der ewige hain
UPDATE `gameobject` SET `id` = 194079 WHERE `guid` = 37690; -- die sturmsäule
UPDATE `gameobject` SET `id` = 300203 WHERE `guid` = 37672; -- shatrat seher

-- add missing gameobjects
DELETE FROM `gameobject` WHERE `guid` BETWEEN 160015 AND 160027;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(160015,194069,1,1,1,-4585.93,-3162.18,34.31,180,100,1),-- Morastwinkel
(160016,194067,1,1,1,-3193.19,-2917.80,33.18,180,100,1),-- Brackenwall
(160017,194078,1,1,1,-4468.07,239.74,39.11,180,100,1),-- Camp Mojache
(160018,191879,1,1,1,2710.920898,1510.701050,238.11,180,100,1),-- Steinkrallengipfel
(160019,191878,0,1,1,-5603.77,-530.04,399.66,180,100,1),-- Kharanos
(160020,194063,0,1,1,397.416443,-2122.258301,131.563721,180,100,1),-- Nistgipfel
(160021,190096,0,1,1,-12433.700195,216.811005,2.623080,180,100,1),-- Basislager von Gromgol
(160022,190109,530,1,1,2400.004639,5947.408203,152.159256,180,100,1),-- Donnerfeste
(160023,190099,0,1,1,513.380371,1639.360742,125.943741,180,100,1),-- Silberwald Das Grabmal
(160024,190114,530,1,1,8702.386719,-6639.322266,72.744270,180,100,1),-- Morgenluft
(160025,190091,530,1,1,7557.041504,-6889.927734,96.026894,180,100,1),-- Tristessa
(160026,190090,0,1,1,-633.493469,-4572.566895,12.290501,180,100,1),-- Dorf der Bruchhauer
(160027,190103,530,1,1,-170.170868,5530.376953,29.408014,180,100,1);-- Zuflucht des Cenarius

-- delete unwanted GOs
DELETE FROM `gameobject_template` WHERE `entry` = 180412;

-- add questrelation
INSERT IGNORE INTO `gameobject_involvedrelation` (`id`,`quest`) VALUES 
(194069,12398), -- Morastwinkel
(190105,12399), -- Gadgetzan
(190074,12400), -- Ewige Warte
(190085,12377), -- Splitterholzposten 
(194066,12390), -- Zabra`jin
(194067,12383), -- Brackenwall
(194061,12395), -- Schattenmond 
(190064,12380), -- Hammerfall
(190065,12376), -- Tarrens Mühle 
(190083,12375), -- Camp Taurajo 
(190082,12374), -- Brachland das Wegekreuz
(194060,12389), -- Falkenwacht 
(194057,12392), -- Garadar 
(190067,12384), -- Steinard 
(190087,12378), -- Sonnenfels  
(190071,12366), -- Orgrimmar 
(190070,12361), -- Klingenhügel
(190100,12394), -- Dorf der Mok`Nathal 
(190072,12362), -- Dorf der Bluthufe 
(190073,12367), -- Donnerfels 
(190084,12379), -- Freiwindposten 
(190075,12345), -- Astranaar 
(190045,12341), -- Blutwacht 
(190038,12334), -- Darnassus 
(190077,12349), -- Theramore
(190079,12350), -- Mondfederfeste 
(190068,12331), -- Dolanaar
(190104,12333), -- Azurwacht 
(190069,12338), -- Auberdine 
(190078,12348), -- Nijelspitze 
(190041,12337), -- Naaru 
(191879,12347), -- Steinkrallengipfel
(191878,12332), -- Kharanos
(189303,12286), -- Goldhain
(194063,12351), -- Nistgipfel 
(190059,12339), -- Thelsamar 
(190036,12336), -- Sturmwind
(190037,12343), -- Menethil 
(190066,12397), -- Beutebucht 
(190052,12344), -- Dunkelhain
(190049,12346), -- Süderstade
(190039,12335), -- Eisenschmiede 
(190057,12342), -- Seenhain
(190047,12340), -- Späherkuppe
(190061,12358), -- Sylvanaar
(300202,12352), -- Ehrenfeste 
(191880,12357), -- Telaar 
(300201,12356), -- Allerias Feste 
(194077,12354), -- Telredor 
(192018,12359), -- Toshleys Station
(194056,12353), -- Tempel von Telhamat 
(190111,12360), -- Wildhammerfeste
(190042,12363), -- Brill 
(190106,12370), -- Silbermond Basar
(190088,12369), -- Silbermond Markt
(190089,12364), -- Falkenplatz
(190097,12385), -- Kargath 
(190102,12381), -- Schattenflucht
(190101,12388), -- Thrallmar
(190076,12396), -- Ratschet 
(190115,12391), -- Steinbrecherfeste
(190043,12368), -- Unterstadt
(190098,12355), -- Oreborzuflucht
(190096,12382), -- Basislager von Grom'gol
(190109,12393), -- Donnerfeste 
(190099,12371), -- Silberwald Grabmal
(190114,12365), -- morgenluft 
(190091,12373), -- Tristessa
(190090,12387), -- Dorf der bruchhauer
(194078,12386), -- Camp Mojache
(190080,12401), -- Burg Cenarius
(190108,12402), -- Kapelle des Hoffnungsvollen Lichts
(190103,12403), -- Zuflucht des Cenarius
(300205,12406), -- Der ewige Hain
(190113,12407), -- Area 52
(194079,12408), -- Sturmsäule
(190116,12409), -- Sanktum der Sterne (Sehergasthaus)
(300204,12409), -- Altar der Sha`tar(Aldorgasthaus)
(300203,12404), -- Shattrat(Seher)
(190110,12404); -- Shattrat II(Aldor)

INSERT IGNORE INTO `gameobject_questrelation` (`id`,`quest`) VALUES 
(194069,12398), -- Morastwinkel
(190105,12399), -- Gadgetzan
(190074,12400), -- Ewige Warte
(190085,12377), -- Splitterholzposten 
(194066,12390), -- Zabra`jin
(194067,12383), -- Brackenwall
(194061,12395), -- Schattenmond 
(190064,12380), -- Hammerfall
(190065,12376), -- Tarrens Mühle 
(190083,12375), -- Camp Taurajo 
(190082,12374), -- Brachland das Wegekreuz
(194060,12389), -- Falkenwacht 
(194057,12392), -- Garadar 
(190067,12384), -- Steinard 
(190087,12378), -- Sonnenfels  
(190071,12366), -- Orgrimmar 
(190070,12361), -- Klingenhügel
(190100,12394), -- Dorf der Mok`Nathal 
(190072,12362), -- Dorf der Bluthufe 
(190073,12367), -- Donnerfels 
(190084,12379), -- Freiwindposten 
(190075,12345), -- Astranaar 
(190045,12341), -- Blutwacht 
(190038,12334), -- Darnassus 
(190077,12349), -- Theramore
(190079,12350), -- Mondfederfeste 
(190068,12331), -- Dolanaar
(190104,12333), -- Azurwacht 
(190069,12338), -- Auberdine 
(190078,12348), -- Nijelspitze 
(190041,12337), -- Naaru 
(191879,12347), -- Steinkrallengipfel
(191878,12332), -- Kharanos
(189303,12286), -- Goldhain
(194063,12351), -- Nistgipfel 
(190059,12339), -- Thelsamar 
(190036,12336), -- Sturmwind
(190037,12343), -- Menethil 
(190066,12397), -- Beutebucht 
(190052,12344), -- Dunkelhain
(190049,12346), -- Süderstade
(190039,12335), -- Eisenschmiede 
(190057,12342), -- Seenhain
(190047,12340), -- Späherkuppe
(190061,12358), -- Sylvanaar
(300202,12352), -- Ehrenfeste 
(191880,12357), -- Telaar 
(300201,12356), -- Allerias Feste 
(194077,12354), -- Telredor 
(192018,12359), -- Toshleys Station
(194056,12353), -- Tempel von Telhamat 
(190111,12360), -- Wildhammerfeste
(190042,12363), -- Brill 
(190106,12370), -- Silbermond Basar
(190088,12369), -- Silbermond Markt
(190089,12364), -- Falkenplatz
(190097,12385), -- Kargath 
(190102,12381), -- Schattenflucht
(190101,12388), -- Thrallmar
(190076,12396), -- Ratschet 
(190115,12391), -- Steinbrecherfeste
(190043,12368), -- Unterstadt
(190098,12355), -- Oreborzuflucht
(190096,12382), -- Basislager von Grom'gol
(190109,12393), -- Donnerfeste 
(190099,12371), -- Silberwald Grabmal
(190114,12365), -- morgenluft 
(190091,12373), -- Tristessa
(190090,12387), -- Dorf der bruchhauer
(194078,12386), -- Camp Mojache
(190080,12401), -- Burg Cenarius
(190108,12402), -- Kapelle des Hoffnungsvollen Lichts
(190103,12403), -- Zuflucht des Cenarius
(300205,12406), -- Der ewige Hain
(190113,12407), -- Area 52
(194079,12408), -- Sturmsäule
(190116,12409), -- Sanktum der Sterne (Sehergasthaus)
(300204,12409), -- Altar der Sha`tar(Aldorgasthaus)
(300203,12404), -- Shattrat(Seher)
(190110,12404); -- Shattrat II(Aldor)
