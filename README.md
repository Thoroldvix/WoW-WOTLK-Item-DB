# WoW-WOTLK-Item-DB

When searching for the list or datasets of items that are tradeable I found out that it doesn't exists, all datasets that are out there contain all item info.

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

### slug

URL friendly name of the item





