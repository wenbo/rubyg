# gdbmライブラリにGDBMが定義されているので読み込む
require 'gdbm'
# データベース test.gdbm を開いたらGDBMオブジェクトがブロックパラメータに渡る。
GDBM.open("test.gdbm") do |dbm|
# ハッシュ同様にアクセスできるが、文字列以外の値を格納するには「to_s」で文字列化する必要がある。
  dbm["foo"] = "bar"
  dbm["number"] = 1.to_s
  dbm.keys    # => ["number", "foo"]
  dbm.values  # => ["1", "bar"]
end
