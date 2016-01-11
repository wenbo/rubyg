# pstore�饤�֥���PStore���������Ƥ���Τ��ɤ߹���
require 'pstore'

ary = [1,2,3]
# �ǡ����١����ե������pstore-test.db�פˤ��PStore�ǡ����١�����������롣
db = PStore.new "pstore-test.db"
# transaction�֥�å���ǤΤߥ��������Ǥ��롣
db.transaction do
# �ɤ߽񤭼��Τϥϥå����Ʊ�ͤˤǤ��롣�����ʳ��ǤϤޤ��ե������ȿ�Ǥ���Ƥ��ʤ���
  db["ary"] = ary
  db["number"] = 1
  db["number"]          # => 1
  db["garbage"] = 0
# ������Hash#keys��Hash#key?����������᥽�åɤ�PStore#roots��PStore::root?�ˤʤäƤ��롣
  db.roots              # => ["number", "ary", "garbage"]
  db.root? "ary"        # => true
# root�������롣
  db.delete "garbage"
  db["garbage"]         # => nil
  db.roots              # => ["number", "ary"]
end
# transaction�֥�å����Ǥϥǡ����١����˥��������Ǥ��ʤ���
db["number"] rescue $!  # => #<PStore::Error: not in transaction>
# PStore#abort�ǥǡ����١����ե�����ؤν񤭹��ߤ���ߤ��롣
db.transaction do
  db["not-written"] = 0
  db.abort              # ��ߡ�
end
db.transaction { db.root? "not-written" }  # => false
