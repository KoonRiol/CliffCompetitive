#> riol.assets:api/attacker_buff/all/damage_boost
#
#
#
# @within function riol.cc:core/damage/attacker_buff/type/all/_

### スキル特有のアタッカー参照バフを取得
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"specialGauge"}] run function riol.assets:core/weapon/003.sword/skill/passive/special_gauge/damage_boost
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"bloodCost"}] run function riol.assets:core/weapon/005.gunblade/skill/passive/blood_cost/damage_boost
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"absorption"}] run function riol.assets:core/weapon/004.blade/skill/passive/absorption/damage_boost