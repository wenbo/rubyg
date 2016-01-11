#!/usr/local/bin/ruby -Ke
# 単純な例
# ブロックをつけないと無限ループを表すEnumeratorになる。
(1..3).cycle          # => #<Enumerator:0x8695f84>
# 3周繰り返す。
(1..3).cycle(3).to_a  # => [1, 2, 3, 1, 2, 3, 1, 2, 3]
# 無限ループなので((:Enumerable#take:))と組み合わせて10個だけ抜き出す。
(1..3).cycle.take(10) # => [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# 当番制の例
# <%= require_description 'Date', "date" %>
require 'date'
# 2008/1/10からの7日間のうち、土日を除いた日付を得る。((:Date#wday:))は曜日を整数で得る。日曜日が0。
start = Date.new 2008, 1, 10
ndays = 7
dates = (start...start+ndays).reject{|d| [0,6].include? d.wday }
# 3人交代の当番を決定する。
dates.zip(%w[佐野 東 阿部].cycle.take(ndays)).map{|d,n| d.strftime("%y/%m/%d(%a) #{n}")}
# => ["08/01/10(Thu) 佐野",
#     "08/01/11(Fri) 東",
#     "08/01/14(Mon) 阿部",
#     "08/01/15(Tue) 佐野",
#     "08/01/16(Wed) 東"]

# スレッドと無限ループの例
# 0.1秒ごとにdog, cat, dog, ...を表示していくスレッド。スレッドなので無限ループでも構わない。
Thread.start do 
  %w[dog cat].cycle {|animal| puts animal; sleep 0.1 }
end
# 0.21秒待つ間に表示される。メインスレッドが終了すると無限ループスレッドも強制終了する。
sleep 0.21
# >> dog
# >> cat
# >> dog
