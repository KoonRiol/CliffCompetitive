#> riol.cc:core/damage/get_default_epf/_
#
# Enchantment Protection Factor (通称EPF)を取得します
#
# @within function riol.cc:core/damage/calc/vanilla/epf

#> Temp
# @within riol.cc:core/damage/get_default_epf/**
    #declare score_holder $Temp

# 負荷軽減のためstorageに入れる
    data modify storage riol_api: DamageAPI.Protection set value []
    function riol.cc:core/damage/get_default_epf/from_player
# 明示的に0に設定
    scoreboard players set $EPF Temporary 0
# ダメージ軽減の加算
    # 0
        execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[0]."minecraft:protection"
        scoreboard players operation $EPF Temporary += $Temp Temporary
    # 1
        execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[1]."minecraft:protection"
        scoreboard players operation $EPF Temporary += $Temp Temporary
    # 2
        execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[2]."minecraft:protection"
        scoreboard players operation $EPF Temporary += $Temp Temporary
    # 3
        execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[3]."minecraft:protection"
        scoreboard players operation $EPF Temporary += $Temp Temporary
# 各種エンチャントの加算
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Fire"} run function riol.cc:core/damage/get_default_epf/enchant/fire
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Blast"} run function riol.cc:core/damage/get_default_epf/enchant/blast
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Projectile"} run function riol.cc:core/damage/get_default_epf/enchant/projectile
    execute if data storage riol_api: DamageAPI.Argument{DamageType:"Fall"} run function riol.cc:core/damage/get_default_epf/enchant/fall
# リセット
    data remove storage riol_api: DamageAPI.Protection