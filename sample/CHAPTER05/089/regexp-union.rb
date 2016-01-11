url = "http://www.ruby-lang.org/"
# urlにマッチする正規表現を作成するが、Regexp.escapeは文字列を返すため、
Regexp.escape(url)              # => "http://www\\.ruby\\-lang\\.org/"
# 正規表現に変換するには正規表現リテラルやRegexp.newと併用する必要がある。
/#{Regexp.escape(url)}/         # => /http:\/\/www\.ruby\-lang\.org\//
Regexp.new(Regexp.escape(url))  # => /http:\/\/www\.ruby\-lang\.org\//
# Regexp.unionを使えば一発で書ける。
Regexp.union(url)               # => /http:\/\/www\.ruby\-lang\.org\//
# 決してマッチしない正規表現。
Regexp.union                           # => /(?!)/
# 引数に正規表現を与えるとエスケープされない。
re = Regexp.union(/a+/, "b+")          # => /(?-mix:a+)|b\+/
[ "aaa".match(re), "b+".match(re) ]    # => [#<MatchData "aaa">, #<MatchData "b+">]
# 四則演算の演算子にマッチする正規表現。
op_re = Regexp.union("+","-","*","/")  # => /\+|\-|\*|\//
# 四則演算式にマッチする正規表現。
expr_re = /(\d+)(#{op_re})(\d+)/       # => /(\d+)((?-mix:\+|\-|\*|\/))(\d+)/
"13*7".match expr_re                   # => #<MatchData "13*7" 1:"13" 2:"*" 3:"7">
"18+1".match expr_re                   # => #<MatchData "18+1" 1:"18" 2:"+" 3:"1">
