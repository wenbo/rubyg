#!/usr/local/bin/ruby -Ke
require 'mysql'
mysql = Mysql.new "127.0.0.1", "rubikitch", "abracadabra", "test"

# 日本語のテーブルを作成する
mysql.query "SET NAMES ujis;"               # 文字コードをEUC-JPに設定する
mysql.query "DROP TABLE IF EXISTS batters;" # テーブルが存在する場合は削除する
mysql.query <<'EOQ'
CREATE TABLE batters (                     -- EUC-JPで格納する
  id   integer     NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name varchar(32) NOT NULL,               -- 選手名
  avg  double      NOT NULL,               -- 打率
  hr   integer     NOT NULL,               -- 本塁打数
  rbi  integer     NOT NULL                -- 打点
) DEFAULT CHARACTER SET ujis;
EOQ

# prepared statementでデータベースに値を入れる
# 選手名、打率、本塁打数、打点を格納するprepared statement
stmt = mysql.prepare "INSERT INTO batters (name, avg, hr, rbi) VALUES (?,?,?,?)"
# => #<Mysql::Stmt:0xb7aa5e44>
# 選手の成績データをデータベースに入れる
stmt.execute "西村", 0.312, 20,  96
stmt.execute "本田", 0.213, 33,  88
stmt.execute "金村", 0.199, 55, 101
stmt.execute "吉本", 0.344, 34, 141

# 問い合わせをする
# 全選手名を得る
mysql.prepare("SELECT name FROM batters;").execute.each do |name,|
  name                          # => "西村", "本田", "金村", "吉本"
end
class Mysql::Stmt; include Enumerable end
mysql.prepare("SELECT name FROM batters;").execute.to_a
# => [["西村"], ["本田"], ["金村"], ["吉本"]]
# 3割バッターの名前と打率を得る
mysql.prepare("SELECT name,avg FROM batters WHERE avg >= ?;").execute(0.3).to_a
# => [["西村", 0.312], ["吉本", 0.344]]
# 3割、30本塁打、100打点の選手の成績を得る
mysql.prepare("SELECT * FROM batters WHERE avg >= ? AND hr >= ? AND rbi >= ?;").execute(0.3, 30, 100).to_a
# => [[4, "吉本", 0.344, 34, 141]]

# SQLインジェクションに注意！
nm = "吉本"                     # nmは入力データを想定する
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{nm}';").execute.to_a
# => [["吉本", 0.344]]

nm = "' OR 'x' = 'x"
"SELECT name,avg FROM batters WHERE name = '#{nm}';"
# => "SELECT name,avg FROM batters WHERE name = '' OR 'x' = 'x';"
# SQLインジェクション発生！
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{nm}';").execute.to_a
# => [["西村", 0.312], ["本田", 0.213], ["金村", 0.199], ["吉本", 0.344]]

# nmがエスケープされているのでSQLインジェクションが発生しない
mysql.prepare("SELECT name,avg FROM batters WHERE name = ?;").execute(nm).to_a
# => []
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{Mysql.quote(nm)}';").execute.to_a
# => []
nm = "吉本"
mysql.prepare("SELECT name,avg FROM batters WHERE name = ?;").execute(nm).to_a
# => [["吉本", 0.344]]
