# �Ķ��ѿ�LANG���ͤ���롣
ENV["LANG"]           # => "ja_JP.eucJP"
# �Ķ��ѿ��ϱ�������Ƥ��롣
ENV["LANG"].tainted?  # => true
# �Ķ��ѿ�LANG�����ꤷ�ʤ���
ENV.delete "LANG"     # => "ja_JP.eucJP"
ENV["LANG"]           # => nil
# �Ķ��ѿ�LANG�Τ˿������ͤ����ꤹ�롣
ENV["LANG"]="C"
# �Ķ��ѿ��ϻҥץ����ˤ����Ť��롣
system %!ruby -e 'puts ENV["LANG"]'!
# >> C
