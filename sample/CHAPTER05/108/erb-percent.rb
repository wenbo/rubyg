#!/usr/local/bin/ruby -Ke
# ̵Ÿ������������˹�Ƭ�Ρ�%�פ��Ȥ��롣%����Ϥޤ�Ԥϡ�%%�פȵ��Ҥ��롣
TEMPLATE = <<EOT
%%    ��ʪ         ����
% items.each do |name,price|
<%=name.ljust 16 %> <%=price %>��
% end
EOT
items = [[ "���祳�졼��", 100 ], ["���塼��", 120 ]]

require 'erb'
puts "==== ERB trim_mode = %"
# ERB�ǳ�ĥʸˡ��ͭ���ˤ������ꡣ
puts ERB.new(TEMPLATE, nil, "%").result(binding)
require 'erubis'
# Erubis::PercentLineEnhancer�򥤥󥯥롼�ɤ���Erubis::Eruby�Υ��֥��饹��������롣
class Erubis::PercentLineEruby < Erubis::Eruby
  include Erubis::PercentLineEnhancer
end
puts "==== Erubis::PercentLineEruby"
puts Erubis::PercentLineEruby.new(TEMPLATE).result(binding)
# >> ==== ERB trim_mode = %
# >> %    ��ʪ         ����
# >> ���祳�졼��     100��
# >> ���塼��         120��
# >> ==== Erubis::PercentLineEruby
# >> %    ��ʪ         ����
# >> ���祳�졼��     100��
# >> ���塼��         120��
