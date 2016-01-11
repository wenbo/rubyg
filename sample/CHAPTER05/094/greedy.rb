html = '<b>Big</b>, <b>Huge</b>'
# 「+」は欲張りマッチであるため、文字列全体にマッチしてしまうので間違い。
html.gsub(%r!<b>(.+)</b>!, '<em>\1</em>') # => "<em>Big</b>, <b>Huge</em>"
# 非欲張りマッチにするのが正しい。
html.gsub(%r!<b>(.+?)</b>!, '<em>\1</em>') # => "<em>Big</em>, <em>Huge</em>"
