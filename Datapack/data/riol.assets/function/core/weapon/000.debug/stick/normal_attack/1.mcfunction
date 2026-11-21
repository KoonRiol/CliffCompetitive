#> riol.assets:core/weapon/000.debug/stick/normal_attack/1
#
#
#
# @within riol.assets:core/weapon/000.debug/stick/normal_attack/_

### 通常攻撃発動！

    # 自身を攻撃者に設定
    tag @s add riol.cc.attacker

    # 必要な引数を設定
    data modify storage riol_api: DamageAPI.Argument.Damage set value 3.0f
    data modify storage riol_api: DamageAPI.Argument.DamageName set value "000.Debug.Stick_NormalAttack"
    data modify storage riol_api: DamageAPI.Argument.DamageType set value "NormalAttack"
    data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
    function riol.cc:core/damage/attacker_buff/_

    # 演出
    function riol.assets:core/visual/sound/debug/normal_attack/0
    function riol.assets:core/visual/view/debug/normal_attack/1

    # 攻撃を実行！
    execute anchored eyes positioned ^ ^ ^2 run tag @e[type=!#riol.cc:non_living,tag=!riol.cc.attacker,distance=..3,tag=!riol.cc.protect] add riol.cc.target
    execute as @e[tag=riol.cc.target] at @s run function riol.cc:core/damage/_
    data remove storage riol_api: DamageAPI

    # スコアとカスタムデータを設定
    scoreboard players set $Tmp Temporary 1
    data modify storage riol_api: Tmp.custom_data.normal_attack._ set value 0b
    
    # リセット
    tag @s[tag=riol.cc.attacker] remove riol.cc.attacker
    tag @e[tag=riol.cc.target] remove riol.cc.target