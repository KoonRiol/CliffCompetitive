#> riol.cc:core/damage/_
#
# 実行者のエンティティにダメージを与えます。
#
# 実行者はHealthを持つEntityである必要があります。
#
# @input storage riol_api:
#   DamageAPI.Argument.Damage: float
#       与えるダメージを入力
#   DamageAPI.Argument.DealtReceivedDamage: List
#       valueとtargetIdで構成されるListで、idが一致した場合、被ダメージデバフがかかります。(例)DamageAPI.Argument.DealtReceivedDamage[{value:20.0f,targetId:34567}]
#   DamageAPI.Argument.DefenseBreak: float
#       防御貫通の値(%)をfloatで入力(Max 100.00)
#   DamageAPI.Argument.EPF: int
#       軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値
#   DamageAPI.Argument.DamageName: String
#       ダメージの名前 キルログに使用します。
#   DamageAPI.Argument.DamageType: "None" | "Fire" | "Blast" | "Projectile" | "Fall" | "Skill" | "NormalAttack" | "Ultimate" | "WeaponSkill" | "DoT" | "TrueDamage" | "FollowUpAttack"
#       ダメージの種類 EPFを自動取得する場合にどのエンチャントを参照するかや与ダメージの計算に関わります
#   DamageAPI.Argument.ElementType: "None" | "Blast" | "Fire" | "Wind" | "Lightning" | "Water" | "Sakura"
#       ダメージの属性 今はまだ何もないです
#   DamageAPI.Argument.MultiHitBlock: boolean
#       多段ヒットを防ぐか否か。, bool値
#   DamageAPI.Argument.BypassAll: boolean
#       すべての耐性、クールタイムを無視するか否か(与ダメージ係数などは乗る。), bool値
#   DamageAPI.Argument.NoDamageUP: boolean
#       与ダメージ係数を無視するか否か, bool値
#   DamageAPI.Argument.BypassArmor: boolean
#       防御力を無視するか否か, bool値
#   DamageAPI.Argument.BypassResistance: boolean
#       耐性エフェクトを無視するか否か, bool値
#   DamageAPI.Argument.BypassEPF: boolean
#       エンチャントのダメージ軽減を無視するか否か, bool値
#   DamageAPI.Argument.BypassCooldown: boolean
#       無敵時間を無視するか否か, bool値
#   DamageAPI.Argument.NoKnockback: boolean
#       ノックバックを無視するか否か, bool値
#   DamageAPI.EntityDamageSource: boolean
#       エンティティがダメージの要因かどうかを指定します DamageAPI.Attackerが必須です, bool値
#   DamageAPI.Attacker: int
#       ダメージの要因となるEntityのOhMyDatIDを指定します EntityDamageSourceがtrueでない場合は効果がないです
# @context EPFが-1以下の時 EntityのProtectionを参照します
# @api

### ダメージを計算し、与えます



