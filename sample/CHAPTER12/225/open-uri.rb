# open-uriライブラリにURI#readが定義されているので読み込む
require 'open-uri'
uri = URI("http://www.ruby-lang.org/")
# URLの内容を文字列で得る。
ruby_en = uri.read
# 文字列だが、OpenURI::Metaがextendされている。
ruby_en.class                # => String
ruby_en.is_a? OpenURI::Meta  # => true
ruby_en.bytesize             # => 12083
# タイトルを抜き出す。
ruby_en[%r!<title>(.+)</title>!i, 1]  # => "Ruby Programming Language"
# これらのメソッドはOpenURI::Metaによる特異メソッド。http://www.ruby-lang.org/en/ へリダイレクトされたことがわかる。
ruby_en.charset           # => "utf-8"
ruby_en.content_type      # => "text/html"
ruby_en.last_modified     # => nil
ruby_en.content_encoding  # => []
ruby_en.base_uri  # => #<URI::HTTP:0x84d4b14 URL:http://www.ruby-lang.org/en/>

# 日本語サイトの内容を文字列で得る。
ruby_ja = uri.read("Accept-Language" => "ja")
ruby_ja.bytesize  # => 15684
# http://www.ruby-lang.org/ja/ へリダイレクトされたことがわかる。
ruby_ja.base_uri  # => #<URI::HTTP:0x83b88c0 URL:http://www.ruby-lang.org/ja/>
