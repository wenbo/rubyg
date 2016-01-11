require 'shellwords'
# スペースはシェルのメタ文字をエスケープする。
"argument with (space)".shellescape # => "argument\\ with\\ \\(space\\)"
cmd = %q!ruby -e 'puts "fuga"'!
# 単語分割する。
args = cmd.shellsplit               # => ["ruby", "-e", "puts \"fuga\""]
# シェルが解釈できるように単語をつなげる。スペースはエスケープされる。シェルの解釈ではcmdと等価。
args.shelljoin                      # => "ruby -e puts\\ \\\"fuga\\\""
# Kernel#openとの併用例。
open("|" << ["echo", "foo bar"].shelljoin) do |io|
  io.read                           # => "foo bar\n"
end
# Kernel#systemがシェルを媒介するとき、コマンドライン引数の配列はArray#shelljoinで展開する。
system "#{args.shelljoin}; #{args.shelljoin}"
# >> fuga
# >> fuga
