#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'kirbybase'
$KCODE='e'                      # nodisp
db = KirbyBase.new {|kb| kb.path = kb.memo_blob_path = "db" }

# �ơ��֥���������
db.drop_table :batters if db.table_exists? :batters # ¸�ߤ���ʤ�к������
table = db.create_table(:batters, # batters�Ȥ����ơ��֥���������
  :name, :String,                 # ����̾
  :avg,  :Float,                  # ��Ψ
  :hr,   :Integer,                # �����ǿ�
  :rbi,  :Integer)                # ����
table.class                       # => KBTable

# ��¸�Υơ��֥������
table2 = db.get_table :batters
table2 == table                 # => true

# �ơ��֥���ͤ������
# ���֤��ͤ���ꤹ����ˡ
table.insert "��¼", 0.312, 20,  96
# �ϥå����̾������ꤹ����ˡ
table.insert :name => "����", :avg => 0.213, :hr => 33,  :rbi => 88
# ��¤�Τ���ꤹ����ˡ
BatterStruct = Struct.new :name, :avg, :hr, :rbi
table.insert BatterStruct.new("��¼", 0.201, 55, 100)
# �֥�å��ǻ��ꤹ����ˡ
table.insert {|r| r.name = "����"; r.avg = 0.344; r.hr = 34; r.rbi = 140 }

# �ͤ򹹿�����
# ��������������򹹿�����
table.update(:rbi => 141) {|r| r.name == '����' }
# ��¼�������Ψ�򹹿�����
table.update {|r| r.name == '��¼'}.set {|r| r.avg = 0.199 }

# �䤤��碌�򤹤�
# ���쥳���ɤ�����
table.select
# => [#<struct  recno=1, name="��¼", avg=0.312, hr=20, rbi=96>,
#     #<struct  recno=2, name="����", avg=0.213, hr=33, rbi=88>,
#     #<struct  recno=3, name="��¼", avg=0.199, hr=55, rbi=100>,
#     #<struct  recno=4, name="����", avg=0.344, hr=34, rbi=141>]
table.select.class             # => KBResultSet
table.select.class.superclass  # => Array
# ������̾������
table.select.each do |r|
  r.name           # => "��¼", "����", "��¼", "����"
end
# name�Ȥ����᥽�åɤ�ưŪ���ɲä���Ƥ���
table.select.name  # => ["��¼", "����", "��¼", "����"]
## KBResultSet#select�ϥ֥�å��Ǿ�����ꤷ���������륫��������ǻ��ꤷ�ޤ���
# 3��Хå���������̾����Ψ������
table.select(:name, :avg) {|r| r.avg >= 0.3 }
# => [#<struct  name="��¼", avg=0.312>, #<struct  name="����", avg=0.344>]
# 3�䡢30�����ǡ�100��������������Ӥ�����
table.select {|r| r.avg >= 0.3 and r.hr >= 30 and r.rbi >= 100 }
# => [#<struct  recno=4, name="����", avg=0.344, hr=34, rbi=141>]
# ����������̾������Ψ������
nm = "����"
table.select(:name, :avg) {|r| r.name == nm }
# => [#<struct  name="����", avg=0.344>]

# �����Ȥ���
# ��Ψ����¤٤�
table.select(:name, :avg).sort(-:avg)
# => [#<struct  name="����", avg=0.344>,
#     #<struct  name="��¼", avg=0.312>,
#     #<struct  name="����", avg=0.213>,
#     #<struct  name="��¼", avg=0.199>]
# ��������Ψ����¤٤�
table.select(:name, :rbi, :avg).sort(-:rbi, -:avg)
# => [#<struct  name="����", rbi=141, avg=0.344>,
#     #<struct  name="��¼", rbi=100, avg=0.199>,
#     #<struct  name="��¼", rbi=96, avg=0.312>,
#     #<struct  name="����", rbi=88, avg=0.213>]

# �쥳���ɥ��֥������Ȥ�Ȥ�
class Batter
  def initialize(*args) @name, @avg, @hr, @rbi = args end
  attr_reader :name, :avg, :hr, :rbi            # �ɤ߹��ߥ�������
  # ��������KirbyBase�б���ʬ
  attr_accessor :recno                          # ˺�줺��
  def self.kb_create(recno, name, avg, hr, rbi) # KirbyBase���ѥ��󥹥ȥ饯��
    # Ruby 1.8.7�ʹߤ��ȡ�new(name, avg, hr, rbi).tap{|o| o.recno = recno}�פȤ�񤱤롣
    o = new(name, avg, hr, rbi); o.recno = recno; o
  end
end
# batters��Ʊ�����Ƥǥ쥳���ɥ��饹��Ȥ��ơ��֥���������
db.drop_table :batters2 if db.table_exists? :batters2
table2 = db.create_table(:batters2,
  :name, :String,
  :avg,  :Float,
  :hr,   :Integer,
  :rbi,  :Integer) {|prop| prop.record_class = Batter }
# table�����쥳���ɤ�table2�˥��ԡ�����
table.select.each do |r|
  table2.insert Batter.new(r.name, r.avg, r.hr, r.rbi)
end
# table2�Υ쥳���ɤ�����
table2.select
# => [#<Batter:0xb779f2a4 @avg=0.312, @hr=20, @name="��¼", @rbi=96, @recno=1>,
#     #<Batter:0xb779f060 @avg=0.213, @hr=33, @name="����", @rbi=88, @recno=2>,
#     #<Batter:0xb779ee1c @avg=0.199, @hr=55, @name="��¼", @rbi=100, @recno=3>,
#     #<Batter:0xb779ebd8 @avg=0.344, @hr=34, @name="����", @rbi=141, @recno=4>]
table2.select {|r| r.avg >= 0.3 }
# => [#<Batter:0xb77978d8 @avg=0.312, @hr=20, @name="��¼", @rbi=96, @recno=1>,
#     #<Batter:0xb7797338 @avg=0.344, @hr=34, @name="����", @rbi=141, @recno=4>]
# ����Υ����Τߤ�������ϡ�¾��nil�ˤʤ롣
table2.select(:name) {|r| r.recno == 1}
# => [#<Batter:0xb779379c @avg=nil, @hr=nil, @name="��¼", @rbi=nil, @recno=nil>]

# ɽ�����˽��Ϥ���
puts table2.select.to_report
# >> recno | name |   avg | hr | rbi
# >> -------------------------------
# >>     1 | ��¼ | 0.312 | 20 |  96
# >>     2 | ���� | 0.213 | 33 |  88
# >>     3 | ��¼ | 0.199 | 55 | 100
# >>     4 | ���� | 0.344 | 34 | 141
