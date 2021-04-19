# pythonの3.8.0をベースにする
FROM pytorch/pytorch:latest

RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y --reinstall build-essential && \
    apt-get install -y sudo && \
    apt-get install -y vim  && \
    apt-get install -y git && \
    apt-get install -y curl && \
    apt-get install -y zip unzip &&\
    apt-get install -y file && \
    apt-get install -y wget && \
    ## mecab関連インストール
    apt-get install -y mecab && \
    apt-get install -y libmecab-dev && \
    apt-get install -y mecab-ipadic-utf8 && \
    git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
    bin/install-mecab-ipadic-neologd -n -y -a && \
    rm -rf /home/jovyan/mecab-ipadic-neologd && \
    # imageのサイズを小さくするためにキャッシュ削除
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # pipのアップデート
    pip install --upgrade pip


# 作業するディレクトリを変更
WORKDIR /home/workspase

COPY requirements.txt ${PWD}

# pythonのパッケージをインストール
RUN pip install -r requirements.txt

# 作業するディレクトリを変更
# コンテナの内部には入った際のディレクトリの位置を変更している
WORKDIR /home/workspase/src
