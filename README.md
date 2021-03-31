# Docker Pytorch環境構築
Pytorchでの日本語自然言語処理の分析環境を用意するための Docker イメージ

# Docker環境構築
## バージョン
```
Docker version 20.10.3
```

## パッケージ
- [pytorch](https://hub.docker.com/r/pytorch/pytorch) (docker hubからPull)
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

## イメージ作成：buildコマンド
```
docker build --rm -t pytorch_env:latest .
```
## コンテナを作成&起動：runコマンド
```
docker run --rm -it -v $PWD:/home/workspase --name pytorch_container pytorch_env:latest /bin/bash
```

## コンテナに入る：execコマンド
```
docker exec -it pytorch_container bash
```

## コンテナ一覧確認：psコマンド
**実行中**のdockerコンテナの一覧が表示される。
```
docker ps
```
-a オプションをつけることで終了したコンテナも含めて一覧される。
```
docker ps -a
```

## docker-compose を利用
docker-compose は複数のコンテナを同時に立ち上げてくれるものだが、ひとつのコンテナを立ち上げるのにも便利。  
docker-compose.ymlにあらかじめオプションを記述することで各コンテナの起動時の設定などができる。  
これを利用することによってbuildやrunコマンド時の煩雑なオプション指定をいちいち入力しなくてもよくなる。
docker-compose のあるディレクトリに移動して  
以下のコマンドで**イメージの作成(build)**から**コンテナの起動(run)**まで全て行ってくれる。
```
docker-compose up -d
```

## 参考にしたサイト
[Dockerで環境構築するための最低限の概念理解](https://qiita.com/minato-naka/items/e9cd026747693759800c)  
[docker と docker-compose の初歩](https://qiita.com/hiyuzawa/items/81490020568417d85e86)  
[Dockerを使って機械学習の環境を作ろうとした話](https://qiita.com/penpenta/items/3b7a0f1e27bbab56a95f)  
[日本語自然言語処理で必須の前処理まとめ(Dockerによる環境構築込み)](https://qiita.com/Keyskey/items/9f5f6c414e0f89a4f931)  


