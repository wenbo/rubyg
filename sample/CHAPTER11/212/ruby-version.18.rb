# Rubyのバージョン。
RUBY_VERSION       # => "1.8.7"
# Rubyのパッチレベル。
RUBY_PATCHLEVEL    # => 160
# リリースした日付、あるいは最終更新時刻。
RUBY_RELEASE_DATE  # => "2009-04-08"
# 「ruby -v」で表示される文字列。（Ruby 1.8.7以降）
RUBY_DESCRIPTION   # => "ruby 1.8.7 (2009-04-08 patchlevel 160) [i686-linux]"
# Ruby 1.8の場合は「old」を返す。
if RUBY_VERSION >= "1.9" then "new" else "old" end  # => "old"
