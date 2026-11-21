#> riol.cc:core/damage/once_hit/projectile
#
#
#
# @within function riol.cc:core/damage/once_hit/_

### 発射物のUUIDと比較。

$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.AttackList[{UUID0:$(UUID0),UUID1:$(UUID1),UUID2:$(UUID2),UUID3:$(UUID3)}] run data modify storage riol_api: DamageAPI.DamageCancel set value 1b
$execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.AttackList[{UUID0:$(UUID0),UUID1:$(UUID1),UUID2:$(UUID2),UUID3:$(UUID3)}] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.AttackList append from storage riol_api: Tmp