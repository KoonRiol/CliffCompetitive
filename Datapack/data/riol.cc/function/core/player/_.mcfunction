#> riol.cc:core/player/_
#
#

### プレイヤーの毎Tick処理

# IDがないときにストレージを作成
execute as @a[tag=!Player] run function riol.cc:core/player/init/_

# キャッシュを保存
execute as @a[tag=Player] run function riol.cc:core/cache/_