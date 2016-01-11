# uriライブラリにURIが定義されているので読み込む
require 'uri'
# 架空のURLを解析してURIオブジェクトにする。
site = URI("http://example.org/test.cgi?a=b&c=d")
# => #<URI::HTTP:0x897b4c4 URL:http://example.org/test.cgi?a=b&c=d>
# スキーム、ホスト名、ポート番号、パスを抜き出す。HTTPのデフォルトのポート番号は80。
[ site.scheme, site.host, site.port, site.path ]
# => ["http", "example.org", 80, "/test.cgi"]
# クエリ、パスとクエリを抜き出す。
[ site.query, site.request_uri ]  # => ["a=b&c=d", "/test.cgi?a=b&c=d"]
# siteを基準として、相対URI「index.html」を絶対URIに変換する。
site.merge("index.html")
# => #<URI::HTTP:0x8ba11e0 URL:http://example.org/index.html>
# 文字列からURIを抜き出す。文字列の配列になるので注意。
URI.extract("Ruby Home Page <http://www.ruby-lang.org>")
# => ["http://www.ruby-lang.org"]
# mailtoスキームのURI。
URI("mailto:rubikitch@ruby-lang.org")
# => #<URI::MailTo:0x8b9f28c URL:mailto:rubikitch@ruby-lang.org>
# ftpスキームのURI。
URI("ftp://ftp.ruby-lang.org/")
# => #<URI::FTP:0x8ad5ef0 URL:ftp://ftp.ruby-lang.org/>
