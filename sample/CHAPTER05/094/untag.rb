"<a href='index.html'>目次</a>\n".gsub(/<.+?>/m, '')     # => "目次\n"
"<a\n href='index.html'>目次</a>\n".gsub(/<.+?>/m, '')   # => "目次\n"
"<a\n href='index.html'>目次</a>\n".gsub(/<[^>]+>/, '')  # => "目次\n"
# 失敗例
"<a\n href='index.html'>目次</a>\n".gsub(/<.+?>/, '')
# => "<a\n href='index.html'>目次\n"
