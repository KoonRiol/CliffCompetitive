#> riol.cc:core/damage/damage_indicator/vanilla_damage
#
#
#
#

### ダメージを表示します。

    #召喚位置をランダムに決定
    execute store result storage riol_api: DamageAPI.Output.IndicatorPosX float 0.01 run random value -50..50
    execute store result storage riol_api: DamageAPI.Output.IndicatorPosZ float 0.01 run random value -50..50
    execute store result score $Temp Temporary run random value -50..50
    scoreboard players add $Temp Temporary 120
    execute store result storage riol_api: DamageAPI.Output.IndicatorPosY float 0.01 run scoreboard players get $Temp Temporary
    scoreboard players reset $Temp Temporary

    #ダメージ表示
    function riol.cc:core/damage/damage_indicator/type/vanilla with storage riol_api: DamageAPI.Output