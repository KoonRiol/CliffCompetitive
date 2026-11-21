#> riol.assets:api/taken_damage_effects/all/no_attacker/damage_mitigation
#
#
#
# @within function riol.cc:core/damage/calc/effects/damage_mitigation/no_attacker

### スキル特有のアタッカー参照バフを取得(ダメージ軽減)
    execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[{id:"fluctuation"}] run function riol.assets:core/weapon/002.spear/skill/passive/fluctuation/damage_mitigation