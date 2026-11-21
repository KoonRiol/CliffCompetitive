#> riol.assets:core/weapon/000.debug/stick/normal_attack/_
#
#
#
#

### デバッグスティックの通常攻撃
    
    # カスタムデータをストレージにコピー
    execute if entity @s[type=player] run data modify storage riol_api: Tmp.custom_data set from entity @s SelectedItem.components."minecraft:custom_data".riol_cc.item
    
    # 攻撃処理
    execute if data storage riol_api: Tmp.custom_data.normal_attack{_:0b} at @s run function riol.assets:core/weapon/000.debug/stick/normal_attack/0
    execute if data storage riol_api: Tmp.custom_data.normal_attack{_:1b} unless score $Tmp Temporary matches 1 at @s run function riol.assets:core/weapon/000.debug/stick/normal_attack/1
    
    # 変更後のデータを適用
    item modify entity @s weapon.mainhand riol.cc:copy_custom_data

    # リセット
    scoreboard players reset $Tmp Temporary
    data remove storage riol_api: Tmp.custom_data
    tag @s remove riol.cc.trigger.left_click