#> riol.cc:core/cache/_
#
#
#
#

### Attributeキャッシュを取得します

function #oh_my_dat:please
#data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT set from entity @s

data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.Health set from entity @s Health
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.AbsorptionAmount set from entity @s AbsorptionAmount
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.equipment set from entity @s equipment

execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.armor float 0.001 run attribute @s armor get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.armor_toughness float 0.001 run attribute @s armor_toughness get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.attack_damage float 0.001 run attribute @s attack_damage get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.attack_knockback float 0.0001 run attribute @s attack_knockback get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.attack_speed float 0.0001 run attribute @s attack_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.block_break_speed float 0.0001 run attribute @s block_break_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.block_interaction_range float 0.0001 run attribute @s block_interaction_range get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.burning_time float 0.0001 run attribute @s burning_time get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.camera_distance float 0.001 run attribute @s camera_distance get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.entity_interaction_range float 0.0001 run attribute @s entity_interaction_range get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.explosion_knockback_resistance float 0.0001 run attribute @s explosion_knockback_resistance get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.fall_damage_multiplier float 0.001 run attribute @s fall_damage_multiplier get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.flying_speed float 0.0001 run attribute @s flying_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.follow_range float 0.001 run attribute @s follow_range get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.gravity float 0.0001 run attribute @s gravity get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.jump_strength float 0.001 run attribute @s jump_strength get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.knockback_resistance float 0.0001 run attribute @s knockback_resistance get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.luck float 0.001 run attribute @s luck get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.max_absorption float 0.001 run attribute @s max_absorption get 1000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.max_health float 0.001 run attribute @s max_health get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.mining_efficiency float 0.0001 run attribute @s mining_efficiency get 10000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.movement_speed float 0.0001 run attribute @s movement_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.oxygen_bonus float 0.001 run attribute @s oxygen_bonus get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.safe_fall_distance float 0.001 run attribute @s safe_fall_distance get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.scale float 0.0001 run attribute @s scale get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.sneaking_speed float 0.0001 run attribute @s sneaking_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.spawn_reinforcements float 0.0001 run attribute @s spawn_reinforcements get 10000
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.step_height float 0.01 run attribute @s step_height get 100
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.submerged_mining_speed float 0.0001 run attribute @s submerged_mining_speed get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.sweeping_damage_ratio float 0.001 run attribute @s sweeping_damage_ratio get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.tempt_range float 0.001 run attribute @s tempt_range get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.water_movement_efficiency float 0.0001 run attribute @s water_movement_efficiency get 10000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.waypoint_receive_range float 0.001 run attribute @s waypoint_receive_range get 1000
# execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.Attribute.waypoint_transmit_range float 0.001 run attribute @s waypoint_transmit_range get 1000