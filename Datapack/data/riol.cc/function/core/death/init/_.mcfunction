#> riol.cc:core/death/init/_
#
#
#
#

### ステータスなどを初期化

   # 死亡時にリセットが必要なステータスをリセット。
   execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{deathReset:1b}] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 1b
   execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{deathReset:1b}] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker.requirementReset set value 1b
   data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{deathReset:1b}]

   # 召喚物を削除 

   # ポイントを減算
   scoreboard players remove @s KDScore 1

   # リセット
   tag @s remove riol.cc.attacker 
   tag @s remove riol.cc.target 
   tag @s remove riol.cc.trigger.left_click
   tag @s remove riol.cc.trigger.right_click
