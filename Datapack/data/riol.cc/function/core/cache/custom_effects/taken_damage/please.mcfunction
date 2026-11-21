#> riol.cc:core/cache/custom_effects/taken_damage/please
#
#
#
#

### キャッシュよ出でよ！

#チェックチェック！
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run function riol.cc:core/cache/custom_effects/taken_damage/check

#キャッシュゲットだぜ！
# ストレージから自動で取得

# キャッシュないみたい...
execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker{requirementReset:0b} run function riol.cc:core/damage/calc/effects/no_attacker
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker{requirementReset:0b} run function riol.cc:core/damage/calc/effects/need_attacker


# キャッシュ保存したならちゃんと値変えないとねぇ...
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker.requirementReset set value 0b
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 0b