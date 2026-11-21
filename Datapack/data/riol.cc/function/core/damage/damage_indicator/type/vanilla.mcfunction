#> riol.cc:core/damage/damage_indicator/type/vanilla
#
#
#
#

### 通常のダメージ表示を召喚

    #ディスプレイを召喚
    $summon text_display ~$(IndicatorPosX) ~$(IndicatorPosY) ~$(IndicatorPosZ) {billboard:"center",shadow:0b,see_through:1b,alignment:"center",Tags:["damageDisplay","init","normal"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"font":"damage/vanilla_damage","text":"\n$(Damage)","color":"#FFFFFF"}],background:16711680,teleport_duration:100}