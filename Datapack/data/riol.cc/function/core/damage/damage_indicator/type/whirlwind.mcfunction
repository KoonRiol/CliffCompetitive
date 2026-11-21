#> riol.cc:core/damage/damage_indicator/type/whirlwind
#
#
#
#

### 旋風ダメージ表示の召喚。

    #ディスプレイを召喚
    $summon text_display ~$(IndicatorPosX) ~$(IndicatorPosY) ~$(IndicatorPosZ) {billboard:"center",shadow:0b,see_through:1b,alignment:"center",Tags:["damageDisplay","init","whirlwind"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:[{"font":"damage/whirlwind","text":"\u0B01"},{"font":"default","translate":"space.-1"},{"font":"default","translate":"space.-5/20"},{"text":"\u0B02\n$(Damage)"}],background:16711680,teleport_duration:100}