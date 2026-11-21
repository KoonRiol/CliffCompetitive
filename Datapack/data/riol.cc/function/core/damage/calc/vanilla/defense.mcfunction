#> riol.cc:core/damage/calc/vanilla/defense
#
# 防御力を計算します。
#
# @within function riol.cc:core/damage/calc/_

# 計算式:
# damage * (1 - min(20, max(defensePoints / 5, defensePoints - damage / (2 + toughness / 4))) / 25) * (1 - (min(20, cappedEPF) / 25)) * (1 - min(5, resistanceLv) / 5)

# 防御力
    execute if data storage riol_api: DamageAPI.Argument{BypassArmor:0b} run data modify storage riol_api: Calc.DefensePoints set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.armor
    execute if data storage riol_api: DamageAPI.Argument{BypassArmor:1b} run data modify storage riol_api: Calc.DefensePoints set value 0.0f
# 防具強度
    execute if data storage riol_api: DamageAPI.Argument{BypassArmor:0b} run data modify storage riol_api: Calc.Toughness set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.armor_toughness
    execute if data storage riol_api: DamageAPI.Argument{BypassArmor:1b} run data modify storage riol_api: Calc.Toughness set value 0.0f

# 防御デバフ/バフの計算
    execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.DefensePoints set compute default float riol.cc:damage_api/need_attacker/defense_bonus
    execute unless data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.DefensePoints set compute default float riol.cc:damage_api/no_attacker/defense_bonus

# 防御力での軽減を計算。
    data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/defense