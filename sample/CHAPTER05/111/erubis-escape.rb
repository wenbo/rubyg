require 'erubis'
def bold(str) "<b>#{Erubis::XmlHelper.escape_xml str}</b>" end
eruby = Erubis::EscapedEruby.new <<EOF
<p>
Name: <%==bold @name %><br>
Comment: <%=@comment %>
</p>
EOF
puts eruby.evaluate :name => "Tom & Mary",
                    :comment => "��<=>�פϱ������黻�ҤȸƤФ�Ƥ��롣"
# >> <p>
# >> Name: <b>Tom &amp; Mary</b><br>
# >> Comment: ��&lt;=&gt;�פϱ������黻�ҤȸƤФ�Ƥ��롣
# >> </p>
