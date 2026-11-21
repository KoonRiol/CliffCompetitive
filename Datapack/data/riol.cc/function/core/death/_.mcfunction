#> riol.cc:core/death/_
#
#
#
#

### 死亡処理をします。

    # ゲームルールを変更
    execute if entity @s[type=player] run gamerule show_death_messages false

    # デスメッセージを表示
    execute if entity @s[type=player] unless score @s DeathTrigger matches 1.. if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{noOwner:1b} if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{damageName:"None"} run function riol.cc:core/death/message/no_attacker/none
    execute if entity @s[type=player] unless score @s DeathTrigger matches 1.. if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.attackerID if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{damageName:"None"} run function riol.cc:core/death/message/need_attacker/none with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData
    execute if entity @s[type=player] unless score @s DeathTrigger matches 1.. if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData.attackerID if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{damageName:"000.Debug.Stick_NormalAttack"} run function riol.cc:core/death/message/need_attacker/debug/normal_attack with storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData
    
    # キル
    execute unless score @s DeathTrigger matches 1.. run kill @s
    execute if entity @s[type=player] run scoreboard players reset @s DeathTrigger
    
    # ステータスを戻す&ポイントを減算(デスペナ)
    execute if entity @s[type=player] run function riol.cc:core/death/init/_
    
    # ゲームモードを戻したりいろいろ事後処理
    gamerule show_death_messages true
    tag @s remove Death
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData
