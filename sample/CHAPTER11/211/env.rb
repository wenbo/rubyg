# 環境変数LANGの値を求める。
ENV["LANG"]           # => "ja_JP.eucJP"
# 環境変数は汚染されている。
ENV["LANG"].tainted?  # => true
# 環境変数LANGを設定しない。
ENV.delete "LANG"     # => "ja_JP.eucJP"
ENV["LANG"]           # => nil
# 環境変数LANGのに新しい値を設定する。
ENV["LANG"]="C"
# 環境変数は子プロセスにも伝播する。
system %!ruby -e 'puts ENV["LANG"]'!
# >> C
