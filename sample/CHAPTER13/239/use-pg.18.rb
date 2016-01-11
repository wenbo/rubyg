#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'pg'
pg = PGconn.connect("/var/run/postgresql", 5432, "", "", "test", "rubikitch", "abracadabra")

# 日本語のテーブルを作成する
pg.exec "SET NAMES 'EUC_JP';"             # 文字コードをEUC-JPに設定する
pg.exec "DROP TABLE  batters;" rescue nil # テーブルが存在する場合は削除する
pg.exec <<'EOQ'
CREATE TABLE batters (
  id   serial      NOT NULL PRIMARY KEY,
  name varchar(32) NOT NULL,              -- 選手名
  avg  float       NOT NULL,              -- 打率
  hr   integer     NOT NULL,              -- 本塁打数
  rbi  integer     NOT NULL               -- 打点
);
EOQ

# prepared statemenでテーブルに値を入れる
# 選手の成績データをデータベースに入れる
pg.prepare "ins", "INSERT INTO batters (name, avg, hr, rbi) VALUES ($1,$2,$3,$4)"
pg.exec_prepared "ins", ["西村", 0.312, 20,  96]
pg.exec_prepared "ins", ["本田", 0.213, 33,  88]
pg.exec_prepared "ins", ["金村", 0.199, 55, 101]
pg.exec_prepared "ins", ["吉本", 0.344, 34, 141]

# 問い合わせをする
class PGconn
  def result(*args)       # クエリの結果を配列で得るメソッドを定義する
    result = exec(*args)        # resultはPGresultオブジェクト
    result.to_a                 # ハッシュ配列が返る
  ensure
    result.clear                # 必ずPGresultのメモリを解放する
  end
end
# 全選手名を得る
pg.result "SELECT name FROM batters;"
# => [{"name"=>"西村"}, {"name"=>"本田"}, {"name"=>"金村"}, {"name"=>"吉本"}]
# 3割バッターの名前と打率を得る
pg.result "SELECT name,avg FROM batters WHERE avg >= $1;", [0.3]
# => [{"name"=>"西村", "avg"=>"0.312"}, {"name"=>"吉本", "avg"=>"0.344"}]
# 3割、30本塁打、100打点の選手の成績を得る
pg.result "SELECT * FROM batters WHERE avg >= $1 AND hr >= $2 AND rbi >= $3;", [0.3, 30, 100]
# => [{"name"=>"吉本", "rbi"=>"141", "id"=>"4", "avg"=>"0.344", "hr"=>"34"}]
nm = "吉本"
# 特定の選手の名前と打率を得る
pg.result "SELECT name,avg FROM batters WHERE name = $1;", [nm]
# => [{"name"=>"吉本", "avg"=>"0.344"}]
pg.result "SELECT name,avg FROM batters WHERE name = '#{PGconn.escape(nm)}';"
# => [{"name"=>"吉本", "avg"=>"0.344"}]
pg.close
