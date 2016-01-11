# パイプで実行するRubyスクリプト。標準入力から1行を読み、単語を2語出力する。出力の終わりは「^D」。
script = %q{
  STDOUT.sync = true
  ARGF.each_line {|l| l.chomp!; print "#{l.upcase}\n#{l.capitalize}\C-d" }
}
# 子プロセスとしてRubyインタプリタを起動し、読み書き両用のパイプを作成する。
IO.popen(%[ruby -e '#{script}'], "w+") do |pipe|
  DELIMITER = "\C-d"
# パイプに単語を投入する。
  pipe.puts "word"
# DELIMITERまでパイプを読む。
  answer = pipe.gets(DELIMITER)                      # => "WORD\nWord\x04"
# 末尾のDELIMITERを削る。
  answer.chomp!(DELIMITER)                           # => "WORD\nWord"
# 区切りの改行を分割する。
  answer.split(/\n/)                                 # => ["WORD", "Word"]
# 以下同様。
  pipe.puts "ruby"
  pipe.gets(DELIMITER).chomp(DELIMITER).split(/\n/)  # => ["RUBY", "Ruby"]
  pipe.puts "rails"
  pipe.gets(DELIMITER).chomp(DELIMITER).split(/\n/)  # => ["RAILS", "Rails"]
  # パイプにデータが残っていないため、この時点でpipe.getsすると永遠に待ち続ける
end
