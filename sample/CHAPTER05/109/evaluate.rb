require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")
# ���󥹥����ѿ�������Ū���������
puts template.evaluate :name => "��Ӥ���", :month => Time.now.month, :day => Time.now.day
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
