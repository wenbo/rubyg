#!/Usr/local/bin/ruby -Ke
require 'rubygems'
require 'dbi'                   # DBD��DSN�ˤ�ä�ưŪ���ɤ߹��ޤ��
dbi = DBI.connect "DBI:Mysql:database=test;host=127.0.0.1", "rubikitch", "abracadabra"

# ���ܸ�Υơ��֥���������
dbi.do "SET NAMES ujis;"               # ʸ�������ɤ�EUC-JP�����ꤹ��
dbi.do "DROP TABLE IF EXISTS batters;" # �ơ��֥뤬¸�ߤ�����Ϻ������
dbi.do <<'EOQ'
CREATE TABLE batters (                -- EUC-JP�ǳ�Ǽ����
  id   int         NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(32) NOT NULL,          -- ����̾
  avg  real        NOT NULL,          -- ��Ψ
  hr   int         NOT NULL,          -- �����ǿ�
  rbi  int         NOT NULL           -- ����
) DEFAULT CHARACTER SET ujis;
EOQ

# prepared statement�ǥơ��֥���ͤ������
# ��������ӥǡ����������
dbi.prepare "INSERT INTO batters (name, avg, hr, rbi) VALUES (?,?,?,?)" do |stmt|
  stmt.class                    # => DBI::StatementHandle
  stmt.execute "��¼", 0.312, 20,  96
  stmt.execute "����", 0.213, 33,  88
  stmt.execute "��¼", 0.199, 55, 101
  stmt.execute "����", 0.344, 34, 141
end

# �䤤��碌�򤹤�
# ������̾������
dbi.prepare("SELECT * FROM batters;") do |stmt|
  stmt.execute; stmt.fetch_all
  # => [[1, "��¼", 0.312, 20, 96],
  #     [2, "����", 0.213, 33, 88],
  #     [3, "��¼", 0.199, 55, 101],
  #     [4, "����", 0.344, 34, 141]]
end
dbi.execute("SELECT name FROM batters;").fetch_all
# => [["��¼"], ["����"], ["��¼"], ["����"]]
# 3��Хå�����̾������Ψ������
dbi.execute("SELECT name,avg FROM batters WHERE avg >= ?;", 0.3).fetch_all
# => [["��¼", 0.312], ["����", 0.344]]
# 3�䡢30�����ǡ�100��������������Ӥ�����
dbi.select_all("SELECT * FROM batters WHERE avg >= ? AND hr >= ? AND rbi >= ?;", 0.3, 30, 100)
# => [[4, "����", 0.344, 34, 141]]
# ����������̾������Ψ������
nm = "����"                     # nm�����ϥǡ��������ꤹ��
dbi.select_all("SELECT name,avg FROM batters WHERE name = ?;", nm)
# => [["����", 0.344]]
