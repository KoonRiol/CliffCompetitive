#> riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp1
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/calc_speed

### TPを移動量で加算

    # entityのいる座標がロードされてなかったらラストアタックの準備
    execute unless loaded ^ ^ ^ run tag @s add riol.cc.kill_entity
    # 残り移動距離が0かつそこのブロックに当たり判定がなくて、さらにその座標がロードされていたらTP
    execute if score $Tmp Temporary matches 0 if loaded ^ ^ ^ unless function better_collision:api/ run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2_check
    # ロードされていなかったら1マス下がる。
    execute unless loaded ^ ^ ^ positioned ^ ^ ^-1 run return run tp @s ^ ^ ^
    # ロードされていて、当たり判定にぶつかっていたら1マス下がる(ロードされていない場合判定ができないため。)
    execute if loaded ^ ^ ^ if function better_collision:api/ positioned ^ ^ ^-1 run return run tp @s ^ ^ ^
    # スコアを引く
    scoreboard players remove $Tmp Temporary 1
    # スコア引いても0以上あるならターゲットつけてもういっちょ
    execute if score $Tmp Temporary matches 0.. run tag @e[type=!#riol.cc:non_living,distance=..2,tag=!riol.cc.attacker,tag=!riol.cc.owner,tag=!riol.cc.protect] add riol.cc.target
    execute if score $Tmp Temporary matches 0.. positioned ^ ^ ^1 if entity @p[distance=..200,tag=riol.cc.owner] run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp1