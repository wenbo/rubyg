RUBY_VERSION                          # => "1.8.7"
multi_line = "abc\ndef\n"             # 2�Ԥ�ʸ����
# �������ˡ
multi_line.map {|l| "<#{l}>" }        # => ["<abc\n>", "<def\n>"]
multi_line.grep(/a/)                  # => ["abc\n"]
multi_line.to_a                       # => ["abc\n", "def\n"]
# ���줫�����ˡ
multi_line.lines.map {|l| "<#{l}>" }  # => ["<abc\n>", "<def\n>"]
multi_line.lines.grep(/a/)            # => ["abc\n"]
multi_line.lines.to_a                 # => ["abc\n", "def\n"]

