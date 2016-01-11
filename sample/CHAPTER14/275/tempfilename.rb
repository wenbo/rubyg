require 'tmpdir'      # 一時ディレクトリを返すDir.tmpdirを定義している
tmp_script = File.join(Dir.tmpdir, "foo.rb") # => "/tmp/foo.rb"
open( tmp_script, "w") do |f|
# スクリプト終了直前に一時ファイルを消す。
  at_exit { File.unlink tmp_script }
  f.puts "puts 'hoge'"
end
# 一時ファイルを外部コマンド（ruby）が使用する。
system "ruby", tmp_script
# >> hoge
