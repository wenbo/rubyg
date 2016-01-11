require 'erb'
include ERB::Util
eruby = ERB.new <<EOF
<p>
Name: <%=h name %><br>
Comment: <%=h comment %>
</p>
EOF
name    = "Tom & Mary"
comment = "「<=>」は宇宙船演算子と呼ばれている。"
puts eruby.result(binding)
# >> <p>
# >> Name: Tom &amp; Mary<br>
# >> Comment: 「&lt;=&gt;」は宇宙船演算子と呼ばれている。
# >> </p>
