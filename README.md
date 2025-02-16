# uithub.sh
## about
- 開発中のソースコードをまとめて src.txt に出力するためのシェルスクリプト。
- 本家の uithub では commit 前のソースコードを抽出できないので、真似して実装した。
- github レポジトリのホームディレクトリで実行すると、そのツリー構造および src_list.txt に記載しているファイル群をまとめて出力できる。
## usage
1. uithub を適当なパスに clone する。
2. (必要なら)src_list.txt を編集する。
2. 開発中のレポジトリの直下(.gitが存在するパス)に移動し、uithub.sh をターミナルで実行する。
## requirement
- Linux 実行環境
- tree コマンド
- git init 済み