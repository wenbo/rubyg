# -*- coding: euc-jp -*-
# 日本語を含まない文字列は文字数＝バイト数である。
"abcdef".length              # => 6
# 日本語文字列でもきちんと文字数を返してくれる。
ja = "日本語"
ja.encoding                  # => #<Encoding:EUC-JP>
ja.length                    # => 3
ja.size                      # => 3
# 旧来のイディオムも使用できるが圧倒的に遅くなる。
ja.split(//).length          # => 3
ja.scan(/./).length          # => 3
ja.chars.count               # => 3
# バイト数が欲しい場合はString#bytesizeを使う。
ja.bytesize                  # => 6
# UTF-8に変換したときのバイト数を得る。
ja.encode("UTF-8").bytesize  # => 9