# 引数チェック
execute unless data storage riol_api: DamageAPI.Argument.Damage run return run function riol.assets:core/error/damage_api/001.missing_damage
execute if data storage riol_api: DamageAPI{EntityDamageSource:1b} unless data storage riol_api: DamageAPI.Attacker run return run function riol.assets:core/error/damage_api/002.missing_damagesource
execute unless data storage riol_api: DamageAPI.Argument.DamageType run data modify storage riol_api: DamageAPI.Argument.DamageType set value "None"
execute unless data storage riol_api: DamageAPI.Argument.ElementType run data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
execute unless data storage riol_api: DamageAPI.Argument.EPF run data modify storage riol_api: DamageAPI.Argument.EPF set value -1
execute unless data storage riol_api: DamageAPI.Argument.DefenseBreak run data modify storage riol_api: DamageAPI.Argument.DefenseBreak set value 0.0f
execute unless data storage riol_api: DamageAPI.Argument.BypassAll run data modify storage riol_api: DamageAPI.Argument.BypassAll set value 0b
execute unless data storage riol_api: DamageAPI.Argument.BypassArmor run data modify storage riol_api: DamageAPI.Argument.BypassArmor set value 0b
execute unless data storage riol_api: DamageAPI.Argument.BypassResistance run data modify storage riol_api: DamageAPI.Argument.BypassResistance set value 0b
execute unless data storage riol_api: DamageAPI.Argument.BypassEPF run data modify storage riol_api: DamageAPI.Argument.BypassEPF set value 0b
execute unless data storage riol_api: DamageAPI.Argument.BypassCooldown run data modify storage riol_api: DamageAPI.Argument.BypassCooldown set value 1b
execute unless data storage riol_api: DamageAPI.Argument.NoKnockback run data modify storage riol_api: DamageAPI.Argument.NoKnockback set value 0b
execute unless data storage riol_api: DamageAPI.EntityDamageSource run data modify storage riol_api: DamageAPI.EntityDamageSource set value 0b
execute unless data storage riol_api: DamageAPI.Argument.DamageName run data modify storage riol_api: DamageAPI.Argument.DamageName set value "None"
execute unless data storage riol_api: DamageAPI.Argument.MultiHitBlock run data modify storage riol_api: DamageAPI.Argument.MultiHitBlock set value 0b
execute if data storage riol_api: DamageAPI.Argument{MultiHitBlock:1b} run function riol.cc:core/damage/once_hit/_
execute if data storage riol_api: DamageAPI.Argument{MultiHitBlock:1b} if data storage riol_api: DamageAPI{DamageCancel:1b} run return run data remove storage riol_api: DamageAPI.DamageCancel

# モブキャッシュを保存
execute if entity @s[type=!player,tag=!mobCache] run function riol.cc:core/cache/_
execute if entity @s[type=!player,tag=!mobCache] run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Cache_mobTick._ set value 1
execute if entity @s[type=!player,tag=!mobCache] run tag @s add mobCache
# ストレージにアクセス
execute if entity @s[tag=mobCache] run function #oh_my_dat:please
execute if entity @s[type=player] run function #oh_my_dat:please

# キャッシュ確認
function riol.cc:core/cache/custom_effects/taken_damage/please


# アタッカーのidをスコアボードに入れておこう。
execute if data storage riol_api: DamageAPI.Attacker store result score $Attacker Temporary run data get storage riol_api: DamageAPI.Attacker
# ダメージをDamageに事前代入
data modify storage riol_api: Calc.Damage set from storage riol_api: DamageAPI.Argument.Damage
# 軽減率を計算して適用
execute if data storage riol_api: DamageAPI.Argument{BypassAll:true} run data modify storage riol_api: DamageAPI.Output.Damage set from storage riol_api: DamageAPI.Argument.Damage
execute if data storage riol_api: DamageAPI.Argument{DamageType:"TrueDamage"} run data modify storage riol_api: DamageAPI.Output.Damage set from storage riol_api: DamageAPI.Argument.Damage
execute unless data storage riol_api: DamageAPI.Argument{DamageType:"TrueDamage"} unless data storage riol_api: DamageAPI.Argument{BypassAll:true} run function riol.cc:core/damage/calc/_


# ダメージを与える(データに書き込み)
## ListにDamageとAttackerIDを記録する。
function riol.cc:core/damage/damage_write/_
## damageIndicatorを表示 ※100倍で偽装表示
execute store result storage riol_api: DamageAPI.Output.Damage int 1 run data get storage riol_api: DamageAPI.Output.Damage 100
function riol.cc:core/damage/damage_indicator/_


# ダメージタグを付与
execute unless data storage riol_api: DamageAPI.Output{Damage:0i} run tag @s add isHurt

# リセット
scoreboard players reset $Attacker Temporary
scoreboard players reset $Damage Temporary
scoreboard players reset $HighestValue Temporary
data remove storage riol_api: DamageAPI.Output
data remove storage riol_api: Calc

# このダメージが追加攻撃ではない、そして自身に追加攻撃デバフが付いている時、さらに追加ダメージを与える。
# まだいいや