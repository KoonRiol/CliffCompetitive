#> riol.cc:core/damage/attacker_buff/calc
#
#
#
# @within function riol.cc:core/damage/attacker_buff/_

### 計算をするぞ！

# 固定ダメージかどうかや与ダメージが関係あるかを確認。

    # 初期値を設定
    data modify storage riol_api: Calc.AttackDamage.OutputMul set value 0.0f
    data modify storage riol_api: Calc.AttackDamage.OutputAdd set value 0.0f
    data modify storage riol_api: Calc.DamageBoost.OutputMul set value 0.0f
    data modify storage riol_api: Calc.DamageBoost.OutputAdd set value 0.0f
    
    # 全ダメージに関係するもの
    function riol.cc:core/damage/attacker_buff/type/all/_
    # 通常攻撃ダメージに関係するもの
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"NormalAttack"} run function riol.cc:core/damage/attacker_buff/type/normal_attack/_
    # スキルダメージに関係するもの
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Skill"} run function riol.cc:core/damage/attacker_buff/type/skill/_
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"WeaponSkill"} run function riol.cc:core/damage/attacker_buff/type/skill/_
    # 必殺技ダメージに関係するもの
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Ultimate"} run function riol.cc:core/damage/attacker_buff/type/ultimate/_
    # 持続ダメージに関係するもの
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"DoT"} run function riol.cc:core/damage/attacker_buff/type/dot/_

    # 適用
    data modify storage riol_api: DamageAPI.Argument.Damage set compute default float riol.cc:damage_api/attacker_buff/attack_damage
    data modify storage riol_api: DamageAPI.Argument.Damage set compute default float riol.cc:damage_api/attacker_buff/damage_boost

    # リセット
    data remove storage riol_api: Calc

