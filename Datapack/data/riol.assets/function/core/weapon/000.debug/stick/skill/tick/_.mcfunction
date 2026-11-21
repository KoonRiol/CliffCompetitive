#> riol.assets:core/weapon/000.debug/stick/skill/tick/_
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/_

### スキル攻撃発動！

    # ストレージにアクセス
    function #oh_my_dat:please

    # 自身を攻撃者に設定
    tag @s add riol.cc.attacker

    # 必要な引数を設定
    data modify storage riol_api: DamageAPI.Argument.Damage set value 5.0f
    data modify storage riol_api: DamageAPI.Argument.DamageName set value "000.Debug.Stick_SkillAttack"
    data modify storage riol_api: DamageAPI.Argument.DamageType set value "Skill"
    data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
    data modify storage riol_api: DamageAPI.Argument.MultiHitBlock set value 1b
    # オーナーを探索し、その人のバフを参照する。
    function riol.assets:core/weapon/000.debug/stick/skill/tick/owner_check with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData
    execute as @a[tag=riol.cc.owner,limit=1,sort=nearest] run function riol.cc:core/damage/attacker_buff/_

    # 移動
    execute if score @s SkillTick matches ..10 rotated as @a[tag=riol.cc.owner,limit=1] run tp @s ~ ~ ~ ~ ~
    execute at @s run function riol.assets:core/weapon/000.debug/stick/skill/tick/calc_speed

    # 演出
    execute at @s run function riol.assets:core/visual/sound/debug/skill/tick
    function riol.assets:core/visual/view/debug/skill/_

    # 攻撃を実行！
    execute at @s run tag @e[type=!#riol.cc:non_living,distance=..2,tag=!riol.cc.attacker,tag=!riol.cc.owner,tag=!riol.cc.protect] add riol.cc.target
    execute as @e[tag=riol.cc.target] at @s run function riol.cc:core/damage/_
    execute as @e[tag=riol.cc.target,tag=isHurt] at @s run particle minecraft:gust ^ ^1 ^ 0.2 0.2 0.2 1 3 force
    data remove storage riol_api: DamageAPI
    tag @e[tag=riol.cc.target] remove riol.cc.target

    # スコア加算
    scoreboard players add @s SkillTick 1
    
    # ラストアタック
    execute if score @s SkillTick matches 61.. run tag @s add riol.cc.kill_entity
    execute if entity @s[tag=riol.cc.kill_entity] at @s run function riol.assets:core/weapon/000.debug/stick/skill/tick/return

    # リセット
    tag @s[tag=riol.cc.attacker] remove riol.cc.attacker
    tag @a[tag=riol.cc.owner] remove riol.cc.owner
    kill @s[tag=riol.cc.kill_entity]