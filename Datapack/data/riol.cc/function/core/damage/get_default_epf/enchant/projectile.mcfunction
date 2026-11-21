#> riol.cc:core/damage/get_default_epf/enchant/projectile
#
# 飛び道具耐性のEPFを取得します
#
# @within function riol.cc:core/damage/get_default_epf/_

# 0
    execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[0]."minecraft:projectile_protection"
    scoreboard players operation $Temp Temporary *= $2 Temporary
    scoreboard players operation $EPF Temporary += $Temp Temporary
# 1
    execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[1]."minecraft:projectile_protection"
    scoreboard players operation $Temp Temporary *= $2 Temporary
    scoreboard players operation $EPF Temporary += $Temp Temporary
# 2
    execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[2]."minecraft:projectile_protection"
    scoreboard players operation $Temp Temporary *= $2 Temporary
    scoreboard players operation $EPF Temporary += $Temp Temporary
# 3
    execute store result score $Temp Temporary run data get storage riol_api: DamageAPI.Protection[3]."minecraft:projectile_protection"
    scoreboard players operation $Temp Temporary *= $2 Temporary
    scoreboard players operation $EPF Temporary += $Temp Temporary