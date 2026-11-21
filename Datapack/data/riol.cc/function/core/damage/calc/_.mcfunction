#> riol.cc:core/damage/calc/_
#
#
#
# @within function riol.cc:core/damage/_

### ダメージを計算します。

# 防御力
execute unless data storage riol_api: DamageAPI.Argument{BypassArmor:true} run function riol.cc:core/damage/calc/vanilla/defense
execute if data storage riol_api: DamageAPI.Argument{BypassArmor:true} run data modify storage riol_api: Calc.A set from storage riol_api: Calc.Damage

# EPF(エンチャント)
execute unless data storage riol_api: DamageAPI.Argument{BypassEPF:true} run function riol.cc:core/damage/calc/vanilla/epf

# 耐性
execute unless data storage riol_api: DamageAPI.Argument{BypassResistance:true} run function riol.cc:core/damage/calc/vanilla/resistance

# 被ダメージ増加
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/need_attacker/received_damage
execute unless data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/no_attacker/received_damage

# 被ダメージ軽減
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/need_attacker/damage_mitigation
execute unless data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/no_attacker/damage_mitigation

# 属性耐性貫通
# まだないよ

# Outputに記録
data modify storage riol_api: DamageAPI.Output.Damage set from storage riol_api: Calc.A

# Reset
scoreboard players reset $EPF Temporary
scoreboard players reset $Resistance Temporary
data remove storage riol_api: Calc