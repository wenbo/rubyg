require 'rubygems'
# httpclientライブラリにHTTPClientが定義されているので読み込む
require 'httpclient'

# HTTPClient.newは3つのoptional引数「プロキシのURL」、「User-Agentヘッダ」、「Fromヘッダ」を取る。当然、何も指定しない場合も多い。
hc = HTTPClient.new("http://127.0.0.1:8338", "Ruby/HTTPClient", nil)
url = "http://www.rubyist.net/~rubikitch/formtest.cgi"
# HTTP GETでクエリ「value=test string」を渡す。
puts hc.get_content(url, "value" => "test string")
puts
# HTTP POSTでクエリ「value=test string」を渡す。
puts hc.post_content(url, "value" => "test string")
# >> <html><body>REQUEST_METHOD = GET<br>
# >> value=test string<br></body></html>
# >> 
# >> <html><body>REQUEST_METHOD = POST<br>
# >> value=test string<br></body></html>
