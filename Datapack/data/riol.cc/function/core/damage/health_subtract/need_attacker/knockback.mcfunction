#
#
#
#
#

### 攻撃者がいるダメージ。(ノックバックあり)
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Player} at @s run damage @s $(Damage) riol.cc:knockback by @a[scores={OhMyDatID=$(attackerID)},limit=1]
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Mob} if entity @e[scores={OhMyDatID=$(attackerID)},limit=1] at @s run damage @s $(Damage) riol.cc:knockback by @e[scores={OhMyDatID=$(attackerID)},limit=1]
$execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0].entityType{_:Mob} unless entity @e[scores={OhMyDatID=$(attackerID)},limit=1] at @s run damage @s $(Damage) riol.cc:attack
#$say "Damage:$(Damage) attacker:$(attackerID)"