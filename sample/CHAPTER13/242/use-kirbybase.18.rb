#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'kirbybase'
$KCODE='e'                      # nodisp
db = KirbyBase.new {|kb| kb.path = kb.memo_blob_path = "db" }

# テーブルを作成する
db.drop_table :batters if db.table_exists? :batters # 存在するならば削除する
table = db.create_table(:batters, # battersというテーブルを作成する
  :name, :String,                 # 選手名
  :avg,  :Float,                  # 打率
  :hr,   :Integer,                # 本塁打数
  :rbi,  :Integer)                # 打点
table.class                       # => KBTable

# 既存のテーブルを得る
table2 = db.get_table :batters
table2 == table                 # => true

# テーブルに値を入れる
# 順番に値を指定する方法
table.insert "西村", 0.312, 20,  96
# ハッシュで名前を指定する方法
table.insert :name => "本田", :avg => 0.213, :hr => 33,  :rbi => 88
# 構造体を指定する方法
BatterStruct = Struct.new :name, :avg, :hr, :rbi
table.insert BatterStruct.new("金村", 0.201, 55, 100)
# ブロックで指定する方法
table.insert {|r| r.name = "吉本"; r.avg = 0.344; r.hr = 34; r.rbi = 140 }

# 値を更新する
# 吉本選手の打点を更新する
table.update(:rbi => 141) {|r| r.name == '吉本' }
# 金村選手の打率を更新する
table.update {|r| r.name == '金村'}.set {|r| r.avg = 0.199 }

# 問い合わせをする
# 全レコードを得る
table.select
# => [#<struct  recno=1, name="西村", avg=0.312, hr=20, rbi=96>,
#     #<struct  recno=2, name="本田", avg=0.213, hr=33, rbi=88>,
#     #<struct  recno=3, name="金村", avg=0.199, hr=55, rbi=100>,
#     #<struct  recno=4, name="吉本", avg=0.344, hr=34, rbi=141>]
table.select.class             # => KBResultSet
table.select.class.superclass  # => Array
# 全選手名を得る
table.select.each do |r|
  r.name           # => "西村", "本田", "金村", "吉本"
end
# nameというメソッドが動的に追加されている
table.select.name  # => ["西村", "本田", "金村", "吉本"]
## KBResultSet#selectはブロックで条件を指定し、取得するカラムを引数で指定します。
# 3割バッターの選手名と打率を得る
table.select(:name, :avg) {|r| r.avg >= 0.3 }
# => [#<struct  name="西村", avg=0.312>, #<struct  name="吉本", avg=0.344>]
# 3割、30本塁打、100打点の選手の成績を得る
table.select {|r| r.avg >= 0.3 and r.hr >= 30 and r.rbi >= 100 }
# => [#<struct  recno=4, name="吉本", avg=0.344, hr=34, rbi=141>]
# 特定の選手の名前と打率を得る
nm = "吉本"
table.select(:name, :avg) {|r| r.name == nm }
# => [#<struct  name="吉本", avg=0.344>]

# ソートする
# 打率順に並べる
table.select(:name, :avg).sort(-:avg)
# => [#<struct  name="吉本", avg=0.344>,
#     #<struct  name="西村", avg=0.312>,
#     #<struct  name="本田", avg=0.213>,
#     #<struct  name="金村", avg=0.199>]
# 打点・打率順に並べる
table.select(:name, :rbi, :avg).sort(-:rbi, -:avg)
# => [#<struct  name="吉本", rbi=141, avg=0.344>,
#     #<struct  name="金村", rbi=100, avg=0.199>,
#     #<struct  name="西村", rbi=96, avg=0.312>,
#     #<struct  name="本田", rbi=88, avg=0.213>]

# レコードオブジェクトを使う
class Batter
  def initialize(*args) @name, @avg, @hr, @rbi = args end
  attr_reader :name, :avg, :hr, :rbi            # 読み込みアクセサ
  # ここからKirbyBase対応部分
  attr_accessor :recno                          # 忘れずに
  def self.kb_create(recno, name, avg, hr, rbi) # KirbyBase専用コンストラクタ
    # Ruby 1.8.7以降だと「new(name, avg, hr, rbi).tap{|o| o.recno = recno}」とも書ける。
    o = new(name, avg, hr, rbi); o.recno = recno; o
  end
end
# battersと同じ内容でレコードクラスを使うテーブルを定義する
db.drop_table :batters2 if db.table_exists? :batters2
table2 = db.create_table(:batters2,
  :name, :String,
  :avg,  :Float,
  :hr,   :Integer,
  :rbi,  :Integer) {|prop| prop.record_class = Batter }
# tableの全レコードをtable2にコピーする
table.select.each do |r|
  table2.insert Batter.new(r.name, r.avg, r.hr, r.rbi)
end
# table2のレコードを得る
table2.select
# => [#<Batter:0xb779f2a4 @avg=0.312, @hr=20, @name="西村", @rbi=96, @recno=1>,
#     #<Batter:0xb779f060 @avg=0.213, @hr=33, @name="本田", @rbi=88, @recno=2>,
#     #<Batter:0xb779ee1c @avg=0.199, @hr=55, @name="金村", @rbi=100, @recno=3>,
#     #<Batter:0xb779ebd8 @avg=0.344, @hr=34, @name="吉本", @rbi=141, @recno=4>]
table2.select {|r| r.avg >= 0.3 }
# => [#<Batter:0xb77978d8 @avg=0.312, @hr=20, @name="西村", @rbi=96, @recno=1>,
#     #<Batter:0xb7797338 @avg=0.344, @hr=34, @name="吉本", @rbi=141, @recno=4>]
# 特定のカラムのみを得る場合は、他はnilになる。
table2.select(:name) {|r| r.recno == 1}
# => [#<Batter:0xb779379c @avg=nil, @hr=nil, @name="西村", @rbi=nil, @recno=nil>]

# 表形式に出力する
puts table2.select.to_report
# >> recno | name |   avg | hr | rbi
# >> -------------------------------
# >>     1 | 西村 | 0.312 | 20 |  96
# >>     2 | 本田 | 0.213 | 33 |  88
# >>     3 | 金村 | 0.199 | 55 | 100
# >>     4 | 吉本 | 0.344 | 34 | 141
