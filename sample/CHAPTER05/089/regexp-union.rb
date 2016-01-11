url = "http://www.ruby-lang.org/"
# url�˥ޥå���������ɽ����������뤬��Regexp.escape��ʸ������֤����ᡢ
Regexp.escape(url)              # => "http://www\\.ruby\\-lang\\.org/"
# ����ɽ�����Ѵ�����ˤ�����ɽ����ƥ���Regexp.new��ʻ�Ѥ���ɬ�פ����롣
/#{Regexp.escape(url)}/         # => /http:\/\/www\.ruby\-lang\.org\//
Regexp.new(Regexp.escape(url))  # => /http:\/\/www\.ruby\-lang\.org\//
# Regexp.union��Ȥ��а�ȯ�ǽ񤱤롣
Regexp.union(url)               # => /http:\/\/www\.ruby\-lang\.org\//
# �褷�ƥޥå����ʤ�����ɽ����
Regexp.union                           # => /(?!)/
# ����������ɽ����Ϳ����ȥ��������פ���ʤ���
re = Regexp.union(/a+/, "b+")          # => /(?-mix:a+)|b\+/
[ "aaa".match(re), "b+".match(re) ]    # => [#<MatchData "aaa">, #<MatchData "b+">]
# ��§�黻�α黻�Ҥ˥ޥå���������ɽ����
op_re = Regexp.union("+","-","*","/")  # => /\+|\-|\*|\//
# ��§�黻���˥ޥå���������ɽ����
expr_re = /(\d+)(#{op_re})(\d+)/       # => /(\d+)((?-mix:\+|\-|\*|\/))(\d+)/
"13*7".match expr_re                   # => #<MatchData "13*7" 1:"13" 2:"*" 3:"7">
"18+1".match expr_re                   # => #<MatchData "18+1" 1:"18" 2:"+" 3:"1">
