require 'pstore'
db = PStore.new "pstore-test.db"

# ¾�Υץ����ˤ�äƺ������줿�ǡ����١����˥����������롣transaction�ΰ��������ΤȤ����ɤ߹������Ѥˤʤ롣
db.transaction(:read_only) do
  db["ary"]                  # => [1, 2, 3]
  db["number"]               # => 1
  (db["foo"] = 1) rescue $!  # => #<PStore::Error: in read-only transaction>
end
