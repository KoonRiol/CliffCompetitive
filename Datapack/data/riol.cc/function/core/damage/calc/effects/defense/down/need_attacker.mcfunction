#> riol.cc:core/damage/calc/effects/defense/down/need_attacker
#
#
#
# @within function riol.cc:core/damage/calc/effects/need_attacker

### 状態異常や、スキルでの防御貫通値などの処理を行います。(攻撃制限あり)

# mul
data modify storage riol_api: DamageAPI.loop set value []
$data modify storage riol_api: DamageAPI.loop append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{isOwner:1b,id:"defenseDown",type:"mul",owner:$(Attacker)}].value
data modify storage riol_api: Calc.A set value 0.0f
execute if data storage riol_api: DamageAPI.loop[0] run function riol.cc:core/damage/calc/loop
data modify storage riol_api: Calc.OutputMul set from storage riol_api: Calc.A
data remove storage riol_api: DamageAPI.loop

# add
data modify storage riol_api: DamageAPI.loop set value []
$data modify storage riol_api: DamageAPI.loop append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{isOwner:1b,id:"defenseDown",type:"add",owner:$(Attacker)}].value
data modify storage riol_api: Calc.A set value 0.0f
execute if data storage riol_api: DamageAPI.loop[0] run function riol.cc:core/damage/calc/loop
data modify storage riol_api: Calc.OutputAdd set from storage riol_api: Calc.A

# 特殊カスタムエフェクトの合算
function riol.assets:api/taken_damage_effects/all/need_attacker/defense_down

# 値をキャッシュに保存
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.defenseDown.value.mul set from storage riol_api: Calc.OutputMul
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.defenseDown.value.add set from storage riol_api: Calc.OutputAdd

# リセット
data remove storage riol_api: DamageAPI.loop
data remove storage riol_api: Calc