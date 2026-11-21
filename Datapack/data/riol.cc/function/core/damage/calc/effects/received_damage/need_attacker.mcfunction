#> riol.cc:core/damage/calc/effects/received_damage/need_attacker
#
#
#
# @within function riol.cc:core/damage/calc/effects/need_attacker

### 状態異常や、スキルでの防御貫通値などの処理を行います。(攻撃制限あり)

# mul
data modify storage riol_api: DamageAPI.loop set value []
$data modify storage riol_api: DamageAPI.loop append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{isOwner:1b,id:"receivedDamage",type:"mul",owner:$(Attacker)}].value
data modify storage riol_api: Calc.A set value 0.0f
execute if data storage riol_api: DamageAPI.loop[0] run function riol.cc:core/damage/calc/loop
data modify storage riol_api: Calc.OutputMul set from storage riol_api: Calc.A

# 特殊カスタムエフェクトの合算
function riol.assets:api/taken_damage_effects/all/need_attacker/received_damage

# 値をキャッシュに保存
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.receivedDamage.value.mul set from storage riol_api: Calc.OutputMul

# リセット
data remove storage riol_api: DamageAPI.loop
data remove storage riol_api: Calc