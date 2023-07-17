#table rename
RENAME TABLE item_template TO item;

#rename columns
ALTER TABLE item
    RENAME COLUMN entry TO id,
    RENAME COLUMN class TO type,
    RENAME COLUMN Quality TO quality,
    RENAME COLUMN SellPrice TO sell_price,
    RENAME COLUMN InventoryType TO slot;

#drop columns unused by me or future filtering, you can select which columns you want to keep by removing drop statements
ALTER TABLE item
    DROP COLUMN displayid,
    DROP COLUMN unk0,
    DROP COLUMN Flags,
    DROP COLUMN Flags2,
    DROP COLUMN BuyCount,
    DROP COLUMN BuyPrice,
    DROP COLUMN AllowableClass,
    DROP COLUMN AllowableRace,
    DROP COLUMN RequiredSkill,
    DROP COLUMN RequiredSkillRank,
    DROP COLUMN requiredspell,
    DROP COLUMN requiredhonorrank,
    DROP COLUMN RequiredCityRank,
    DROP COLUMN RequiredReputationFaction,
    DROP COLUMN RequiredReputationRank,
    DROP COLUMN maxcount,
    DROP COLUMN stackable,
    DROP COLUMN ContainerSlots,
    DROP COLUMN StatsCount,
    DROP COLUMN stat_type1,
    DROP COLUMN stat_value1,
    DROP COLUMN stat_type2,
    DROP COLUMN stat_value2,
    DROP COLUMN stat_type3,
    DROP COLUMN stat_value3,
    DROP COLUMN stat_type4,
    DROP COLUMN stat_value4,
    DROP COLUMN stat_type5,
    DROP COLUMN stat_value5,
    DROP COLUMN stat_type6,
    DROP COLUMN stat_value6,
    DROP COLUMN stat_type7,
    DROP COLUMN stat_value7,
    DROP COLUMN stat_type8,
    DROP COLUMN stat_value8,
    DROP COLUMN stat_type9,
    DROP COLUMN stat_value9,
    DROP COLUMN stat_type10,
    DROP COLUMN stat_value10,
    DROP COLUMN ScalingStatDistribution,
    DROP COLUMN ScalingStatValue,
    DROP COLUMN dmg_min1,
    DROP COLUMN dmg_max1,
    DROP COLUMN dmg_type1,
    DROP COLUMN dmg_min2,
    DROP COLUMN dmg_max2,
    DROP COLUMN dmg_type2,
    DROP COLUMN armor,
    DROP COLUMN holy_res,
    DROP COLUMN fire_res,
    DROP COLUMN nature_res,
    DROP COLUMN frost_res,
    DROP COLUMN shadow_res,
    DROP COLUMN arcane_res,
    DROP COLUMN delay,
    DROP COLUMN ammo_type,
    DROP COLUMN RangedModRange,
    DROP COLUMN spellid_1,
    DROP COLUMN spelltrigger_1,
    DROP COLUMN spellcharges_1,
    DROP COLUMN spellppmRate_1,
    DROP COLUMN spellcooldown_1,
    DROP COLUMN spellcategory_1,
    DROP COLUMN spellcategorycooldown_1,
    DROP COLUMN spellid_2,
    DROP COLUMN spelltrigger_2,
    DROP COLUMN spellcharges_2,
    DROP COLUMN spellppmRate_2,
    DROP COLUMN spellcooldown_2,
    DROP COLUMN spellcategory_2,
    DROP COLUMN spellcategorycooldown_2,
    DROP COLUMN spellid_3,
    DROP COLUMN spelltrigger_3,
    DROP COLUMN spellcharges_3,
    DROP COLUMN spellppmRate_3,
    DROP COLUMN spellcooldown_3,
    DROP COLUMN spellcategory_3,
    DROP COLUMN spellcategorycooldown_3,
    DROP COLUMN spellid_4,
    DROP COLUMN spelltrigger_4,
    DROP COLUMN spellcharges_4,
    DROP COLUMN spellppmRate_4,
    DROP COLUMN spellcooldown_4,
    DROP COLUMN spellcategory_4,
    DROP COLUMN spellcategorycooldown_4,
    DROP COLUMN spellid_5,
    DROP COLUMN spelltrigger_5,
    DROP COLUMN spellcharges_5,
    DROP COLUMN spellppmRate_5,
    DROP COLUMN spellcooldown_5,
    DROP COLUMN spellcategory_5,
    DROP COLUMN spellcategorycooldown_5,
    DROP COLUMN PageText,
    DROP COLUMN LanguageID,
    DROP COLUMN PageMaterial,
    DROP COLUMN startquest,
    DROP COLUMN lockid,
    DROP COLUMN Material,
    DROP COLUMN sheath,
    DROP COLUMN RandomProperty,
    DROP COLUMN RandomSuffix,
    DROP COLUMN block,
    DROP COLUMN itemset,
    DROP COLUMN MaxDurability,
    DROP COLUMN area,
    DROP COLUMN Map,
    DROP COLUMN BagFamily,
    DROP COLUMN TotemCategory,
    DROP COLUMN socketColor_1,
    DROP COLUMN socketContent_1,
    DROP COLUMN socketColor_2,
    DROP COLUMN socketContent_2,
    DROP COLUMN socketColor_3,
    DROP COLUMN socketContent_3,
    DROP COLUMN socketBonus,
    DROP COLUMN GemProperties,
    DROP COLUMN RequiredDisenchantSkill,
    DROP COLUMN ArmorDamageModifier,
    DROP COLUMN Duration,
    DROP COLUMN ItemLimitCategory,
    DROP COLUMN HolidayId,
    DROP COLUMN ScriptName,
    DROP COLUMN DisenchantID,
    DROP COLUMN FoodType,
    DROP COLUMN minMoneyLoot,
    DROP COLUMN maxMoneyLoot,
    DROP COLUMN ExtraFlags;

