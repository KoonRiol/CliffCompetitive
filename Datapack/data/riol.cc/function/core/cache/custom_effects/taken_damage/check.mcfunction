#> riol.cc:core/cache/custom_effects/taken_damage/check
#
#
#
# @within function riol.cc:core/cache/custom_effects/taken_damage/please

### 過去のIDと比較

# ストレージで比較&置き換え
execute store success score #Tmp Temporary run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.lastAttacker set from storage riol_api: DamageAPI.Attacker

# 値によって変えるぜ
execute if score #Tmp Temporary matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 1b

# リセット
scoreboard players reset #Tmp Temporary