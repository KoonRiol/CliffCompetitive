#> riol.cc:core/damage/attacker_buff/type/all/defense_break/_
#
#
#
# @within function riol.cc:core/damage/attacker_buff/type/all/_

### 防御力貫通の参照

# mul
data modify storage riol_api: DamageAPI.loop set value []
data modify storage riol_api: DamageAPI.loop append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"defenseBreak",type:"mul"}].value
data modify storage riol_api: Calc.A set value 0.0f
execute if data storage riol_api: DamageAPI.loop[0] run function riol.cc:core/damage/calc/loop
data modify storage riol_api: Calc.OutputMul set from storage riol_api: Calc.A

# 値をキャッシュに保存
#なんてことはしない

# リセット
data remove storage riol_api: DamageAPI.loop
data remove storage riol_api: Calc.A
data remove storage riol_api: Calc.B