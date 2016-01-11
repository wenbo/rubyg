s = "tiTlE"
# 大文字にする。
s.upcase       # => "TITLE"
# 小文字にする。
s.downcase     # => "title"
# 先頭の文字を大文字に、残りを小文字にする。
s.capitalize   # => "Title"
# 大文字と小文字を入れ替える。
s.swapcase     # => "TItLe"
# それらの破壊的バージョン。文字列が変更されなければnilを返す。
s.upcase!      # => "TITLE"
s.upcase!      # => nil
s.downcase!    # => "title"
s.capitalize!  # => "Title"
s.swapcase!    # => "tITLE"
s              # => "tITLE"
