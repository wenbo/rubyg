html = '<b>Big</b>, <b>Huge</b>'
html.gsub(%r!<b>(.+?)</b>!, '<em>\1</em>')   # => "<em>Big</em>, <em>Huge</em>"
['\1', '\\1' ]                               # => ["\\1", "\\1"]
html.gsub(%r!<b>(.+?)</b>!, '<em>\\1</em>')  # => "<em>Big</em>, <em>Huge</em>"
html.gsub(%r!<b>(.+?)</b>!, "<em>\1</em>")   # => "<em>\x01</em>, <em>\x01</em>"
html.gsub(%r!<b>(.+?)</b>!, "<em>\\1</em>")  # => "<em>Big</em>, <em>Huge</em>"

t = "em"
html.gsub(%r!<b>(.+?)</b>!, "<#{t}>\\1</#{t}>")  # => "<em>Big</em>, <em>Huge</em>"
html.gsub(%r!<b>(.+?)</b>!, '<%s>\1</%s>' % [t, t]) # => "<em>Big</em>, <em>Huge</em>"
html.gsub(%r!<b>(.+?)</b>!) {"<#{t}>#$1</#{t}>"} # => "<em>Big</em>, <em>Huge</em>"
