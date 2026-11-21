#> riol.cc:core/damage/get_default_epf/from_player
#
# プレイヤー(mob)のエンチャントデータを取得します
#
# @within function riol.cc:core/damage/get_default_epf/_

# 負荷軽減のためにstorageに入れる
    data modify storage riol_api: DamageAPI.Equipment set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache.NBT.equipment
# プロテクション抽出
    data modify storage riol_api: DamageAPI.Protection append from storage riol_api: DamageAPI.Equipment.head.components."minecraft:enchantments"
    data modify storage riol_api: DamageAPI.Protection append from storage riol_api: DamageAPI.Equipment.chest.components."minecraft:enchantments"
    data modify storage riol_api: DamageAPI.Protection append from storage riol_api: DamageAPI.Equipment.legs.components."minecraft:enchantments"
    data modify storage riol_api: DamageAPI.Protection append from storage riol_api: DamageAPI.Equipment.feet.components."minecraft:enchantments"
# インベントリ削除
    data remove storage riol_api: DamageAPI.Equipment