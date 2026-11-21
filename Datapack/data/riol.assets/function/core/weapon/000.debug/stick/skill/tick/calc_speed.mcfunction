#> riol.assets:core/weapon/000.debug/stick/skill/tick/calc_speed
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/_

### 速度を計算

    function #oh_my_dat:please

    # この座標がロードされていなかったらキルフラグを立てる。
    execute unless loaded ^ ^ ^ run tag @s add riol.cc.kill_entity

    # なかったら設定
    execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed set value 2f

    # 計算してSpeedに代入
    data modify storage riol_api: Calc.A set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed
    data modify storage riol_api: Calc.B set value 1.05f
    execute if score @s SkillTick matches 10.. run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed set compute default float riol.cc:calc/div_ab
    #tellraw @a ["速度: ",{storage:"oh_my_dat:",nbt:"_[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed"}]

    # 1の位と小数点以下第1の分だけ繰り返させる
    data modify storage riol_api: Calc.A set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Speed
    execute store result score $Tmp Temporary run compute default integer {"type":"minecraft:from_float",input:{type:"minecraft:storage",storage:"riol_api:",path:Calc.A}}
    execute store result score $Tmp2 Temporary run compute default integer {"type":"minecraft:sub","left":{"type":"minecraft:from_float",input:{type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"riol_api:",path:Calc.A},{type:"minecraft:constant",value:10}]}},right:{type:"minecraft:mul",inputs:[{type:"minecraft:score",score:"Temporary",target:{type:"minecraft:fixed",name:"$Tmp"}},{type:"minecraft:constant",value:10}]}}
    #tellraw @a ["1の位: ",{score:{name:"$Tmp",objective:Temporary}}]
    #tellraw @a ["小数点以下: ",{score:{name:"$Tmp2",objective:Temporary}}]
    execute if score $Tmp Temporary matches 1.. run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp1
    execute unless score $Tmp Temporary matches 1.. if score $Tmp2 Temporary matches 1.. run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2

    scoreboard players reset $Tmp Temporary
    scoreboard players reset $Tmp2 Temporary
    data remove storage riol_api: Calc


