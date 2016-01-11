# 「print」で文字列を表示する。改行されないので、改行したい場合は明示的に指定する。
print "This is print.\n"
# 「puts」で文字列を表示する。最後に改行される。
puts "This is puts."
# 「print」も「puts」も複数個のオブジェクトが指定できる。「puts」は引数ごとに改行する。
print 1,"str",/regexp/,"\n"
puts 1,"str",/regexp/
# 無引数の「puts」は空行を出力する。
puts
# 「puts」に配列を指定したら要素ごとに改行される。
puts [1,2],3
# 出力先が標準出力であることを明示する。
$stdout.puts "by IO#puts"
# printの別形式。
"by display\n".display
# >> This is print.
# >> This is puts.
# >> 1str(?-mix:regexp)
# >> 1
# >> str
# >> (?-mix:regexp)
# >> 
# >> 1
# >> 2
# >> 3
# >> by IO#puts
# >> by display
