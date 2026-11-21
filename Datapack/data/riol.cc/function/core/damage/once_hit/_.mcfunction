#> riol.cc:core/damage/once_hit/_
#
#
#
# @within function riol.cc:core/damage/_

### 事前準備と実行


data modify storage riol_api: Tmp.UUID0 set from entity @s UUID[0]
data modify storage riol_api: Tmp.UUID1 set from entity @s UUID[1]
data modify storage riol_api: Tmp.UUID2 set from entity @s UUID[2]
data modify storage riol_api: Tmp.UUID3 set from entity @s UUID[3]

execute as @e[tag=riol.cc.attacker,limit=1] run function #oh_my_dat:please
execute as @e[tag=riol.cc.attacker,tag=riol.cc.projectile,limit=1] run function riol.cc:core/damage/once_hit/projectile with storage riol_api: Tmp
execute as @e[tag=riol.cc.attacker,tag=riol.cc.summon_entity,limit=1] run function riol.cc:core/damage/once_hit/summon_entity with storage riol_api: Tmp

data remove storage riol_api: Tmp

