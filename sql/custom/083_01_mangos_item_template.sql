# mantis bug 2462
# fix item 29109 remove spell 38164 because it proccs to often (should only procc in one mob fight)
UPDATE `item_template` SET `spellid_2` = 0, `spelltrigger_2` = 0 WHERE `entry` = 29109;
# fix item 29108 remove spell 38164 because it proccs to often (should only procc in one mob fight)
UPDATE `item_template` SET `spellid_2` = 0, `spelltrigger_2` = 0 WHERE `entry` = 29108;