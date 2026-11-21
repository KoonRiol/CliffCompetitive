#> riol.cc:core/custom_effect/add 
#
# カスタムステータス(エフェクト)を付与します。
#
# @input storage riol_api:
#   CustomEffects.Argument.value: float
#       効果量を入力
#   CustomEffects.Argument.duration._: int or infinity(string)
#       効果時間を入力，tick 
#   CustomEffects.Argument.name: string
#       開発者用の名前を入力
#   CustomEffects.Argument.group: "bow" | "sword" | "spear"
#       武器によって付与された場合のグループ。
#   CustomEffects.Argument.type: "add" | "mul" | "DoT" | "nore" | "FUA"
#       適用方式を入力, add, mulはステータス系にのみ影響，DoTは持続ダメージ，noreはスキル側で設定するため空白のエフェクト。
#   CustomEffects.Argument.id: 
#       "defenseBoost"(防御力上昇)
#       "defenseDown"(防御力減少)
#       "receivedDamage(被ダメージ上昇)"
#       "damageMitigation(ダメージ軽減)"
#
#       "attackDamage(攻撃力)"
#       "normalAttack_attackDamage(通常攻撃攻撃力)"
#
#       "damageBoost(与ダメージ増加)"
#       "normalAttack_damageBoost(通常攻撃ダメージ増加)"
#       "ultimate_damageBoost(必殺技ダメージ増加)"
#       "skill_damageBoost(武器スキルダメージ増加)"
#       "dot_damageBoost(持続ダメージ増加)"
#
#       "defenseBreak(防御貫通)"
#       "normalAttack_defenseBreak(通常攻撃ダメージ防御貫通)"
#       "ultimate_defenseBreak(必殺技ダメージ防御貫通)"
#       "skill_defenseBreak(武器スキルダメージ防御貫通)"
#       "dot_defenseBreak(持続ダメージ防御貫通)"
#
# 未実装 "regenBoost(回復速度上昇)"
#
#   ここから下は特殊カスタムエフェクト   
#       特殊カスタムエフェクトの特徴
#       ・基本的には複数付与されない。
#       ・複数回付与された場合、内部の層数・ゲージ量が増える(層数・ゲージ量には上限が設定されていることがある)
#       ・基本エフェクトとは違い、一つのエフェクトで効果が複数ある場合がある。
#       ・特殊カスタムエフェクトの処理はriol.assets内で記入する。
#       ・また、継続時間などの処理も特殊な場合が多いため、riol.assets内ですべて処理を行う。
#       
#       "specialGauge(奥義ゲージ, sakuraSword用)"
#       "fluctuation(揺らぎ，waterSpear用)"
#       "whirlWind(旋風，windBow用)"
#       "bloodCost(血の代償，gunBlade用)"
#       "absorption(吸収, lightningBlade用)"
#       
#       効果idを入力
#   CustomEffects.Argument.damageInterval: int
#       効果が発生してから次の効果を発生させるまでの時間を入力，主にDotで使用する。
#       (毎tickこの値が加算されていき、1000に到達したら1000で割った値の回数分効果が発生し、その数の1000倍を値から減算する) 
#   CustomEffects.Argument.isOwner: boolean
#       付与元のエンティティが存在するかどうか(また、被攻撃時のエフェクトは付与元のエンティティから攻撃されたときのみ適用されるようになる。)，bool値
#   CustomEffects.Argument.owner: int
#       付与元のエンティティのOhMyDatID(IsOwnerがtrueの時は必須。trueでないときは被攻撃時のエフェクト処理を限定しない。付与元を特定するためだけに使用される。)
#   CustomEffects.Argument.target: int or this
#       効果ターゲットのエンティティのOhMyDatID(付与されたエンティティがターゲットとは限らないため)
#   CustomEffects.Argument.deathReset: boolean
#     死んだときにこのステータスをリセットするか否か，bool値
#   CustomEffects.Argument.treatable: boolean
#     ステータス解除スキルで解除できるか否か，bool値

function #oh_my_dat:please
execute unless data storage riol_api: CustomEffects.Argument.isOwner run data modify storage riol_api: CustomEffects.Argument.isOwner set value 0b
execute if data storage riol_api: CustomEffects.Argument{isOwner:1b} run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.needAttacker.requirementReset set value 1b
execute if data storage riol_api: CustomEffects.Argument{isOwner:0b} run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffectsCache.takenDamage.noAttacker.requirementReset set value 1b

data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].CustomEffects append from storage riol_api: CustomEffects.Argument

# 例)
# data modify storage riol_api: CustomEffects.Argument set value {name:"ダメージ増加(1%)",value:1.0f,duration:{_:100},type:"mul",id:"receivedDamage",isOwner:0b,target:"this",deathReset:0b,treatable:0b}

#data remove storage riol_api: CustomEffects