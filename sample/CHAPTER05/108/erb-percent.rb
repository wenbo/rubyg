#!/usr/local/bin/ruby -Ke
# 無展開タグの代わりに行頭の「%」が使える。%から始まる行は「%%」と記述する。
TEMPLATE = <<EOT
%%    品物         価格
% items.each do |name,price|
<%=name.ljust 16 %> <%=price %>円
% end
EOT
items = [[ "チョコレート", 100 ], ["ジュース", 120 ]]

require 'erb'
puts "==== ERB trim_mode = %"
# ERBで拡張文法を有効にする設定。
puts ERB.new(TEMPLATE, nil, "%").result(binding)
require 'erubis'
# Erubis::PercentLineEnhancerをインクルードしたErubis::Erubyのサブクラスを定義する。
class Erubis::PercentLineEruby < Erubis::Eruby
  include Erubis::PercentLineEnhancer
end
puts "==== Erubis::PercentLineEruby"
puts Erubis::PercentLineEruby.new(TEMPLATE).result(binding)
# >> ==== ERB trim_mode = %
# >> %    品物         価格
# >> チョコレート     100円
# >> ジュース         120円
# >> ==== Erubis::PercentLineEruby
# >> %    品物         価格
# >> チョコレート     100円
# >> ジュース         120円
