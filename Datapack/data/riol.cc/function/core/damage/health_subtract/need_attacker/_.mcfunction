#
#
#
#
#

### 攻撃者がいるダメージ。
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Player} run damage @s $(Damage) riol.cc:attack by @a[scores={OhMyDatID=$(attackerID)},limit=1]
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Mob} if entity @e[scores={OhMyDatID=$(attackerID)},limit=1] run damage @s $(Damage) riol.cc:attack by @e[scores={OhMyDatID=$(attackerID)},limit=1]
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Mob} unless entity @e[scores={OhMyDatID=$(attackerID)},limit=1] run damage @s $(Damage) riol.cc:attack