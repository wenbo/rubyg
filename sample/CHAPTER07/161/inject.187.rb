# Ruby 1.8.7以降はわざわざsumを定義しなくてもコンパクトに書ける。
[1,2,3,4,5].inject(:+)    # => 15
%w[a b c d e].inject(:+)  # => "abcde"
# reduceは別名
(1..10).reduce(:+)        # => 55
