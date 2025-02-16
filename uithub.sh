#!/bin/bash
# 実行パスを取得
exec_path=$(pwd)
if [ ! -d "$exec_path/.git" ]; then
  echo "[Error] .git ディレクトリが見つかりません。"
  echo "        本スクリプトはリポジトリのルートで実行する必要があります。" >&2
  exit 1 
fi

# 抽出するファイルリストのパスを取得
list_path=$(dirname "$0")/src_list.txt
if [ ! -f "$list_path" ]; then
  echo "[Error] ${list_path}が見つかりません。"
  echo "        新しく作成するか、https://github.com/tnaoki0630/uithub_light から clone してください。" >&2
  exit 1 
fi

# ファイルツリーを上書き出力
tree > src.txt
echo "-------------------------------------" >> src.txt
echo "" >> src.txt  # 区切り用の空行
echo "" >> src.txt

# 各パターンに対してマッチするファイルを検索し、重複を除いてループで処理
while IFS= read -r pattern; do
  find . -type f -name "$pattern" -print0
done < $list_path | sort -zu | while IFS= read -r -d '' file; do
  # ファイルの相対パスをヘッダーとして出力
  echo "-------------------------------------" >> src.txt
  echo "File: $file" >> src.txt
  echo "-------------------------------------" >> src.txt
  # ファイル内容を結合
  cat "$file" >> src.txt
  echo "" >> src.txt
  echo "" >> src.txt
done