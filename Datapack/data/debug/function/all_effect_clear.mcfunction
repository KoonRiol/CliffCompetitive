function #oh_my_dat:please
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 1b
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker.requirementReset set value 1b
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[]