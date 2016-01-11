errmsg = "Error: out of memory"
# 「\A」は文字列の先頭を意味するメタ文字。
errmsg =~ /\AWarning/                   # => nil
errmsg =~ /\AError/                     # => 0
# 特に開始文字列が不特定の場合はRegexp.unionと式展開を組み合わせた正規表現を作成する必要がある。
errmsg =~ /\A#{Regexp.union("Error")}/  # => 0
# 「\z」は文字列の終端を意味するメタ文字。
errmsg =~ /memory\z/                    # => 14
errmsg.match(/memory\z/)                # => #<MatchData "memory">
errmsg.match(/found\z/)                 # => nil
