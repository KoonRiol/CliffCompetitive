#> riol.cc:core/damage/attacker_buff/type/all/_
#
#
#
# @within function riol.cc:core/damage/attacker_buff/_

### 攻撃者側の全攻撃種類バフを計算して代入します。

# 攻撃力

    # 初期値に設定
    data modify storage riol_api: Calc.OutputMul set value 0.0f
    data modify storage riol_api: Calc.OutputAdd set value 0.0f
    # 攻撃力変動値を参照
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"attackDamage"}] run function riol.cc:core/damage/attacker_buff/type/all/attack_damage/_
    # スキル特有のアタッカー参照バフを取得
    function riol.assets:api/attacker_buff/all/attack_damage

    # mul代入
    data modify storage riol_api: Calc.A set value 0.0f
    data modify storage riol_api: Calc.A set from storage riol_api: Calc.AttackDamage.OutputMul
    data modify storage riol_api: Calc.B set from storage riol_api: Calc.OutputMul
    # 適用
    data modify storage riol_api: Calc.AttackDamage.OutputMul set compute default float riol.cc:calc/add_ab

    # add代入
    data modify storage riol_api: Calc.A set value 0.0f
    data modify storage riol_api: Calc.A set from storage riol_api: Calc.AttackDamage.OutputAdd
    data modify storage riol_api: Calc.B set from storage riol_api: Calc.OutputAdd
    # 適用
    data modify storage riol_api: Calc.AttackDamage.OutputAdd set compute default float riol.cc:calc/add_ab

    # リセット
    data remove storage riol_api: Calc.A
    data remove storage riol_api: Calc.B
    data remove storage riol_api: Calc.OutputMul
    data remove storage riol_api: Calc.OutputAdd

# 全与ダメージ

    # 初期値に設定
    data modify storage riol_api: Calc.OutputMul set value 0.0f
    data modify storage riol_api: Calc.OutputAdd set value 0.0f
    # 攻撃力変動値を参照
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"damageBoost"}] unless data storage riol_api: DamageAPI.Argument{DamageType:"DoT"} run function riol.cc:core/damage/attacker_buff/type/all/damage_boost/_
    # スキル特有のアタッカー参照バフを取得
    execute unless data storage riol_api: DamageAPI.Argument{DamageType:"DoT"} run function riol.assets:api/attacker_buff/all/damage_boost

    # mul代入
    data modify storage riol_api: Calc.A set value 0.0f
    data modify storage riol_api: Calc.A set from storage riol_api: Calc.DamageBoost.OutputMul
    data modify storage riol_api: Calc.B set from storage riol_api: Calc.OutputMul
    # 適用
    data modify storage riol_api: Calc.DamageBoost.OutputMul set compute default float riol.cc:calc/add_ab

    # add代入
    data modify storage riol_api: Calc.A set value 0.0f
    data modify storage riol_api: Calc.A set from storage riol_api: Calc.DamageBoost.OutputAdd
    data modify storage riol_api: Calc.B set from storage riol_api: Calc.OutputAdd
    # 適用
    data modify storage riol_api: Calc.DamageBoost.OutputAdd set compute default float riol.cc:calc/add_ab
    
    # リセット
    data remove storage riol_api: Calc.A
    data remove storage riol_api: Calc.B
    data remove storage riol_api: Calc.OutputMul
    data remove storage riol_api: Calc.OutputAdd

# 全防御貫通

    # 初期値に設定
    data modify storage riol_api: Calc.OutputMul set value 0.0f
    # 攻撃力変動値を参照
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"defenseBreak"}] run function riol.cc:core/damage/attacker_buff/type/all/defense_break/_
    # スキル特有のアタッカー参照バフを取得
    function riol.assets:api/attacker_buff/all/defense_break

    # mul代入
    execute unless data storage riol_api: DamageAPI.Argument.DefenseBreak run data modify storage riol_api: DamageAPI.Argument.DefenseBreak set value 0.0f
    data modify storage riol_api: Calc.A set from storage riol_api: DamageAPI.Argument.DefenseBreak
    data modify storage riol_api: Calc.B set from storage riol_api: Calc.OutputMul
    # 適用
    data modify storage riol_api: DamageAPI.Argument.DefenseBreak set compute default float riol.cc:calc/add_ab
    
    # リセット
    data remove storage riol_api: Calc.A
    data remove storage riol_api: Calc.B
    data remove storage riol_api: Calc.OutputMul