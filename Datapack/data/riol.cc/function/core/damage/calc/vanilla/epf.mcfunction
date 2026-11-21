#> riol.cc:core/damage/calc/vanilla/epf
#
# エンチャントによる軽減を計算します。
#
# @within function riol.cc:core/damage/calc/_

# 計算式:
# damage * (1 - min(20, max(defensePoints / 5, defensePoints - damage / (2 + toughness / 4))) / 25) * (1 - (min(20, cappedEPF) / 25)) * (1 - min(5, resistanceLv) / 5)

# EPFが未設定または-1以下の時Protectionを参照
    execute store result score $EPF Temporary run data get storage riol_api: DamageAPI.Argument.EPF
    execute unless score $EPF Temporary matches 0.. run function riol.cc:core/damage/get_default_epf/_

# エンチャントによる軽減計算
    data modify storage riol_api: Calc.A set compute default float riol.cc:damage_api/epf

# リセット
    scoreboard players reset $Temp Temporary