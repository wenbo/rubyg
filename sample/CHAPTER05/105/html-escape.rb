require 'cgi'
# ��Ƽ�̾��ɽ������HTML�Ҥ���
# ̾����ܡ�����Τ�ɽ������HTML�Ҥ��֤��ؿ���
def name_html(name)  "<b>Name: #{CGI.escapeHTML(name)}</b>" end
# HTML�ˤȤä����̤�ʸ���ϥ��������פ���롣
name_html "��Ӥ���"    # => "<b>Name: ��Ӥ���</b>"
name_html "Tom & Mary"  # => "<b>Name: Tom &amp; Mary</b>"

# �Ǽ��Ĥν񤭹������Ƥ���
body = '<u>line</u> <b>bold</b> <img src="foo.jpg" alt="image">'
# HTML��������ڵ����ʤ���硣
CGI.escapeHTML(body)
# => "&lt;u&gt;line&lt;/u&gt; &lt;b&gt;bold&lt;/b&gt; &lt;img src=&quot;foo.jpg&quot; alt=&quot;image&quot;&gt;"
# U���Ǥ�B���Ǥ�����ʤ���硣
CGI.escapeElement(body, "u", "b")
# => "&lt;u&gt;line&lt;/u&gt; &lt;b&gt;bold&lt;/b&gt; <img src=\"foo.jpg\" alt=\"image\">"
# U���Ǥ�B���ǤΤߤ������硣
CGI.unescapeElement(CGI.escapeHTML(body), "u", "b")
# => "<u>line</u> <b>bold</b> &lt;img src=&quot;foo.jpg&quot; alt=&quot;image&quot;&gt;"

# HTML����Ϥ�����
html = "<b>Name: Tom &amp; Mary</b>"
# HTML������ɽ���˥ޥå������Ƥ�HTML���������פ��줿�ޤޤʤΤǡ�
html[ %r!<b>Name: (.+?)</b>!, 1]                    # => "Tom &amp; Mary"
# HTML���󥨥������פ��롣
CGI.unescapeHTML(html[ %r!<b>Name: (.+?)</b>!, 1])  # => "Tom & Mary"
