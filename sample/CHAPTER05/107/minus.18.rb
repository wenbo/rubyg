TEMPLATE = <<EOT
     ��ʪ         ����
<% items.each do |name,price| -%>
<%=name.ljust 16 %> <%=price %>��
<% end -%>
EOT
items = [[ "���祳�졼��", 100 ], ["���塼��", 120 ]]

require 'erb'
puts ERB.new(TEMPLATE, nil, "-").result(binding)
# >>      ��ʪ         ����
# >> ���祳�졼��     100��
# >> ���塼��         120��
