#!/usr/local/bin/ruby
# ARGFはコマンドラインで指定されたファイルや標準入力からの入力を扱うIOオブジェクト（もどき）。
ARGF.each_with_index do |line, i|
# インデックスは0から始まり、行番号は1から始まるのでインデックスに1加える。
  printf "%4d:%s", i+1, line
end
