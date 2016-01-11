#!/usr/local/bin/ruby -Ke
# eRuby�ƥ�ץ졼�ȡ�
TEMPLATE = <<EOT
     ��ʪ         ����
<% items.each do |name,price| %>
<%=name.ljust 16 %> <%=price %>��
<% end %>
EOT
items = [[ "���祳�졼��", 100 ], ["���塼��", 120 ]]

# erb�饤�֥���ERB���������Ƥ���Τ��ɤ߹��ࡣ
require 'erb'
puts "==== ERB default"
# ERB�Υǥե���Ȥ����ꡣ
puts ERB.new(TEMPLATE).result(binding)
puts "==== ERB trim_mode = <>"
# ERB�ǹ�Ƭ�ȹ�ü�����줾���<%%�ס���%>�פǤ�����ϲ��Ԥ���Ϥ��ʤ����ꡣ
puts ERB.new(TEMPLATE, nil, "<>").result(binding)
# erubis�饤�֥���Erubis::Eruby���������Ƥ���Τ��ɤ߹���
require 'erubis'
puts "==== Erubis default"
# Erubis::Eruby�ϥǥե���Ȥ�;�פʲ��Ԥ���Ϥ��ʤ���
puts Erubis::Eruby.new(TEMPLATE).result(binding)
# >> ==== ERB default
# >>      ��ʪ         ����
# >> 
# >> ���祳�졼��     100��
# >> 
# >> ���塼��         120��
# >> 
# >> ==== ERB trim_mode = <>
# >>      ��ʪ         ����
# >> ���祳�졼��     100��
# >> ���塼��         120��
# >> ==== Erubis default
# >>      ��ʪ         ����
# >> ���祳�졼��     100��
# >> ���塼��         120��
