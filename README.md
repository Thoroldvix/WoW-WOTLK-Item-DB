# WoW-WOTLK-Item-DB

When searching for the datasets of items that are tradeable I found out that it doesn't exists, all datasets that are out there contain all item info.

So i decided to clean up dataset which is provided by https://github.com/cmangos/wotlk-db, so you don't have to.

I managed to shorten it from 44k rows to 18k. There are still some non-tradeable items in this dataset, but it's good enough for me. You can narrow down it further if you want. 

I also changed original table structure and naming.
 
## Usage

You can run scripts on a database of your choice.

wotlk-original.sql script contains unfiltered data and made for MySQL db. 

wotlk-cleaned-up.sql script contain filtered data and made for Postgresql db.

cleaning-script.sql contains script that was used to filter original dataset.


## Original DB structure and columns

Original structure and column descriptions can be found here: https://github.com/cmangos/issues/wiki/item_template


## Description of the columns in the cleaned up version

### id
Id of the item. This id is used in wowhead search so you can view it in a more friendly form by putting id in this link https://www.wowhead.com/wotlk/item= "item id"

### type
Type of the item:

|ID | Name|
|---|-----|
|0|Consumable|
|1|Container|
|2|Weapon|
|3|Gem|
|4|Armor|
|5|Reagent|
|6|Projectile|
|7|Trade goods|
|8|Recipe|
|9|Quiver|
|10|Quest|
|11|Key|
|12|Miscellaneous|
|13|Glyph|

### name 

Item's name.

### quality

Quality of the item:

|ID|Color|Quality|
|---|----|-------|
|0|White|Common|
|1|Green|Uncommon|
|2|Blue|Rare|
|3|Purple|Epic|
|4|Orange|Legendary|

### sell_price

The price that the vendor will pay you for the item when you sell it and if it is possible to be sold, in copper. Put in 0 if the item cannot be sold to a vendor.

### slot

In what slot the item can be equipped.

|ID|Slot Name|ID|Slot Name|
|----|------|---|---------|
|0|Non equipable|15|Ranged|
|1|Head|16|Back|
|2|Neck|17|Two-Hand|
|3|Shoulder|18|Bag|
|4|Shirt|19|Tabard|
|5|Chest|20|Robe|
|6|Waist|21|Main hand|
|7|Legs|22|Off hand|
|8|Feet|23|Holdable (Tome)|
|9|Wrists|24|Ammo|
|10|Hands|25|Thrown|
|11|Finger|26|Ranged right|
|12|Trinket|27|Quiver|
|13|Weapon|28|Relic|
|14|Shield|


### slug

URL friendly name of the item





