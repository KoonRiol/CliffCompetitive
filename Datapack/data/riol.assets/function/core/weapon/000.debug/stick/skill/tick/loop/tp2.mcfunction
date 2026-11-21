#> riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/calc_speed

### TPを移動量で加算(0.1単位)

    # entityのいる座標がロードされてなかったらラストアタックの準備
    execute unless loaded ^ ^ ^ run tag @s add riol.cc.kill_entity
    # 残り移動距離が0かつそこのブロックに当たり判定がなくて、さらにその座標がロードされていたらTP
    execute if score $Tmp2 Temporary matches 0 if loaded ^ ^ ^ unless function better_collision:api/ run tp @s ^ ^ ^
    # ロードされていなかったら0.1マス下がる。
    execute unless loaded ^ ^ ^ positioned ^ ^ ^-0.1 run return run tp @s ^ ^ ^
    # ロードされていて、当たり判定にぶつかっていたら0.1マス下がる(ロードされていない場合判定ができないため。)
    execute if loaded ^ ^ ^ if function better_collision:api/ positioned ^ ^ ^-0.1 run return run tp @s ^ ^ ^
    # スコアを引く
    scoreboard players remove $Tmp2 Temporary 1
    # スコア引いても0以上あるならもういっちょ
    execute if score $Tmp2 Temporary matches 0.. positioned ^ ^ ^0.1 if entity @p[distance=..200,tag=riol.cc.owner] run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2