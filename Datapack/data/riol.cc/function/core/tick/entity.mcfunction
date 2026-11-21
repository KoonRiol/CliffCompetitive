#> riol.cc:core/tick/entity
#
#
#
# 

### エンティティの毎Tickの処理

# キャッシュを保存
execute as @e[tag=mobCache,type=!player,scores={OhMyDatID=-2147483648..2147483647}] run function riol.cc:core/cache/tick

#
