# mantis bug 2462
# fix item 29109 remove spell 38164 because it proccs to often (should only procc in one mob fight)
UPDATE `item_template` SET `spellid_1` = 0, `spelltrigger_1` = 0 WHERE `entry` = 29109;
# fix item 29108 remove spell 38164 because it proccs to often (should only procc in one mob fight)
UPDATE `item_template` SET `spellid_1` = 0, `spelltrigger_1` = 0 WHERE `entry` = 29108;
