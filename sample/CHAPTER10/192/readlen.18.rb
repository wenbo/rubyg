#!/usr/local/bin/ruby -Ke
RUBY_VERSION                    # => "1.8.7"
File.read "euc.txt"             # => "日本語\nにほんご\n"
open("euc.txt") {|f| f.read 4 } # => "日本"
File.read "euc.txt", 4          # => "日本"
# IO.readのふたつめのoptional引数は読み込むオフセット
File.read "euc.txt", 4, 7       # => "にほ"
