#> riol.cc:core/damage/damage_indicator/_
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

    #特殊な確定ダメージ(旋風ダメージ)のダメージ表示
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"TrueDamage"} if data storage riol_api: DamageAPI.Argument{ElementType:"Wind"} run function riol.cc:core/damage/damage_indicator/type/whirlwind with storage riol_api: DamageAPI.Output
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"TrueDamage"} if data storage riol_api: DamageAPI.Argument{ElementType:"Wind"} run return 0
    #--
    #--
    #--

    #例外
    function riol.cc:core/damage/damage_indicator/type/other with storage riol_api: DamageAPI.Output