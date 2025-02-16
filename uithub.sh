#!/bin/bash
# ファイルツリーを上書き出力
tree > src.txt
echo "-------------------------------------" >> src.txt
echo "" >> src.txt  # 区切り用の空行
echo "" >> src.txt

# 各パターンに対してマッチするファイルを検索し、重複を除いてループで処理
while IFS= read -r pattern; do
  find . -type f -name "$pattern" -print0
done < tools/src_list.txt | sort -zu | while IFS= read -r -d '' file; do
  # ファイルの相対パスをヘッダーとして出力
  echo "-------------------------------------" >> src.txt
  echo "File: $file" >> src.txt
  echo "-------------------------------------" >> src.txt
  # ファイル内容を結合
  cat "$file" >> src.txt
  echo "" >> src.txt
  echo "" >> src.txt
done