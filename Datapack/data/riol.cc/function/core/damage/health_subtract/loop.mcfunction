#> riol.cc:core/damage/health_subtract/loop
#
#
#
# @Within function riol.cc:core/damage/health_subtract/_

### ダメージをListから読み込んで次の関数に渡します

    #自分のHPと比較してダメージの方が上回っていたら、死亡判定を付ける。
    data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/health_check/_
    execute if data storage riol_api: Calc{A:0.0f} run tag @s add Death
    execute if data storage riol_api: Calc{A:0.0f} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.attackerID set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID
    execute if data storage riol_api: Calc{A:0.0f} unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.noOwner set value true
    execute if data storage riol_api: Calc{A:0.0f} run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.damageName set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].damageName
    execute if data storage riol_api: Calc{A:0.0f} run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.entityType set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType._
    #データをないないしてばいばい
    execute if data storage riol_api: Calc{A:0.0f} if entity @s[tag=Death] run data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data
    execute if data storage riol_api: Calc{A:0.0f} if entity @s[tag=Death] run return run data remove storage riol_api: Calc

    #HPの方が上回っていたらダメージを与える(攻撃者あり)
    execute unless data storage riol_api: Calc{A:0.0f} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].isKnockback run function riol.cc:core/damage/health_subtract/need_attacker/knockback with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0]
    execute unless data storage riol_api: Calc{A:0.0f} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].isKnockback run function riol.cc:core/damage/health_subtract/need_attacker/_ with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0]

    #〃(攻撃者なし)
    execute unless data storage riol_api: Calc{A:0.0f} unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].isKnockback run function riol.cc:core/damage/health_subtract/no_attacker/knockback with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0]
    execute unless data storage riol_api: Calc{A:0.0f} unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].attackerID unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].isKnockback run function riol.cc:core/damage/health_subtract/no_attacker/_ with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0]


    #使い終わったデータはないない
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0]
    data remove storage riol_api: Calc


    #まだデータあるならもういっちょ
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.Health set from entity @s Health
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.AbsorptionAmount set from entity @s AbsorptionAmount
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0] run function riol.cc:core/damage/health_subtract/loop