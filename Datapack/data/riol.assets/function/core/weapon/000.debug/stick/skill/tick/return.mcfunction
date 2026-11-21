#> riol.assets:core/weapon/000.debug/stick/skill/tick/return
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/_

### 最後に戻ってくる

    # キラキラ
    function riol.assets:core/visual/view/debug/skill/return
    
    # 必要な引数を設定
    data modify storage riol_api: DamageAPI.Argument.Damage set value 5.0f
    data modify storage riol_api: DamageAPI.Argument.DamageName set value "000.Debug.Stick_SkillAttack"
    data modify storage riol_api: DamageAPI.Argument.DamageType set value "Skill"
    data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
    data modify storage riol_api: DamageAPI.Argument.MultiHitBlock set value 0b

    # オーナーを探索し、その人のバフを参照する。
    execute as @a[tag=riol.cc.owner,limit=1,sort=nearest] run function riol.cc:core/damage/attacker_buff/_

    # 攻撃判定を付与
        # 向きを設定
        execute anchored eyes at @a[tag=riol.cc.owner,limit=1,sort=nearest] run rotate @s facing ~ ~1 ~
    execute at @s run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/return

    # 攻撃を実行！
    execute as @e[tag=riol.cc.target] at @s run function riol.cc:core/damage/_
    execute as @e[tag=riol.cc.target,tag=isHurt] at @s run particle minecraft:gust ^ ^1 ^ 0.2 0.2 0.2 1 3 force
    data remove storage riol_api: DamageAPI

    # リセット
    scoreboard players reset $riol.cc.return_block Temporary
    tag @e[tag=riol.cc.target] remove riol.cc.target
    function #oh_my_dat:release