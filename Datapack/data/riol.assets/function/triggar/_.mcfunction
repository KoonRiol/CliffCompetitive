#> riol.assets:triggar/_
#
#
#
# @within riol.cc:core/tick/_

### トリガー系の処理を行います。

execute as @a[tag=riol.cc.trigger.left_click] at @s run function riol.assets:triggar/left_click/_
execute as @a[tag=riol.cc.trigger.right_click] at @s run function riol.assets:triggar/right_click/_
execute as @e[tag=riol.cc.trigger.tick] at @s run function riol.assets:triggar/tick/_