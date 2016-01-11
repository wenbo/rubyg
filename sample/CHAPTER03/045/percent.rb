# ��%!STRING!�פȡ�%Q!STRING!�ס����֥륯������ʸ����
%!ab\n!                          # => "ab\n"
%Q!1+1 = #{1+1}!                 # => "1+1 = 2"
"\"abc\""                        # => "\"abc\""
%#"abc"#                         # => "\"abc\""
%((abc))                         # => "(abc)"
%Q!<a href="/">site</a>!         # => "<a href=\"/\">site</a>"

# ��%q!STRING��!�����󥰥륯������ʸ����
'<a href=\'/\'>Top</a>'          # => "<a href='/'>Top</a>"
%q!<a href='/'>Top</a>!          # => "<a href='/'>Top</a>"
%q((let ((a 1) (b 2)) (+ a b)))  # => "(let ((a 1) (b 2)) (+ a b))"

# ��%x!STRING!�ס����ޥ�ɽ���
`echo backquote`                 # => "backquote\n"
%x[echo backquote]               # => "backquote\n"
`echo "#{2+3}\t#{1+6}"`          # => "5\t7\n"
%x$echo "#{2+3}\t#{1+6}"$        # => "5\t7\n"

# �ͥ��Ȥ������ޥ�ɽ���
`echo \`echo hoge\``             # => "hoge\n"
%x!echo `echo hoge`!             # => "hoge\n"

# ��%r!STRING!�ס�����ɽ��
%r!foo!                          # => /foo/
/<title>(.+?)<\/title>/m         # => /<title>(.+?)<\/title>/m
%r!<title>(.+?)</title>!m        # => /<title>(.+?)<\/title>/m

# ��%w!STRING!�פȡ�%W!STRING!�ס����Ǥ�ʸ���������
%w[a b c d]                      # => ["a", "b", "c", "d"]
%w[a#{'b'}\ c defg]              # => ["a\#{'b'} c", "defg"]
%W[a#{'b'}\ c defg]              # => ["ab c", "defg"]
a = %w[
foo
bar
baz
]
a                                # => ["foo", "bar", "baz"]

# ��%s!STRING!��:����ܥ�
%s!foo!                          # => :foo
