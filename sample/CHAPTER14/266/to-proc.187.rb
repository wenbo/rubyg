s = "ball"
# Kernel#pをオブジェクトとして取り出す。
p = method(:p)                          # => #<Method: Object(Kernel)#p>
# p(s)と同様の効果なので「ball」と表示される。
p[s]
# proc {|*x| p(*x)} と同様。
p.to_proc                               # => #<Proc:0xb7d9da0c@-:7>
# 両者は等価なので、「ball」と表示される。
s.tap {|x| p(x) }                       # => "ball"
s.tap(&p)                               # => "ball"
# 1〜6のうち偶数のみを取り出す。両者は等価。to_procのおかげで簡潔に記述できる。
(1..6).select {|x| x.even? }            # => [2, 4, 6]
(1..6).select(&:even?)                  # => [2, 4, 6]
# 文字列配列の要素を大文字にする。両者は等価。
%w[cat tiger lion].map {|x| x.upcase }  # => ["CAT", "TIGER", "LION"]
%w[cat tiger lion].map(&:upcase)        # => ["CAT", "TIGER", "LION"]
# 文字列配列の要素を整数配列にする。
%w[1 10 100 1000].map(&:to_i)           # => [1, 10, 100, 1000]
# 文字配列を文字列配列にする。Ruby 1.9では「?a」は"a"だが、String#chrが定義されているため、問題なく動く。
[?a, ?b].map(&:chr)                     # => ["a", "b"]
"cat\ntiger\nlion\n".lines.to_a         # => ["cat\n", "tiger\n", "lion\n"]
# 改行を取り除いて、各行を得る。
"cat\ntiger\nlion\n".lines.map(&:chomp) # => ["cat", "tiger", "lion"]
# >> "ball"
# >> "ball"
# >> "ball"
