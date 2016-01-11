#!/usr/local/bin/ruby -Ke
# 1��10�����������Ф�����Ԥ�Ruby 1.8.7�ʹߡ�
(1..10).select{|x| x%2 == 0 }  # => [2, 4, 6, 8, 10]
(1..10).select(&:even?)        # => [2, 4, 6, 8, 10]
# Numeric�Υ��֥��饹����Ф���
[Array, Integer, Float, String].select{|c| c.ancestors.include? Numeric }
# => [Integer, Float]

# �������ӥǡ����١�������
# ����̾����Ψ�������ǿ����������Ǽ���빽¤�Υ��饹Batter��������롣
Batter = Struct.new :name, :avg, :hr, :rbi
STATS = [
  Batter.new("��¼", 0.312, 20,  96),
  Batter.new("����", 0.213, 33,  88),
  Batter.new("��¼", 0.199, 55, 101),
  Batter.new("����", 0.344, 34, 141),
]
# ��������������롣
STATS
# => [#<struct Batter name="��¼", avg=0.312, hr=20, rbi=96>,
#     #<struct Batter name="����", avg=0.213, hr=33, rbi=88>,
#     #<struct Batter name="��¼", avg=0.199, hr=55, rbi=101>,
#     #<struct Batter name="����", avg=0.344, hr=34, rbi=141>]
# 3��Хå��������롣
STATS.select{|b| b.avg >= 0.3 }
# => [#<struct Batter name="��¼", avg=0.312, hr=20, rbi=96>,
#     #<struct Batter name="����", avg=0.344, hr=34, rbi=141>]
# 3��30������100����ã���Ԥ����롣
STATS.select{|b| b.avg >= 0.3 and b.hr >= 30 and b.rbi >= 100}
# => [#<struct Batter name="����", avg=0.344, hr=34, rbi=141>]
