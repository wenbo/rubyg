#!/usr/local/bin/ruby -Ke
# eRubyテンプレート。
TEMPLATE = <<EOT
     品物         価格
<% items.each do |name,price| %>
<%=name.ljust 16 %> <%=price %>円
<% end %>
EOT
items = [[ "チョコレート", 100 ], ["ジュース", 120 ]]

# erbライブラリにERBが定義されているので読み込む。
require 'erb'
puts "==== ERB default"
# ERBのデフォルトの設定。
puts ERB.new(TEMPLATE).result(binding)
puts "==== ERB trim_mode = <>"
# ERBで行頭と行端がそれぞれ「<%%」、「%>」である場合は改行を出力しない設定。
puts ERB.new(TEMPLATE, nil, "<>").result(binding)
# erubisライブラリにErubis::Erubyが定義されているので読み込む
require 'erubis'
puts "==== Erubis default"
# Erubis::Erubyはデフォルトで余計な改行を出力しない。
puts Erubis::Eruby.new(TEMPLATE).result(binding)
# >> ==== ERB default
# >>      品物         価格
# >> 
# >> チョコレート     100円
# >> 
# >> ジュース         120円
# >> 
# >> ==== ERB trim_mode = <>
# >>      品物         価格
# >> チョコレート     100円
# >> ジュース         120円
# >> ==== Erubis default
# >>      品物         価格
# >> チョコレート     100円
# >> ジュース         120円
