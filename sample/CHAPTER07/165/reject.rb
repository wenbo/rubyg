#!/usr/local/bin/ruby -Ke
PASS_MARK = 65                  # 合格点を設定
STATS = [["Ted", 77], ["Bob", 55], ["Meg", 61], ["Andy", 99]] # 成績表を配列の配列で表現
# 不合格者の名前を配列で得る。「reject」メソッドのブロックには合格条件を書くことがポイント。条件を逆にして「select」を使用してもよい。「reject」の結果は名前と得点の配列になるので、名前だけを得るために((:Enumerable#map:))を使用する。
not_passed = STATS.reject{|name, score| score >= PASS_MARK }.map{|name,| name}
# 成績表を整形して結果発表。puts関数で配列を指定すると各要素ごとに改行される。Array#joinで名前と名前の間に「、」を挿入する。
print "今回のテストの結果は", STATS.map{|name, score| "#{name}: #{score}点"}.join("、")
print "です。\n不合格者は#{not_passed.join '、'}です。\n"
# >> 今回のテストの結果はTed: 77点、Bob: 55点、Meg: 61点、Andy: 99点です。
# >> 不合格者はBob、Megです。
