"<a href='index.html'>�ܼ�</a>\n".gsub(/<.+?>/m, '')     # => "�ܼ�\n"
"<a\n href='index.html'>�ܼ�</a>\n".gsub(/<.+?>/m, '')   # => "�ܼ�\n"
"<a\n href='index.html'>�ܼ�</a>\n".gsub(/<[^>]+>/, '')  # => "�ܼ�\n"
# ������
"<a\n href='index.html'>�ܼ�</a>\n".gsub(/<.+?>/, '')
# => "<a\n href='index.html'>�ܼ�\n"
