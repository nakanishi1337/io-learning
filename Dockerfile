FROM ubuntu:22.04

# パッケージ更新と必要なツールのインストール
RUN apt-get update && apt-get install -y \
    git build-essential cmake libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

# Ioのソースを取得してビルド
RUN git clone https://github.com/IoLanguage/io.git /tmp/io \
    && cd /tmp/io \
    && git submodule update --init --recursive \
    && mkdir build && cd build \
    && cmake .. && make && make install \
    && rm -rf /tmp/io

# 対話環境に入るよう設定
CMD ["io"]
