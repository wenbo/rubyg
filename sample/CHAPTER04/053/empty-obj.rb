# 空文字列、空配列、空ハッシュでtrueになる。
"".empty?   # => true
[].empty?   # => true
{}.empty?   # => true
# 空白文字のみの文字列では空とはみなされない。
" ".empty?  # => false
# nilやfalseにはempty?が定義されていないのでエラーになる。
nil.empty? rescue $!
# => #<NoMethodError: undefined method `empty?' for nil:NilClass>
false.empty? rescue $!
# => #<NoMethodError: undefined method `empty?' for false:FalseClass>
# 空のオブジェクトは偽ではなく真である。注意！
if "" # !> string literal in condition
  puts "空文字列は真である"
else
  puts "空文字列は偽である"
end
# >> 空文字列は真である
