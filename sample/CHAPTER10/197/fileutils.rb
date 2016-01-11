# fileutilsライブラリにFileUtilsが定義されているので読み込む
require 'fileutils'
abcd = File.read "abcd.txt"
efgh = File.read "efgh.txt"
# ディレクトリd1/d2を一気に作成する。
FileUtils.mkdir_p "d1/d2"
# abcd.txtとefgh.txtをd1/d2へコピーする。
FileUtils.cp %w[abcd.txt efgh.txt], "d1/d2"
# 内容が同じなので確かにコピーされた。
abcd == File.read("d1/d2/abcd.txt") # => true
efgh == File.read("d1/d2/efgh.txt") # => true
# ディレクトリd1を丸ごと削除する。
FileUtils.rm_rf "d1"
# d1は存在しないので確かに削除された。
File.exist? "d1"                    # => false
