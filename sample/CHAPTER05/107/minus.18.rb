TEMPLATE = <<EOT
     品物         価格
<% items.each do |name,price| -%>
<%=name.ljust 16 %> <%=price %>円
<% end -%>
EOT
items = [[ "チョコレート", 100 ], ["ジュース", 120 ]]

require 'erb'
puts ERB.new(TEMPLATE, nil, "-").result(binding)
# >>      品物         価格
# >> チョコレート     100円
# >> ジュース         120円
