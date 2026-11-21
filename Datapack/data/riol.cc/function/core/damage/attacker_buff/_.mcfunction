#> riol.cc:core/damage/attacker_buff/_
#
# @input storage riol_api:
#   DamageAPI.Argument.DamageType: "None" | "Fire" | "Blast" | "Projectile" | "Fall" | "Skill" | "NormalAttack" | "Ultimate" | "WeaponSkill" | "DoT" | "TrueDamage"
#       ダメージの種類 EPFを自動取得する場合にどのエンチャントを参照するかや与ダメージの計算に関わります
#   DamageAPI.Argument.ElementType: "None" | "Blast" | "Fire" | "Wind" | "Lightning" | "Water" | "Sakura"
# @api

### 攻撃者側のバフを計算して代入します。

# ストレージにアクセス
function #oh_my_dat:please

# 引数チェック！
execute unless data storage riol_api: DamageAPI.Argument.Damage run tellraw @a [{"text":"[ERROR]>> ","color":"red"},{"text":"引数が足りません","color":"white"},{"text":"\nMissing Damage at riol.cc:core/damage/attacker_buff","color":"white"}]
execute unless data storage riol_api: DamageAPI.Argument.DamageType run data modify storage riol_api: DamageAPI.Argument.DamageType set value "None"
execute unless data storage riol_api: DamageAPI.Argument.ElementType run data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
execute unless data storage riol_api: DamageAPI.Argument.NoDamageUP run data modify storage riol_api: DamageAPI.Argument.NoDamageUP set value 0b

# ついでに攻撃者を設定してあげるね！
data modify storage riol_api: DamageAPI.EntityDamageSource set value 1b
execute store result storage riol_api: DamageAPI.Attacker int 1 run scoreboard players get @s OhMyDatID

# 固定ダメージではないことを確認して...いっけぇ！！
execute unless data storage riol_api: DamageAPI.Argument{BypassAll:1b} unless data storage riol_api: DamageAPI.Argument{DamageType:"TrueDamage"} unless data storage riol_api: DamageAPI.Argument{NoDamageUP:1b} run function riol.cc:core/damage/attacker_buff/calc

# リセット
#これ何に必要だったん？↓
#scoreboard players reset #Buff Temporary