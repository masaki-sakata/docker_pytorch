# shinra_Tutorial 環境構築
森羅プロジェクトの日本語構造化タスクのチュートリアルの環境構築

# Docker環境構築
## バージョン
``
Docker version 20.10.3
``



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

## イメージ作成：buildコマンド
``
sudo docker build --rm -t pytorch_env:latest .
``
## コンテナを作成&起動：runコマンド
``
sudo docker run --rm -it -v $PWD:/home/workspase --name pytorch_container pytorch_env:latest /bin/bash
``

## 参考にしたサイト
[Dockerで環境構築するための最低限の概念理解](https://qiita.com/minato-naka/items/e9cd026747693759800c)  
[docker と docker-compose の初歩](https://qiita.com/hiyuzawa/items/81490020568417d85e86)  
[Dockerを使って機械学習の環境を作ろうとした話](https://qiita.com/penpenta/items/3b7a0f1e27bbab56a95f)  
[日本語自然言語処理で必須の前処理まとめ(Dockerによる環境構築込み)](https://qiita.com/Keyskey/items/9f5f6c414e0f89a4f931)  

## ハマリポイント
Dockerfile内のapt-get installに「-y」オプションを忘れるとエラーとなる。  
Docker初学者だったので一連の流れを理解するのに時間がかかった。

