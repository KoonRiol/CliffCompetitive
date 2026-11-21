#> riol.cc:core/cache/tick
#
#
#
#

### mob用のTick処理

# キャッシュ保存しますべー
function #oh_my_dat:please
execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} run function riol.cc:core/cache/_

execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} run tag @s remove mobCache
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects[0] unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.Data[0] run function riol.cc:core/cache/release
execute unless entity @s[tag=riol.Release] if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache run data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache
execute unless entity @s[tag=riol.Release] unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick{_:0} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick._ store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick._ int 0.9999999999 run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick._
tag @s remove riol.Release