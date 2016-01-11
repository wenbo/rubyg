require 'erb'
include ERB::Util
eruby = ERB.new <<EOF
<p>
Name: <%=h name %><br>
Comment: <%=h comment %>
</p>
EOF
name    = "Tom & Mary"
comment = "��<=>�פϱ������黻�ҤȸƤФ�Ƥ��롣"
puts eruby.result(binding)
# >> <p>
# >> Name: Tom &amp; Mary<br>
# >> Comment: ��&lt;=&gt;�פϱ������黻�ҤȸƤФ�Ƥ��롣
# >> </p>
