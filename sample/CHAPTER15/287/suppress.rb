require 'rubygems'
require 'active_support'
# ZeroDivisionErrorかSyntaxErrorは無視されてnilが返る。
suppress(ZeroDivisionError, SyntaxError) { 1/0; :not_reached }  # => nil
# 該当する例外ではない場合は例外が発生する。
suppress(SecurityError) { 1/0 } rescue $!  # => #<ZeroDivisionError: divided by 0>
# 例外が発生しない場合は最後に評価した値が返る。
suppress(SecurityError) { 1; 2 }           # => 2
