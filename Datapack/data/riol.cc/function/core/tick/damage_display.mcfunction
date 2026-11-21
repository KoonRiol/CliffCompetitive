#> riol.cc:core/tick/damage_display
#
#
#
#

### ディスプレイの削除処理
scoreboard players add @s DisplayKill 1
execute if score @s DisplayKill matches 30.. run kill @s