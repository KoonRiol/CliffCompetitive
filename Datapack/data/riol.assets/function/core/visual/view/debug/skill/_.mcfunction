#> riol.assets:core/visual/view/debug/skill/_
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/_

# アイテムのデータを設定します。
execute store result score $Tmp Temporary run data get entity @s item.components."minecraft:custom_model_data".floats[0]
scoreboard players add $Tmp Temporary 1
execute if score $Tmp Temporary matches 21.. run scoreboard players set $Tmp Temporary 0
execute store result entity @s item.components."minecraft:custom_model_data".floats[0] int 1 run scoreboard players get $Tmp Temporary
scoreboard players reset $Tmp Temporary