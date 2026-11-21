#> riol.cc:core/load/once/_
#
#
#
# @within riol.cc:core/load/_

### 初期起動の処理。

# バージョンを記録
data merge storage riol_api: {version:"v0.0.0.0"}

# デバッグ用設定を記録
data modify storage riol_api: _Debug.Tick set value 1b

# ゲームルール設定
gamerule natural_health_regeneration true

# スコアボードを作成
scoreboard objectives add Temporary dummy "一時スコア"
scoreboard objectives add SkillTick dummy "スキル発動に使用するTick(召喚物の経過Tickや発射物のTickにも使用される)"

scoreboard objectives add NormalAttackCD dummy "通常攻撃のクールタイム"
scoreboard objectives add WeaponSkillCD dummy "武器スキルのクールタイム"
scoreboard objectives add Skill1CD dummy "スキル1のクールタイム"
scoreboard objectives add Skill2CD dummy "スキル2のクールタイム"
scoreboard objectives add UltimateCD dummy "必殺技のクールタイム"
# クールタイムティック,初期値50で1000に達するとクールタイム1秒として記録される
scoreboard objectives add NormalAttackCD_tick dummy "通常攻撃のクールタイムティック"
scoreboard objectives add WeaponSkillCD_tick dummy "武器スキルのクールタイムティック"
scoreboard objectives add Skill1CD_tick dummy "スキル1のクールタイムティック"
scoreboard objectives add Skill2CD_tick dummy "スキル2のクールタイムティック"
scoreboard objectives add UltimateCD_tick dummy "必殺技のクールタイムティック"

scoreboard objectives add DisplayKill dummy "ディスプレイをキルするためのタイマー"
scoreboard objectives add DeathTrigger deathCount "ゲーム内ダメージ以外での死亡を検知するために使う"
scoreboard objectives add DamageTaken minecraft.custom:minecraft.damage_taken "vanillaダメージの検知"
scoreboard objectives add DamageAbsorbed minecraft.custom:minecraft.damage_absorbed "vanillaダメージの検知その2"
scoreboard objectives add KDScore dummy "スコア"
scoreboard players set $2 Temporary 2
scoreboard players set $3 Temporary 3
scoreboard players set $4 Temporary 4
scoreboard players set $5 Temporary 5
scoreboard players set $10 Temporary 10
scoreboard players set $20 Temporary 20
scoreboard players set $25 Temporary 25
scoreboard players set $100 Temporary 100
scoreboard players set $2000 Temporary 2000
scoreboard players set $10000 Temporary 10000
scoreboard players set $20000 Temporary 20000
scoreboard players set $2^19 Temporary 524288