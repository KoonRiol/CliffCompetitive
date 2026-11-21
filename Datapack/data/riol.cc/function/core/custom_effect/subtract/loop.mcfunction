#> riol.cc:core/custom_effect/subtract/loop
#
#
#
#

### Durationを減算する処理

# スコアを減算&Tmpに成功の可否を入力
scoreboard players set $Tmp Temporary 0
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[$(Slot)] run scoreboard players set $Tmp Temporary 1
$execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[$(Slot)].duration{_:infinity} store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[$(Slot)].duration._ int 0.9999999999 run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[$(Slot)].duration._
# 再帰処理
scoreboard players add $Tmp.Slot Temporary 1
execute store result storage riol_api: CustomEffects.Slot int 1 run scoreboard players get $Tmp.Slot Temporary
execute if score $Tmp Temporary matches 1 run function riol.cc:core/custom_effect/subtract/loop with storage riol_api: CustomEffects