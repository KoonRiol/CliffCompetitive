#> riol.cc:core/damage/calc/vanilla/resistance
#
# 耐性エフェクトでの軽減を計算します
#
# @within function riol.cc:core/damage/calc/_

# 計算式:
# damage * (1 - min(20, max(defensePoints / 5, defensePoints - damage / (2 + toughness / 4))) / 25) * (1 - (min(20, cappedEPF) / 25)) * (1 - min(5, resistanceLv) / 5)

# 耐性エフェクト
    execute if data storage riol_api: DamageAPI.Argument{BypassResistance:0b} store result storage riol_api: Calc.Resistance float 1 run data get entity @s active_effects[{id:"minecraft:resistance"}].amplifier
    execute if data storage riol_api: DamageAPI.Argument{BypassResistance:0b} if data entity @s active_effects[{id:"minecraft:resistance"}] run data modify storage riol_api: Calc.Resistance set compute default float riol.cc:damage_api/resistance_plus
    execute if data storage riol_api: DamageAPI.Argument{BypassResistance:1b} run data modify storage riol_api: Calc.Resistance set value 0.0f

# 耐性エフェクトによる軽減を計算
    data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/resistance