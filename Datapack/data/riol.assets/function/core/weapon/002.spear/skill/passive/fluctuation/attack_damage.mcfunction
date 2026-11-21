#> riol.assets:core/weapon/002.spear/skill/passive/fluctuation/attack_damage
#
#
#
# @within function riol.assets:api/attacker_buff/all/attack_damage

### 揺らぎの層数に応じて攻撃力バフを獲得します。
data modify storage riol_api: Calc.A set value 10
execute store result storage riol_api: Calc.B int 1 run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"fluctuation"}].value
data modify storage riol_api: Calc.B set compute default float riol.cc:calc/mul_ab
data modify storage riol_api: Calc.A set from storage riol_api: Calc.OutputMul
data modify storage riol_api: Calc.OutputMul set compute default float riol.cc:calc/add_ab