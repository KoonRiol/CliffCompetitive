#> riol.cc:core/death/message/need_attacker/none
#
#
#
#

### deathmessageを送信
    
    # 攻撃者がプレイヤーの場合は死亡時でもログが正常に流れる...はず。
    $execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{entityType:"Player"} run tellraw @a [{"selector":"@s"},{"text":"は","color": "white"},{"selector":"@a[scores={OhMyDatID=$(attackerID)},limit=1]"},{"text":"に","color": "white"},{"text":"殺害","color": "white"},{"text":"された","color": "white"}]
    $execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{entityType:"Mob"} run tellraw @a [{"selector":"@s"},{"text":"は","color": "white"},{"selector":"@e[scores={OhMyDatID=$(attackerID)},limit=1]"},{"text":"に","color": "white"},{"text":"殺害","color": "white"},{"text":"された","color": "white"}]