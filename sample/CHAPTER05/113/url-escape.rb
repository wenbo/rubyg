#!/usr/local/bin/ruby -Ke
require 'cgi'
require 'kconv'

url = "http://ja.wikipedia.org/wiki/%E5%87%BA%E5%8A%9B"
# URL�ǥ����ɤ��롣
CGI.unescape(url).toeuc         # => "http://ja.wikipedia.org/wiki/����"

# query���б�����Google������URL���֤��ؿ���URL���󥳡��ɤ�ɬ�ס�
def google_url(query)
  "http://www.google.com/search?q=#{CGI.escape(query.toutf8)}&hl=ja"
end
google_url "����"  # => "http://www.google.com/search?q=%E8%A8%80%E8%AA%9E&hl=ja"
google_url "CGI"   # => "http://www.google.com/search?q=CGI&hl=ja"
