# 「%!STRING!」と「%Q!STRING!」：ダブルクォート文字列
%!ab\n!                          # => "ab\n"
%Q!1+1 = #{1+1}!                 # => "1+1 = 2"
"\"abc\""                        # => "\"abc\""
%#"abc"#                         # => "\"abc\""
%((abc))                         # => "(abc)"
%Q!<a href="/">site</a>!         # => "<a href=\"/\">site</a>"

# 「%q!STRING」!：シングルクォート文字列
'<a href=\'/\'>Top</a>'          # => "<a href='/'>Top</a>"
%q!<a href='/'>Top</a>!          # => "<a href='/'>Top</a>"
%q((let ((a 1) (b 2)) (+ a b)))  # => "(let ((a 1) (b 2)) (+ a b))"

# 「%x!STRING!」：コマンド出力
`echo backquote`                 # => "backquote\n"
%x[echo backquote]               # => "backquote\n"
`echo "#{2+3}\t#{1+6}"`          # => "5\t7\n"
%x$echo "#{2+3}\t#{1+6}"$        # => "5\t7\n"

# ネストしたコマンド出力
`echo \`echo hoge\``             # => "hoge\n"
%x!echo `echo hoge`!             # => "hoge\n"

# 「%r!STRING!」：正規表現
%r!foo!                          # => /foo/
/<title>(.+?)<\/title>/m         # => /<title>(.+?)<\/title>/m
%r!<title>(.+?)</title>!m        # => /<title>(.+?)<\/title>/m

# 「%w!STRING!」と「%W!STRING!」：要素が文字列の配列
%w[a b c d]                      # => ["a", "b", "c", "d"]
%w[a#{'b'}\ c defg]              # => ["a\#{'b'} c", "defg"]
%W[a#{'b'}\ c defg]              # => ["ab c", "defg"]
a = %w[
foo
bar
baz
]
a                                # => ["foo", "bar", "baz"]

# 「%s!STRING!」:シンボル
%s!foo!                          # => :foo
