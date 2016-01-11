#!/usr/local/bin/ruby -Ku
require 'rubygems'
require 'sqlite3'
require 'kconv'

sqlite = SQLite3::Database.new "test.sqlite3"

# 日本語のテーブルを作成する
sqlite.transaction do 
  sqlite.execute "DROP TABLE IF EXISTS batters;" # テーブルが存在する場合は削除する
  sqlite.execute <<-'EOQ'
  CREATE TABLE batters (               -- UTF-8で格納する
    id   integer  NOT NULL PRIMARY KEY AUTOINCREMENT,
    name text     NOT NULL,               -- 選手名
    avg  float    NOT NULL,               -- 打率
    hr   integer  NOT NULL,               -- 本塁打数
    rbi  integer  NOT NULL                -- 打点
  );
  EOQ
end

# prepared statementでクエリを送信する
# 選手名、打率、本塁打数、打点を格納するprepared statement
sqlite.transaction do
  stmt = sqlite.prepare "INSERT INTO batters (name, avg, hr, rbi) VALUES (?,?,?,?)"
  # 選手の成績データをデータベースに入れる
  stmt.execute "西村", 0.312, 20,  96
  stmt.execute "本田", 0.213, 33,  88
  stmt.execute "金村", 0.199, 55, 101
  stmt.execute "吉本", 0.344, 34, 141
end
# 全選手名を得る
sqlite.prepare("SELECT name FROM batters;").execute.each do |name,|
  name                          # => "西村", "本田", "金村", "吉本"
end
sqlite.prepare("SELECT name FROM batters;").execute.to_a
# => [["西村"], ["本田"], ["金村"], ["吉本"]]
# 3割バッターの名前と打率を得る
sqlite.prepare("SELECT name,avg FROM batters WHERE avg >= ?;").execute(0.3).to_a
# => [["西村", "0.312"], ["吉本", "0.344"]]
# 3割、30本塁打、100打点の選手の成績を得る
sqlite.prepare("SELECT * FROM batters WHERE avg >= ? AND hr >= ? AND rbi >= ?;").execute(0.3, 30, 100).to_a
# => [["4", "吉本", "0.344", "34", "141"]]
# 特定の選手の名前と打率を得る
nm = "吉本"
sqlite.prepare("SELECT name,avg FROM batters WHERE name = ?;").execute(nm).to_a
# => [["吉本", "0.344"]]
sqlite.prepare("SELECT name,avg FROM batters WHERE name = '#{SQLite3::Database.quote(nm)}';").execute.to_a
# => [["吉本", "0.344"]]
