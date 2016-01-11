deletes = "<<delete delete_if add delete_at>>"
# deleteから始まる単語をすべて抜き出す。
deletes.scan(/\bdelete\w*/)     # => ["delete", "delete_if", "delete_at"]
# deleteから始まる単語をひとつだけ抜き出す。
deletes[ /\bdelete\w*/ ]        # => "delete"
deletes[ /\bdelete\w*/, 0 ]     # => "delete"
# 正規表現マッチなので「$~」とともにMatchDataがセットされる。その他の特殊変数も。
Regexp.last_match               # => #<MatchData "delete">
# マッチしない正規表現を指定するとnilが返る。
deletes[ /remove\w*/ ]          # => nil

header = <<EOH
From: rubikitch@ruby-lang.org
To: test@example.com
EOH
# 最初のキャプチャを抜き出す。
header[ /^From: (.+)$/, 1 ]     # => "rubikitch@ruby-lang.org"
Regexp.last_match
# => #<MatchData "From: rubikitch@ruby-lang.org" 1:"rubikitch@ruby-lang.org">
$1                              # => "rubikitch@ruby-lang.org"
header[ /^Subject: (.+)$/, 1 ]  # => nil
