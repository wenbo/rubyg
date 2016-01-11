#!/usr/local/bin/ruby -Ke
# 1〜10から偶数を取り出す。後者はRuby 1.8.7以降。
(1..10).select{|x| x%2 == 0 }  # => [2, 4, 6, 8, 10]
(1..10).select(&:even?)        # => [2, 4, 6, 8, 10]
# Numericのサブクラスを取り出す。
[Array, Integer, Float, String].select{|c| c.ancestors.include? Numeric }
# => [Integer, Float]

# 野球の成績データベースの例
# 選手名、打率、本塁打数、打点を格納する構造体クラスBatterを定義する。
Batter = Struct.new :name, :avg, :hr, :rbi
STATS = [
  Batter.new("西村", 0.312, 20,  96),
  Batter.new("本田", 0.213, 33,  88),
  Batter.new("金村", 0.199, 55, 101),
  Batter.new("吉本", 0.344, 34, 141),
]
# 全選手一覧を得る。
STATS
# => [#<struct Batter name="西村", avg=0.312, hr=20, rbi=96>,
#     #<struct Batter name="本田", avg=0.213, hr=33, rbi=88>,
#     #<struct Batter name="金村", avg=0.199, hr=55, rbi=101>,
#     #<struct Batter name="吉本", avg=0.344, hr=34, rbi=141>]
# 3割バッターを得る。
STATS.select{|b| b.avg >= 0.3 }
# => [#<struct Batter name="西村", avg=0.312, hr=20, rbi=96>,
#     #<struct Batter name="吉本", avg=0.344, hr=34, rbi=141>]
# 3割30本塁打100打点達成者を得る。
STATS.select{|b| b.avg >= 0.3 and b.hr >= 30 and b.rbi >= 100}
# => [#<struct Batter name="吉本", avg=0.344, hr=34, rbi=141>]
