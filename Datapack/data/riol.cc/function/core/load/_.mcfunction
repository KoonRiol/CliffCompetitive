#> riol.cc:core/load/_
#
#
#
#

### Reload時の処理

# バージョンデータがあるかを見て初期Loadを行う。
execute unless data storage riol_api: version run function riol.cc:core/load/once/_

# スキルダメージの初期設定
## 基礎倍率
tellraw @a ["",{text:"[INFO]>>",color:"#608aff"},{text:" DATABASE: WindBow の初期倍率を確認しています..."}]
execute unless data storage riol_api: _Database.WindBow.baseAttack run tellraw @a ["",{text:"[INFO]>>",color:"#608aff"},{text:" DATABASE: WindBow の初期倍率が未設定です。初期値(30)に設定しました。"}]
execute unless data storage riol_api: _Database.WindBow.baseAttack run data modify storage riol_api: _Database.WindBow.baseAttack set value 30

tellraw @a ["",{text:"[INFO]>>",color:"#608aff"},{text:" すべてのデータベースの確認が終了しました。",color:"gold"}]


# メモ
# summon text_display ~ ~ ~ {billboard:"center",shadow:0b,see_through:1b,alignment:"center",Tags:["display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:[{"font":"damage/whirlwind","text":"\u0B01"},{"font":"default","translate":"space.-1"},{"font":"default","translate":"space.-5/20"},{"text":"\u0B02\n2147483647"}],background:16711680}