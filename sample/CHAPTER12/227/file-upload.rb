require 'rubygems'
require 'httpclient'

# ��Hello world!�פȽ񤫤줿hello.txt�򥢥åץ��ɤ��뤿��˳�����
open("hello.txt") do |file|
  c = HTTPClient.new
# File���֥������Ȥ򥳥�ȥ���̾�˻��ꤹ��Ȥ��Υե�����򥢥åץ��ɤ�������ˤʤ롣
  postdata = { "file" => file }
  url = "http://www.rubyist.net/~rubikitch/upload-test.cgi"
# �ե�����򥢥åץ��ɤ����쥹�ݥ󥹤���Ϥ��롣
  puts c.post_content(url, postdata)
end
# >> Hello world!
