
    #移動用のデータ変更
    execute as @e[tag=init,type=text_display,tag=normal] run data merge entity @s {interpolation_duration:20,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.0f,2.0f,2.0f]}}
    execute as @e[tag=init,type=text_display,tag=whirlwind] run data merge entity @s {interpolation_duration:20,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[4.0f,4.0f,4.0f]}}

    #TPで移動
    execute as @e[tag=init,type=text_display] at @s run tp @s ~ ~0.5 ~
    
    #初期化タグを削除
    tag @e[tag=init,type=text_display] remove init