#delete all BoP items (deletes 25k items)
DELETE
FROM item
WHERE bonding IN (1);

#delete all poor items (deletes 3k items)
DELETE
FROM item
WHERE quality IN (0);

#delete items that are deprecated or can't be used(deletes 3k items)
DELETE
FROM item
WHERE (
            name LIKE '%deprecated%'
        OR name LIKE '%unused%'
        OR name LIKE '%QAEnchant%'
        OR name LIKE '%ZZOLD%'
        OR name LIKE BINARY '%OLD%'
        OR name LIKE BINARY '%TEST%'
        OR name LIKE '%(test)%'
        OR name LIKE '63%'
        OR name LIKE '90%'
        OR name LIKE 'Green Hills of Stranglethorn%'
        OR name LIKE 'Monster -%'
        OR name LIKE 'Sayge\'s Fortune%'
        OR name LIKE 'Shredder Operating Manual%'
        OR name LIKE '%D0%'
        OR name LIKE '%C0%'
        OR name LIKE 'Internal%'
        OR name LIKE '%[ph]%'
        OR name = 'test'
        OR name LIKE '% test%'
        OR name LIKE '%test %'
        OR id IN (5502, 6899, 13214, 6255, 16104, 6987)
    )
  AND id NOT IN (19971, 18361, 19160, 19971);

#delete legendary items except Elementium Bar
DELETE
FROM item
WHERE quality IN (5)
  AND id NOT IN (17771);

#delete artifacts
DELETE
FROM item
WHERE quality IN (6)
  AND id NOT IN (17771);

#delete low level items (uncomment if required)
#DELETE
#FROM item
#WHERE (RequiredLevel < 40 AND ItemLevel < 40 AND quality < 3)
#   OR (RequiredLevel < 40 AND ItemLevel = 0 AND quality < 3)
#   OR (RequiredLevel = 0 AND ItemLevel < 40 AND quality < 3);

#squash down ids of type, since there are no more items of type Generic, Money and Permanent
# 0 consumable, 1 container, 2 weapon, 3 gem, 4 armor, 5 reagent, 6 projectile, 7 trade goods, 8 recipe, 9 quiver, 10 quest, 11 key, 12 miscellaneous, 13 glyph
UPDATE item
SET type = CASE
               WHEN type = 9 THEN type - 1
               WHEN type IN (11, 12, 13) THEN type - 2
               WHEN type IN (15, 16) THEN type - 3
    ELSE type
END;

#squash down ids of quality since there are no more Poor and Artifact quality
UPDATE item
SET quality = quality - 1;

#drop columns that are no longer used by me or future filtering
ALTER TABLE item
    DROP COLUMN subclass,
    DROP COLUMN bonding,
    DROP COLUMN description,
    DROP COLUMN ItemLevel,
    DROP COLUMN RequiredLevel;






