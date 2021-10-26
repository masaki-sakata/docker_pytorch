# Docker Pytorch環境構築
Pytorchでの日本語自然言語処理の分析環境を用意するための Docker ファイル

## バージョン
```
Docker version 20.10.3
```
## 使用するDockerイメージ
nvidiaが提供しているPytorchイメージ
https://ngc.nvidia.com/catalog/containers/nvidia:pytorch

## パッケージ
- pytorch
- gensim
- MeCab
  -  mecab-python3
  -  mecab-ipadic-neologd
  -  neologdn
- numpy
- optuna
- pandas
- matplotlib
- scikit-learn
- seaborn
- transformers
- fugashi
- tqdm
- apex
- seqeval
- mlflow

# 実際にコンテナを起動してみる
コンテナの起動には主に`docker-compose` を利用する方法と利用しない方法の2種類あります．  
2つの方法を以下に紹介します．**個人的にはdocker-compose を利用する方法が楽です．**  
**※以下作業はcloneしたディレクトリ内で行ってください**
```
cd docker_pytorch/
```

# docker-compose を利用する方法
## イメージを作成 & コンテナを作成&起動
docker-compose は複数のコンテナを同時に立ち上げてくれるものですが，ひとつのコンテナを立ち上げるのにも便利です．  
docker-compose.yml にあらかじめオプションを記述することで各コンテナの起動時の設定などができます．  
これを利用することによって「docker-compose を利用しない方法」に書いてあるようなbuildやrunコマンド時の煩雑なオプション指定をいちいち入力しなくてもよくなります．  
docker-compose.yml のあるディレクトリに移動して  
以下のコマンドを打つと **イメージの作成(build)** から **コンテナの作成&起動(run)** まで全て行ってくれます．
```
docker-compose up -d
```

## コンテナに入る：execコマンド
`docker-compose`を打ったあとは，以下コマンドでコンテナ内に入れます．  
```
docker exec -it pytorch_container bash
```

# docker-compose を利用しない方法
## イメージ作成：buildコマンド
```
docker build --rm -t pytorch_env:latest .
```
## コンテナを作成&起動：runコマンド
```
docker run -it -v $PWD:/home/workspase --name pytorch_container pytorch_env:latest /bin/bash
```
上記コマンドを打つと自動的にコンテナ内に入ってくれます．  


# その他コマンド
## コンテナ一覧確認：psコマンド
**実行中**のdockerコンテナの一覧が表示されます．
```
docker ps
```
 **-a**  オプションをつけることで **終了したコンテナも** 含めて一覧表示されます．
```
docker ps -a
```

## コンテナの起動：startコマンド
作成したはずのコンテナが`docker ps`をしても表示されない場合は，起動していない可能性があります．  
以下コマンドでコンテナを起動してください．
```
docker start pytorch_container
```
起動後はexecコマンドで入れます．

## コンテナに入る：execコマンド
```
docker exec -it pytorch_container bash
```

## vscodeのDocker環境で開発するために
以下のサイトを参考にするとできます．  
[[Docker / VSCode] VSCodeからリモートマシンのDocker情報にアクセスする](https://qiita.com/siruku6/items/11a9196c395ba4797aec)

## 参考にしたサイト
[Dockerで環境構築するための最低限の概念理解](https://qiita.com/minato-naka/items/e9cd026747693759800c)  
[docker と docker-compose の初歩](https://qiita.com/hiyuzawa/items/81490020568417d85e86)  
[Dockerを使って機械学習の環境を作ろうとした話](https://qiita.com/penpenta/items/3b7a0f1e27bbab56a95f)  
[日本語自然言語処理で必須の前処理まとめ(Dockerによる環境構築込み)](https://qiita.com/Keyskey/items/9f5f6c414e0f89a4f931)  


