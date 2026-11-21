#> riol.cc:core/tick/_
#
#
#
# 

### 毎Tickの処理を発火

# 時止め関係なく実行
execute if entity @e[tag=init,type=text_display] run function riol.cc:core/damage/damage_indicator/tp/_
# ダメージ表記エンティティを削除
execute as @e[tag=damageDisplay,type=text_display] run function riol.cc:core/tick/damage_display

# Tick停止データがあるときは止める
execute if data storage riol_api: _Debug{Tick:0b} run return fail

# プレイヤーのTick処理(Cache)
function riol.cc:core/player/_
# エンティティのTick処理(Cacheなど)
function riol.cc:core/tick/entity

# Trigger発火(NormalAttack, Skill, Ultimate,etc...)
function riol.assets:triggar/_

# Tickの最後の処理。(DoT, 一括Damage, Death, CustomEffectDuration, )
execute as @e[scores={OhMyDatID=1..}] run function riol.cc:core/post/_