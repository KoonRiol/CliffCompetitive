#> riol.cc:core/custom_effect/subtract/_
#
#
#
#

### 毎TickカスタムエフェクトのDurationを減算

# Durationを減算
scoreboard players set $Tmp.Slot Temporary 0
execute store result storage riol_api: CustomEffects.Slot int 1 run scoreboard players get $Tmp.Slot Temporary
function riol.cc:core/custom_effect/subtract/loop with storage riol_api: CustomEffects

# Durationが0のデータを削除
## Ownerの有無でrequirementResetの値を書き込み。
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{duration:{_:0},isOwner:1b}] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 1b
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{duration:{_:0},isOwner:0b}] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker.requirementReset set value 1b
execute if entity @s[type=!player] if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{duration:{_:0}}] if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} run function riol.cc:core/cache/tick
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{duration:{_:0}}]

# リセット
scoreboard players reset $Tmp Temporary
scoreboard players reset $Tmp.Slot Temporary