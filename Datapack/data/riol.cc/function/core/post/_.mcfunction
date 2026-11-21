#> riol.cc:core/post/_
#
#
#
# 

### Tick終わりの処理

# ストレージにアクセス
    function #oh_my_dat:please

# バニラダメージを表示
    ## damageIndicatorを表示 ※100倍で偽装表示
    scoreboard players operation @s DamageTaken += @s DamageAbsorbed
    execute if score @s DamageTaken matches 1.. store result storage riol_api: DamageAPI.Output.Damage int 10 run scoreboard players get @s DamageTaken
    execute if score @s DamageTaken matches 1.. at @s run function riol.cc:core/damage/damage_indicator/vanilla_damage
    execute if score @s DamageTaken matches 1.. run data remove storage riol_api: DamageAPI.Output

# 持続ダメージの処理
    #まだない
    #execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{type:"DoT"}]

# Tickの終わりに体力を減算処理
    execute if entity @s[tag=isHurt] run function riol.cc:core/damage/health_subtract/_

# 死んでたら死亡処理
    execute if entity @s[tag=Death] run function riol.cc:core/death/_
    # 殴りや落下ダメージなどで死んだときも発火
    execute if score @s DeathTrigger matches 1.. run function riol.cc:core/death/_

# カスタムエフェクトの持続時間の処理
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[] run function riol.cc:core/custom_effect/subtract/_

# リセット
    scoreboard players reset @s DamageTaken
    scoreboard players reset @s DamageAbsorbed
