require 'rubygems'
# httpclient�饤�֥���HTTPClient���������Ƥ���Τ��ɤ߹���
require 'httpclient'

# HTTPClient.new��3�Ĥ�optional�����֥ץ�����URL�ס���User-Agent�إå��ס���From�إå��פ��롣������������ꤷ�ʤ�����¿����
hc = HTTPClient.new("http://127.0.0.1:8338", "Ruby/HTTPClient", nil)
url = "http://www.rubyist.net/~rubikitch/formtest.cgi"
# HTTP GET�ǥ������value=test string�פ��Ϥ���
puts hc.get_content(url, "value" => "test string")
puts
# HTTP POST�ǥ������value=test string�פ��Ϥ���
puts hc.post_content(url, "value" => "test string")
# >> <html><body>REQUEST_METHOD = GET<br>
# >> value=test string<br></body></html>
# >> 
# >> <html><body>REQUEST_METHOD = POST<br>
# >> value=test string<br></body></html>
