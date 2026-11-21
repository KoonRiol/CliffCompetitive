#> riol.cc:core/damage/damage_write/add/no_attacker
#
#
#
# @within function riol.cc:core/damage/damage_write/_

### ダメージデータをストレージに追加します。

    # ダメージをストレージ値に変換
    data modify storage riol_api: Temporary.Damage set from storage riol_api: DamageAPI.Output.Damage
    # IDをストレージ値に変換
    data modify storage riol_api: Temporary.noOwner set value true
    # ダメージ名をストレージ値に変換
    data modify storage riol_api: Temporary.damageName set from storage riol_api: DamageAPI.Argument.DamageName
    # ノックバックの有り無しをストレージ値に記入
    execute if data storage riol_api: DamageAPI.Argument{NoKnockback:0b} run data modify storage riol_api: Temporary.isKnockback set value true
    
    # 情報が入っているストレージをListに追加
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data append from storage riol_api: Temporary