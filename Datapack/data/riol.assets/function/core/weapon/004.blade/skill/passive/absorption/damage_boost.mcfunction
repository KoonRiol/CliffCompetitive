#> riol.assets:core/weapon/004.blade/skill/passive/absorption/damage_boost
#
#
#
# @within function riol.assets:api/attacker_buff/all/damage_boost

### 吸収の層数に応じて与ダメージバフを獲得します。
data modify storage riol_api: Calc.A set value 20
execute store result storage riol_api: Calc.B int 1 run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"absorption"}].value
data modify storage riol_api: Calc.B set compute default float riol.cc:calc/mul_ab
data modify storage riol_api: Calc.A set from storage riol_api: Calc.OutputMul
data modify storage riol_api: Calc.OutputMul set compute default float riol.cc:calc/add_ab