require 'erb'
# �ƥ�ץ졼�ȥե�����eruby.rtxt���ɤ߹����ERB���֥������Ȥ����
template = ERB.new File.read("eruby.rtxt")
# �������ѿ��򥻥åȤ���
name = "��Ӥ���"
month = Time.now.month
day = Time.now.day
# �ƥ�ץ졼�ȼ¹�
puts template.result binding
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
