# 遅延初期化式の例
# 未初期化のインスタンス変数はnil。
@v         # => nil # !> instance variable @v not initialized
# 2に遅延初期化する。
@v ||= 2   # => 2
@v         # => 2
# 真の値が設定されている場合、遅延初期化式を評価しても何も起こらない。
@v = 3
@v ||= 2   # => 3
@v         # => 3
#3 ただし、falseは偽なので遅延初期化式で値が設定されてしまう。要注意！
@v = false
@v ||= 2   # => 2
@v         # => 2

# 1〜6のうち偶数の二乗を求める例
(1..6).select{|i| i%2 == 0}.map{|i| i*i} # => [4, 16, 36]
for i in 1..6         # for式はスコープを作らないのでaryは外から見える
# 偶数のとき、二乗をaryに追加する。「ary ||= []」はローカル変数宣言も兼ねている。
  (ary ||= []) << i*i if i%2 == 0
end
ary   # => [4, 16, 36]
# 遅延初期化を使わないとこのようになる。
ary = []
for i in 1..6
  ary << i*i if i%2 == 0
end
ary   # => [4, 16, 36]

# 単語の長さでグループ分けする例（Enumerable#group_byはRuby 1.8.7以降）
"This is a ball".split.group_by{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
module Enumerable
  def my_group_by__delayed
    hash_of_ary = {}    # 簡単のためinjectは使わないでおく
    each do |elem|      # 「self.each」は「each」と書ける
# ブロックの評価結果をキーにして、要素を追加する。
      (hash_of_ary[ yield(elem) ] ||= []) << elem
    end
    hash_of_ary
  end
  def my_group_by__hash_new
# 遅延初期化を使わないときは、ブロック付き((:Hash.new:))を使う。
    hash_of_ary = Hash.new {|h,k| h[k] = []}
    each do |elem|
      hash_of_ary[ yield(elem) ] << elem
    end
    hash_of_ary
  end
end
"This is a ball".split.my_group_by__delayed{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
"This is a ball".split.my_group_by__hash_new{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
