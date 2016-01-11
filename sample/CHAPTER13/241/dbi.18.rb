#!/Usr/local/bin/ruby -Ke
require 'rubygems'
require 'dbi'                   # DBDはDSNによって動的に読み込まれる
dbi = DBI.connect "DBI:Mysql:database=test;host=127.0.0.1", "rubikitch", "abracadabra"

# 日本語のテーブルを作成する
dbi.do "SET NAMES ujis;"               # 文字コードをEUC-JPに設定する
dbi.do "DROP TABLE IF EXISTS batters;" # テーブルが存在する場合は削除する
dbi.do <<'EOQ'
CREATE TABLE batters (                -- EUC-JPで格納する
  id   int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(32) NOT NULL,          -- 選手名
  avg  real        NOT NULL,          -- 打率
  hr   int         NOT NULL,          -- 本塁打数
  rbi  int         NOT NULL           -- 打点
) DEFAULT CHARACTER SET ujis;
EOQ

# prepared statementでテーブルに値を入れる
# 選手の成績データを入れる
dbi.prepare "INSERT INTO batters (name, avg, hr, rbi) VALUES (?,?,?,?)" do |stmt|
  stmt.class                    # => DBI::StatementHandle
  stmt.execute "西村", 0.312, 20,  96
  stmt.execute "本田", 0.213, 33,  88
  stmt.execute "金村", 0.199, 55, 101
  stmt.execute "吉本", 0.344, 34, 141
end

# 問い合わせをする
# 全選手名を得る
dbi.prepare("SELECT * FROM batters;") do |stmt|
  stmt.execute; stmt.fetch_all
  # => [[1, "西村", 0.312, 20, 96],
  #     [2, "本田", 0.213, 33, 88],
  #     [3, "金村", 0.199, 55, 101],
  #     [4, "吉本", 0.344, 34, 141]]
end
dbi.execute("SELECT name FROM batters;").fetch_all
# => [["西村"], ["本田"], ["金村"], ["吉本"]]
# 3割バッターの名前と打率を得る
dbi.execute("SELECT name,avg FROM batters WHERE avg >= ?;", 0.3).fetch_all
# => [["西村", 0.312], ["吉本", 0.344]]
# 3割、30本塁打、100打点の選手の成績を得る
dbi.select_all("SELECT * FROM batters WHERE avg >= ? AND hr >= ? AND rbi >= ?;", 0.3, 30, 100)
# => [[4, "吉本", 0.344, 34, 141]]
# 特定の選手の名前と打率を得る
nm = "吉本"                     # nmは入力データを想定する
dbi.select_all("SELECT name,avg FROM batters WHERE name = ?;", nm)
# => [["吉本", 0.344]]
