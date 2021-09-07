# Docker Pytorch環境構築
Pytorchでの日本語自然言語処理の分析環境を用意するための Docker イメージ

# Docker環境構築
## バージョン
```
Docker version 20.10.3
```
## Dockerイメージ
nvideaが提供しているPytorchイメージ
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

## ※以下作業はcloneしたディレクトリ内で行ってください
```
cd docker_pytorch/
```

## イメージ作成：buildコマンド
```
docker build --rm -t pytorch_env:latest .
```
## コンテナを作成&起動：runコマンド
```
docker run -it -v $PWD:/home/workspase --name pytorch_container pytorch_env:latest /bin/bash
```

## コンテナに入る：execコマンド
```
docker exec -it pytorch_container bash
```

## コンテナ一覧確認：psコマンド
**実行中**のdockerコンテナの一覧が表示されます．
```
docker ps
```
 **-a**  オプションをつけることで **終了したコンテナも** 含めて一覧表示されます．
```
docker ps -a
```

## コンテナを起動するだけ：startコマンド
作成したはずのコンテナが`docker ps`をしても表示されない場合は，起動していない可能性があります．  
以下コマンドでコンテナを起動してください．
```
docker start pytorch_container
```
起動後はexecコマンドで入れます．

## docker-compose を利用
docker-compose は複数のコンテナを同時に立ち上げてくれるものですが，ひとつのコンテナを立ち上げるのにも便利．  
docker-compose.yml にあらかじめオプションを記述することで各コンテナの起動時の設定などができます．  
これを利用することによってbuildやrunコマンド時の煩雑なオプション指定をいちいち入力しなくてもよくなります．  
docker-compose のあるディレクトリに移動して  
以下のコマンドで **イメージの作成(build)** から **コンテナの起動(run)** まで全て行ってくれます．
```
docker-compose up -d
```

## vscodeのDocker環境で開発するために
以下のサイトの「導入方法」を参考にするとできます．
[DockerとRemote Containersでの開発環境が最高過ぎる](https://www.keisuke69.net/entry/2020/06/04/145719)

## 参考にしたサイト
[Dockerで環境構築するための最低限の概念理解](https://qiita.com/minato-naka/items/e9cd026747693759800c)  
[docker と docker-compose の初歩](https://qiita.com/hiyuzawa/items/81490020568417d85e86)  
[Dockerを使って機械学習の環境を作ろうとした話](https://qiita.com/penpenta/items/3b7a0f1e27bbab56a95f)  
[日本語自然言語処理で必須の前処理まとめ(Dockerによる環境構築込み)](https://qiita.com/Keyskey/items/9f5f6c414e0f89a4f931)  


