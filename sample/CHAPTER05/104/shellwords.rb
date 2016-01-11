# shellwordsライブラリにShellwords#shellwordsが定義されているので読み込む
require 'shellwords'
# 引用符の中ならばスペースを含めることができる。
Shellwords.shellwords %q!ruby -e 'puts "fuga"'! # => ["ruby", "-e", "puts \"fuga\""]
# モジュール関数なのでincludeして関数的メソッド呼び出しができる。
include Shellwords
# 空文字列を含む例。
shellwords %q!ruby -e ''!                       # => ["ruby", "-e", ""]
shellwords %q!ruby -e ""!                       # => ["ruby", "-e", ""]
shellwords %q!echo fuga!                        # => ["echo", "fuga"]
