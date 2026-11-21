#> riol.cc:core/death/message/test
#
#
#
#

### deathmessageを送信
    
    # ゲームルールを変更
    gamerule show_death_messages false
    tellraw @a ["Test","は",{"color":"gold","text":"Endo"},{"color":"white","text":"による"},{"color":"gold","shadow_color":-10000,"text":"通常攻撃"},{"color":"white","text":"によってやられた"}]
    # サンプル
    # tellraw @a ["MotoJP","は",{"color":"gold","text":"Endo, "},{"color":"gold","text":"Tanaka, "},{"color":"gold","text":"Yamaguti"},{"color":"white","text":"による"},{"color":"gold","shadow_color":-64184,"text":"連携攻撃"},{"color":"white","text":"によってやられた"}]