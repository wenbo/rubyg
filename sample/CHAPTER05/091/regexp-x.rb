scheme = /(https?|ftp)/
host = /([^\/:]+)/
port = /(?::(\d+))?/
path = /([^?]+)?/
query = /(?:\?(.+))?/
# 部分正規表現を式展開で埋め込む。
url_re = %r!#{scheme}://#{host}#{port}/#{path}#{query}!
# => /(?-mix:(https?|ftp)):\/\/(?-mix:([^\/:]+))(?-mix:(?::(\d+))?)\/(?-mix:([^?]+)?)(?-mix:(?:\?(.+))?)/
"https://example.com:7654/foo.cgi?v=1".match(url_re).captures
# => ["https", "example.com", "7654", "foo.cgi", "v=1"]

# xオプションをつけると、正規表現にスペースやコメントを入れることができる。
url_rex = %r!
 (https?|ftp)    # $1:scheme
 ://
 ([^\/:]+)       # $2:host
 (?::(\d+))?     # $3:port
 /
 ([^?]+)?        # $4:path
 (?:\?(.+))?     # $5:query
!x
"https://example.com:7654/foo.cgi?v=1".match(url_rex).captures
# => ["https", "example.com", "7654", "foo.cgi", "v=1"]

# 空白文字、「#」は「\」でエスケープする。
" #" =~ /\A  \ \#  \z/x  # => 0
# あるいは、「\s」で代用する方法もある。ただし、タブや改行にもマッチする。
" " =~ /\A\s\z/x         # => 0
