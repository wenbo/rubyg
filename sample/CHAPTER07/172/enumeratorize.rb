RUBY_VERSION                    # => "1.8.7"
def two_times                   # ブロックを2回呼び出す
  return to_enum(:two_times) unless block_given? # 加える
  yield "one"; yield "two"
end
two_times { puts "ok" }
two_times                       # => #<Enumerable::Enumerator:0xb7ceb320>
two_times.with_index{|i,j| p [i,j]}
# >> ok
# >> ok
# >> ["one", 0]
# >> ["two", 1]
