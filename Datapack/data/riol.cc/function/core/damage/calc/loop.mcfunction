#> riol.cc:core/damage/calc/loop
#
#
#
# 

### リストの中身を合算。

data modify storage riol_api: Calc.B set from storage riol_api: DamageAPI.loop[0]
data remove storage riol_api: DamageAPI.loop[0]
data modify storage riol_api: Calc.A set compute default float riol.cc:calc/add_ab

execute if data storage riol_api: DamageAPI.loop[0] run function riol.cc:core/damage/calc/loop