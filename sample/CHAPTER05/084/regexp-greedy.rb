# 欲張りマッチ（最長一致）
html = '<a href="foo.html"><u>next page</u></a>'
#                                                           4  3            2   1
html[ /<a href=.+>/ ]             # => "<a href=\"foo.html\"><u>next page</u></a>"

html[ /(<a href=.+>)<u>/, 1 ]     # => "<a href=\"foo.html\">"

html[ /(<a href=[^>]+>)<u>/, 1 ]  # => "<a href=\"foo.html\">"

# 非欲張りマッチ（最短一致）
html[ /<a href=.+?>/ ]            # => "<a href=\"foo.html\">"

#                                                           1  2            3   4
html[ /<a href=.+?><\/a>/ ]       # => "<a href=\"foo.html\"><u>next page</u></a>"

# 強欲マッチ（バックトラック抑制）
html[ /(?><a href.+>)<u>/ ]     # => nil

html[ /(?><a href.+?>)<u>/ ]    # => "<a href=\"foo.html\"><u>"

html[ /(?><a href.+?>)<\/a>/ ]  # => nil
