require 'pstore'
db = PStore.new "pstore-test.db"

# 他のプロセスによって作成されたデータベースにアクセスする。transactionの引数が真のとき、読み込み専用になる。
db.transaction(:read_only) do
  db["ary"]                  # => [1, 2, 3]
  db["number"]               # => 1
  (db["foo"] = 1) rescue $!  # => #<PStore::Error: in read-only transaction>
end
