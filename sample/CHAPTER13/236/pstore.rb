# pstoreライブラリにPStoreが定義されているので読み込む
require 'pstore'

ary = [1,2,3]
# データベースファイル「pstore-test.db」によるPStoreデータベースを作成する。
db = PStore.new "pstore-test.db"
# transactionブロック内でのみアクセスできる。
db.transaction do
# 読み書き自体はハッシュと同様にできる。この段階ではまだファイルに反映されていない。
  db["ary"] = ary
  db["number"] = 1
  db["number"]          # => 1
  db["garbage"] = 0
# ただしHash#keys、Hash#key?に相当するメソッドはPStore#rootsとPStore::root?になっている。
  db.roots              # => ["number", "ary", "garbage"]
  db.root? "ary"        # => true
# rootを削除する。
  db.delete "garbage"
  db["garbage"]         # => nil
  db.roots              # => ["number", "ary"]
end
# transactionブロック外ではデータベースにアクセスできない。
db["number"] rescue $!  # => #<PStore::Error: not in transaction>
# PStore#abortでデータベースファイルへの書き込みを中止する。
db.transaction do
  db["not-written"] = 0
  db.abort              # 中止！
end
db.transaction { db.root? "not-written" }  # => false
