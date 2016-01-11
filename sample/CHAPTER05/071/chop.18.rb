#!/usr/local/bin/ruby -Ke
# 末尾の1バイトを取り除いた文字列を作成する。
"System\n".chop                       # => "System"
# 末尾の2バイトを取り除いた文字列を作成する。
"System\n".chop.chop                  # => "Syste"
# 末尾が「\r\n」ならばどちらも取り除く。この場合は破壊的に。
"System\r\n".chop!                    # => "System"
# バイト単位なので2回chopしないとEUC-JPな日本語文字は取り除けない。UTF-8ならば3回。
"著者名".chop!.chop!                  # => "著者"
# 末尾の改行を取り除く。
"System\n".chomp                      # => "System"
# 取り除くのは改行のみなので、改行で終わらない場合は何もしない。
"System\n".chomp.chomp                # => "System"
# 末尾が「\r\n」ならばどちらも取り除く。
"System\r\n".chomp!                   # => "System"
# 末尾の「\001\001」を取り除く。
"XYZP/1.1\001\001".chomp! "\001\001"  # => "XYZP/1.1"
# 引数に空文字列を指定したら、末尾の連続する改行を取り除く。
"cgi.rb\nerb.rb\n\n\n".chomp! ""      # => "cgi.rb\nerb.rb"
# 複数行の文字列を行単位に処理する
multi_line = <<EOS
first
second
EOS
multi_line.each_line do |line|
  puts "WRONG: <#{line}>"       # 改行を取り除いていないので間違い
end
puts
multi_line.each_line do |line|
  puts "<#{line.chomp}>"        # 非破壊的メソッドを埋め込む
end
multi_line.each_line do |line|
  line.chomp!                   # 破壊的メソッドで処理前に改行を取り除く
  puts "(#{line})"
end
# >> WRONG: <first
# >> >
# >> WRONG: <second
# >> >
# >> 
# >> <first>
# >> <second>
# >> (first)
# >> (second)
