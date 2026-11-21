#> riol.assets:core/weapon/000.debug/stick/skill/_
#
#
#
#

### デバッグスティックのスキル[遠距離]
    
    # 召喚
    execute anchored eyes run summon item_display ^ ^ ^ {Tags:["riol.cc.projectile","riol.cc.trigger.tick","riol.cc.000debug_stick.projectile_skill","riol.cc.init"],item:{id:"minecraft:stick",components:{"minecraft:item_model":"riol.cc:000.debug_stick/skill_entity/idle","minecraft:custom_model_data":{floats:[0,0]}}},teleport_duration:1,item_display:"firstperson_lefthand",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[4f,4f,4f]}}
    execute as @e[tag=riol.cc.init] run function #oh_my_dat:please
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].ProjectileData.Owner int 1 run scoreboard players get @s OhMyDatID
    execute anchored eyes run tp @e[tag=riol.cc.init] ^ ^ ^ ~ ~
    scoreboard players set @e[tag=riol.cc.init] SkillTick -1
    tag @e[tag=riol.cc.init] remove riol.cc.init

    #音
    function riol.assets:core/visual/sound/debug/skill/_

    tag @s remove riol.cc.trigger.right_click