#> riol.cc:core/damage/health_subtract/_
#
#
#
#

### 体力を減算する

# HP
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.Health set from entity @s Health
# Loop
function riol.cc:core/damage/health_subtract/loop
# 死亡tagが付いている場合、演出だけを鳴らす。
execute if entity @s[tag=Death] run effect give @s resistance infinite 5 true
execute if entity @s[tag=Death] run damage @s 0.0000001 riol.cc:sound


# 使い終わったものはないない
execute if entity @s[tag=!Death] run data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data
tag @s remove isHurt
