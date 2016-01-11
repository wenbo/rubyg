require 'rubygems'
require 'httpclient'

# 「Hello world!」と書かれたhello.txtをアップロードするために開く。
open("hello.txt") do |file|
  c = HTTPClient.new
# Fileオブジェクトをコントロール名に指定するとそのファイルをアップロードする設定になる。
  postdata = { "file" => file }
  url = "http://www.rubyist.net/~rubikitch/upload-test.cgi"
# ファイルをアップロードし、レスポンスを出力する。
  puts c.post_content(url, postdata)
end
# >> Hello world!
