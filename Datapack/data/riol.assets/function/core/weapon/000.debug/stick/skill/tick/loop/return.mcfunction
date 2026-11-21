#> riol.assets:core/weapon/000.debug/stick/skill/tick/loop/return
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/return

### 最後に戻ってくる

    # キラキラ
    function riol.assets:core/visual/view/debug/skill/return_loop

    # 攻撃判定を追加
    execute as @e[dx=0,type=!#riol.cc:non_living,tag=!riol.cc.attacker,tag=!riol.cc.owner,tag=!riol.cc.protect] positioned ~-0.125 ~-0.125 ~-0.125 \
    positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0] run \
    tag @s add riol.cc.target

    # 召喚したプレイヤーの位置に帰ってきたら実行をやめる。
    execute as @a[dx=0,tag=riol.cc.owner] positioned ~-0.125 ~-0.125 ~-0.125 \
    positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0] run \
    return 0
    # またはなんか変なこと起きた時のために200m超えたらやめる
    scoreboard players add $riol.cc.return_block Temporary 1

    # 再帰
    execute unless score $riol.cc.return_block Temporary matches 2000.. positioned ^ ^ ^0.2 run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/return