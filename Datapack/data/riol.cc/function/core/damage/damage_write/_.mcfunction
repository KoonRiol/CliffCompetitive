#> riol.cc:core/damage/damage_write/_
#
#
#
# @within function riol.cc:core/damage/_

### ダメージをストレージに書き込みます
    
    # ストレージをListに追加
    execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run function riol.cc:core/damage/damage_write/add/attacker with storage riol_api: DamageAPI
    execute if data storage riol_api: DamageAPI{EntityDamageSource:0b} run function riol.cc:core/damage/damage_write/add/no_attacker

    # ストレージを削除
    data remove storage riol_api: Temporary