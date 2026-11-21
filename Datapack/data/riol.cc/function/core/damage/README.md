# DamageAPI

このAPIは[Chen氏のScoreDamage](https://github.com/ChenCMD/MCCMD-ScoreDamage/releases/latest/download/MCCMD-ScoreDamage.zip)を改造したものになります。

## 動作確認済みバージョン / Verified minecraft versions

26.3

## 使い方/How To Use

### 基本

```mcfunction
ストレージに情報を入れて
function #oh_my_dat:please
data modify storage riol_api: DamageAPI.Argument.Damage set value 10.0f
data modify storage riol_api: DamageAPI.Argument.DamageType set value "NormalAttack"
data modify storage riol_api: DamageAPI.Argument.ElementType set value "None"
...

攻撃者側のバフを計算して(任意)
execute as <攻撃者> run function riol.cc:core/damage/attacker_buff/_

実行！
execute as <被攻撃者> at @s run function riol.cc:core/damage/_

そして必ずリセット
data remove storage riol_api: DamageAPI

```

### こんな使い方もできます

```mcfunction

```

### 既知の仕様(・・・という名の不具合)

エンティティとプレイヤーがお互いの攻撃で致死ダメージを同時に受けた場合、エンティティのダメージは攻撃者がいないダメージに置き換えられる。

死亡したエンティティ(プレイヤー以外)が攻撃者の場合、死亡ログの攻撃者が空白になる。

ログアウトしたプレイヤーは攻撃を行うことができない。また、ログアウト中にキルをした場合の報酬も受け取ることができない。
