class FibonacciTest  # フィボナッチ数列でmemoizeの効果を検証するクラス
  def initialize() @fib_calls = @fib_memoized_block_calls = 0 end
  attr_reader :fib_calls, :fib_memoized_block_calls  # カウンター
  def fib(n)                    # memoizeしない場合
# 呼ばれた回数をカウントアップする。
    @fib_calls += 1
    case n
    when 1,2 then 1
    else fib(n-1) + fib(n-2)    # 再帰
    end
  end
  def fib_memoized(m)           # memoizeする場合
# メソッドが再び呼ばれたときに同じハッシュを再利用するため、遅延初期化する。
    @memoize_hash ||= Hash.new do |h,n|
# 呼ばれた回数をカウントアップする。
      @fib_memoized_block_calls += 1
# 存在しないキーの場合、新たにキーと値を関連付ける。fibの定義との類似性に注目。
      h[n] = case n
             when 1,2 then 1
             else h[n-1] + h[n-2]
             end
    end
    @memoize_hash[m]
  end
end
fib = FibonacciTest.new
fib.fib 30                    # => 832040
fib.fib_memoized 30           # => 832040
# フィボナッチ数列計算ルーチンを呼んだ回数を比較する。
fib.fib_calls                 # => 1664079
fib.fib_memoized_block_calls  # => 30
# 10番目までの要素を列挙する。
(1..10).map {|i| fib.fib_memoized(i) }  # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
# キャッシュを初期化し、かかった時間を比較する。
require 'benchmark'
Benchmark.bm(20) do |b|
  fib = FibonacciTest.new
  b.report("not memoized") { fib.fib 30 } 
  b.report("memoized") { fib.fib_memoized 30 } 
end
# >>                           user     system      total        real
# >> not memoized          0.740000   0.000000   0.740000 (  0.871795)
# >> memoized              0.000000   0.000000   0.000000 (  0.000107)
