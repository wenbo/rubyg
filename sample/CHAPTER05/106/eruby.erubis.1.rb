# ERB�ȤϤ������㤦
require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")
# ���������Ʊ��
name = "��Ӥ���"
month = Time.now.month
day = Time.now.day
puts template.result binding
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
