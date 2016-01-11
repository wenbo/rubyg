#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'pg'
pg = PGconn.connect("/var/run/postgresql", 5432, "", "", "test", "rubikitch", "abracadabra")

# ���ܸ�Υơ��֥���������
pg.exec "SET NAMES 'EUC_JP';"             # ʸ�������ɤ�EUC-JP�����ꤹ��
pg.exec "DROP TABLE  batters;" rescue nil # �ơ��֥뤬¸�ߤ�����Ϻ������
pg.exec <<'EOQ'
CREATE TABLE batters (
  id   serial      NOT NULL PRIMARY KEY,
  name varchar(32) NOT NULL,              -- ����̾
  avg  float       NOT NULL,              -- ��Ψ
  hr   integer     NOT NULL,              -- �����ǿ�
  rbi  integer     NOT NULL               -- ����
);
EOQ

# prepared statemen�ǥơ��֥���ͤ������
# ��������ӥǡ�����ǡ����١����������
pg.prepare "ins", "INSERT INTO batters (name, avg, hr, rbi) VALUES ($1,$2,$3,$4)"
pg.exec_prepared "ins", ["��¼", 0.312, 20,  96]
pg.exec_prepared "ins", ["����", 0.213, 33,  88]
pg.exec_prepared "ins", ["��¼", 0.199, 55, 101]
pg.exec_prepared "ins", ["����", 0.344, 34, 141]

# �䤤��碌�򤹤�
class PGconn
  def result(*args)       # ������η�̤����������᥽�åɤ��������
    result = exec(*args)        # result��PGresult���֥�������
    result.to_a                 # �ϥå��������֤�
  ensure
    result.clear                # ɬ��PGresult�Υ�����������
  end
end
# ������̾������
pg.result "SELECT name FROM batters;"
# => [{"name"=>"��¼"}, {"name"=>"����"}, {"name"=>"��¼"}, {"name"=>"����"}]
# 3��Хå�����̾������Ψ������
pg.result "SELECT name,avg FROM batters WHERE avg >= $1;", [0.3]
# => [{"name"=>"��¼", "avg"=>"0.312"}, {"name"=>"����", "avg"=>"0.344"}]
# 3�䡢30�����ǡ�100��������������Ӥ�����
pg.result "SELECT * FROM batters WHERE avg >= $1 AND hr >= $2 AND rbi >= $3;", [0.3, 30, 100]
# => [{"name"=>"����", "rbi"=>"141", "id"=>"4", "avg"=>"0.344", "hr"=>"34"}]
nm = "����"
# ����������̾������Ψ������
pg.result "SELECT name,avg FROM batters WHERE name = $1;", [nm]
# => [{"name"=>"����", "avg"=>"0.344"}]
pg.result "SELECT name,avg FROM batters WHERE name = '#{PGconn.escape(nm)}';"
# => [{"name"=>"����", "avg"=>"0.344"}]
pg.close
