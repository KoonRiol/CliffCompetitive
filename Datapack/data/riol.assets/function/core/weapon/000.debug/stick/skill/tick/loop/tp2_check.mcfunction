#> riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2_check
#
#
#
# @Within function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp1

    execute unless score $Tmp2 Temporary matches 1.. run tp ^ ^ ^
    execute if score $Tmp2 Temporary matches 1.. run function riol.assets:core/weapon/000.debug/stick/skill/tick/loop/tp2