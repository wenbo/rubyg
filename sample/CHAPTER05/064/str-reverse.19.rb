# -*- coding: euc-jp -*-
# 1バイト文字に対してはRuby 1.8と同様。
euc = "マルチバイト"
# Ruby 1.9は文字単位に処理するので正しく動作する。
euc.reverse                     # => "トイバチルマ"
# 旧来のイディオムも使用可能だが遅い。
euc.split(//).reverse.join      # => "トイバチルマ"
