#> riol.cc:core/death/message/need_attacker/debug/normal_attack
#
#
#
#

### deathmessageを送信
    
    # 攻撃者がプレイヤーの場合は死亡時でもログが正常に流れる...はず。
    $execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{entityType:"Player"} run tellraw @a [{"selector":"@s"},{"text":"は","color": "white"},{"selector":"@a[scores={OhMyDatID=$(attackerID)},limit=1]"},{"text":"の","color": "white"},{text:"⚔",color:aqua},{"text":"通常攻撃","color": "white"},{text:"⚔",color:aqua},{"text":"で倒された","color": "white"}]
    $execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DamageAPI.deathData{entityType:"Mob"} run tellraw @a [{"selector":"@s"},{"text":"は","color": "white"},{"selector":"@e[scores={OhMyDatID=$(attackerID)},limit=1]"},{"text":"の","color": "white"},{text:"⚔",color:aqua},{"text":"通常攻撃","color": "white"},{text:"⚔",color:aqua},{"text":"で倒された","color": "white"}]