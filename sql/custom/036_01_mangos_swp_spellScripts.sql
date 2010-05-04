-- scripts for 'burn' and 'stomp'
DELETE FROM `spell_scripts` WHERE `id` IN (45141, 45185);
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
('45141', '0', '15', '46394', '2', '0', '0', '0', '0', '0'),
('45185', '0', '14', '46394', '1', '0', '0', '0', '0', '0');
