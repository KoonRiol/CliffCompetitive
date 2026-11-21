#> riol.assets:core/weapon/005.gunblade/skill/passive/blood_cost/damage_boost
#
#
#
# @within function riol.assets:api/attacker_buff/all/damage_boost

### 消費HPの層数に応じて与ダメージを獲得します。
data modify storage riol_api: Calc.A set value 0.03f
execute store result storage riol_api: Calc.B int 1 run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"bloodCost"}].value
data modify storage riol_api: Calc.B set compute default float riol.cc:calc/mul_ab
data modify storage riol_api: Calc.A set from storage riol_api: Calc.OutputMul
data modify storage riol_api: Calc.OutputMul set compute default float riol.cc:calc/add_ab