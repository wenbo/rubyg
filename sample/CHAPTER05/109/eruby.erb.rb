require 'erb'
template = ERB.new File.read("eruby.rtxt")
# eRuby������ץȼ¹��ѥ��֥������Ȥ������������ʸ̮��ɾ������
Object.new.instance_eval do 
  @name = "��Ӥ���"
  @month = Time.now.month
  @day = Time.now.day
  puts template.result binding
end
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
