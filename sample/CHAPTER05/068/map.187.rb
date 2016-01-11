RUBY_VERSION                          # => "1.8.7"
multi_line = "abc\ndef\n"             # 2行の文字列
# 従来の方法
multi_line.map {|l| "<#{l}>" }        # => ["<abc\n>", "<def\n>"]
multi_line.grep(/a/)                  # => ["abc\n"]
multi_line.to_a                       # => ["abc\n", "def\n"]
# これからの方法
multi_line.lines.map {|l| "<#{l}>" }  # => ["<abc\n>", "<def\n>"]
multi_line.lines.grep(/a/)            # => ["abc\n"]
multi_line.lines.to_a                 # => ["abc\n", "def\n"]

