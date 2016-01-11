require 'rubygems'
require 'active_support'

"".blank?            # => true
# 空白文字からなる文字列は空白とみなされる。
" \t\r\n".blank?     # => true
# 非空白文字が含まれていたら空白ではない。
" \t\r a \n".blank?  # => false
nil.blank?           # => true
false.blank?         # => true
true.blank?          # => false
[].blank?            # => true
{}.blank?            # => true
# 0は空白ではないので注意。
0.blank?             # => false
Object.new.blank?    # => false
