# uri�饤�֥���URI���������Ƥ���Τ��ɤ߹���
require 'uri'
# �Ͷ���URL����Ϥ���URI���֥������Ȥˤ��롣
site = URI("http://example.org/test.cgi?a=b&c=d")
# => #<URI::HTTP:0x897b4c4 URL:http://example.org/test.cgi?a=b&c=d>
# �������ࡢ�ۥ���̾���ݡ����ֹ桢�ѥ���ȴ���Ф���HTTP�Υǥե���ȤΥݡ����ֹ��80��
[ site.scheme, site.host, site.port, site.path ]
# => ["http", "example.org", 80, "/test.cgi"]
# �����ꡢ�ѥ��ȥ������ȴ���Ф���
[ site.query, site.request_uri ]  # => ["a=b&c=d", "/test.cgi?a=b&c=d"]
# site����Ȥ��ơ�����URI��index.html�פ�����URI���Ѵ����롣
site.merge("index.html")
# => #<URI::HTTP:0x8ba11e0 URL:http://example.org/index.html>
# ʸ���󤫤�URI��ȴ���Ф���ʸ���������ˤʤ�Τ���ա�
URI.extract("Ruby Home Page <http://www.ruby-lang.org>")
# => ["http://www.ruby-lang.org"]
# mailto���������URI��
URI("mailto:rubikitch@ruby-lang.org")
# => #<URI::MailTo:0x8b9f28c URL:mailto:rubikitch@ruby-lang.org>
# ftp���������URI��
URI("ftp://ftp.ruby-lang.org/")
# => #<URI::FTP:0x8ad5ef0 URL:ftp://ftp.ruby-lang.org/>
