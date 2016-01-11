# open-uri�饤�֥���URI#read���������Ƥ���Τ��ɤ߹���
require 'open-uri'
uri = URI("http://www.ruby-lang.org/")
# URL�����Ƥ�ʸ��������롣
ruby_en = uri.read
# ʸ���������OpenURI::Meta��extend����Ƥ��롣
ruby_en.class                # => String
ruby_en.is_a? OpenURI::Meta  # => true
ruby_en.bytesize             # => 12083
# �����ȥ��ȴ���Ф���
ruby_en[%r!<title>(.+)</title>!i, 1]  # => "Ruby Programming Language"
# �����Υ᥽�åɤ�OpenURI::Meta�ˤ���ðۥ᥽�åɡ�http://www.ruby-lang.org/en/ �إ�����쥯�Ȥ��줿���Ȥ��狼�롣
ruby_en.charset           # => "utf-8"
ruby_en.content_type      # => "text/html"
ruby_en.last_modified     # => nil
ruby_en.content_encoding  # => []
ruby_en.base_uri  # => #<URI::HTTP:0x84d4b14 URL:http://www.ruby-lang.org/en/>

# ���ܸ쥵���Ȥ����Ƥ�ʸ��������롣
ruby_ja = uri.read("Accept-Language" => "ja")
ruby_ja.bytesize  # => 15684
# http://www.ruby-lang.org/ja/ �إ�����쥯�Ȥ��줿���Ȥ��狼�롣
ruby_ja.base_uri  # => #<URI::HTTP:0x83b88c0 URL:http://www.ruby-lang.org/ja/>
