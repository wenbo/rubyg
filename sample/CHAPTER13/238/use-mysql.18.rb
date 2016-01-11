#!/usr/local/bin/ruby -Ke
require 'mysql'
mysql = Mysql.new "127.0.0.1", "rubikitch", "abracadabra", "test"

# ���ܸ�Υơ��֥���������
mysql.query "SET NAMES ujis;"               # ʸ�������ɤ�EUC-JP�����ꤹ��
mysql.query "DROP TABLE IF EXISTS batters;" # �ơ��֥뤬¸�ߤ�����Ϻ������
mysql.query <<'EOQ'
CREATE TABLE batters (                     -- EUC-JP�ǳ�Ǽ����
  id   integer     NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name varchar(32) NOT NULL,               -- ����̾
  avg  double      NOT NULL,               -- ��Ψ
  hr   integer     NOT NULL,               -- �����ǿ�
  rbi  integer     NOT NULL                -- ����
) DEFAULT CHARACTER SET ujis;
EOQ

# prepared statement�ǥǡ����١������ͤ������
# ����̾����Ψ�������ǿ����������Ǽ����prepared statement
stmt = mysql.prepare "INSERT INTO batters (name, avg, hr, rbi) VALUES (?,?,?,?)"
# => #<Mysql::Stmt:0xb7aa5e44>
# ��������ӥǡ�����ǡ����١����������
stmt.execute "��¼", 0.312, 20,  96
stmt.execute "����", 0.213, 33,  88
stmt.execute "��¼", 0.199, 55, 101
stmt.execute "����", 0.344, 34, 141

# �䤤��碌�򤹤�
# ������̾������
mysql.prepare("SELECT name FROM batters;").execute.each do |name,|
  name                          # => "��¼", "����", "��¼", "����"
end
class Mysql::Stmt; include Enumerable end
mysql.prepare("SELECT name FROM batters;").execute.to_a
# => [["��¼"], ["����"], ["��¼"], ["����"]]
# 3��Хå�����̾������Ψ������
mysql.prepare("SELECT name,avg FROM batters WHERE avg >= ?;").execute(0.3).to_a
# => [["��¼", 0.312], ["����", 0.344]]
# 3�䡢30�����ǡ�100��������������Ӥ�����
mysql.prepare("SELECT * FROM batters WHERE avg >= ? AND hr >= ? AND rbi >= ?;").execute(0.3, 30, 100).to_a
# => [[4, "����", 0.344, 34, 141]]

# SQL���󥸥�����������ա�
nm = "����"                     # nm�����ϥǡ��������ꤹ��
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{nm}';").execute.to_a
# => [["����", 0.344]]

nm = "' OR 'x' = 'x"
"SELECT name,avg FROM batters WHERE name = '#{nm}';"
# => "SELECT name,avg FROM batters WHERE name = '' OR 'x' = 'x';"
# SQL���󥸥��������ȯ����
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{nm}';").execute.to_a
# => [["��¼", 0.312], ["����", 0.213], ["��¼", 0.199], ["����", 0.344]]

# nm�����������פ���Ƥ���Τ�SQL���󥸥��������ȯ�����ʤ�
mysql.prepare("SELECT name,avg FROM batters WHERE name = ?;").execute(nm).to_a
# => []
mysql.prepare("SELECT name,avg FROM batters WHERE name = '#{Mysql.quote(nm)}';").execute.to_a
# => []
nm = "����"
mysql.prepare("SELECT name,avg FROM batters WHERE name = ?;").execute(nm).to_a
# => [["����", 0.344]]
