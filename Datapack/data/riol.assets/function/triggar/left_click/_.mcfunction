#> riol.assets:triggar/left_click/_
#
#
#
# @within riol.assets:triggar/_

### 左クリックの処理を行います。

execute if data entity @s SelectedItem.components."minecraft:custom_data".riol_cc.item{id:"000.Debug_stick"} run function riol.assets:core/weapon/000.debug/stick/normal_attack/_