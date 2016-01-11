result = "55 tests, 77 assertions, 3 failures\n"
# キャプチャ付き正規表現マッチからMatchDataを得る。
md = result.match(/\A(\d+) tests, (\d+) assertions, (\d+) failures\Z/)
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# MatchDataを変数に代入しなくても((:Regexp.last_match:))や((:$~:))で得ることもできる。
Regexp.last_match
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
$~
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# 「$数字」か((:MatchData#[]:))で後方参照。
$1     # => "55"
$2     # => "77"
$3     # => "3"
md[1]  # => "55"
md[2]  # => "77"
md[3]  # => "3"
# 後方参照の配列を得る。よく多重代入と併用される。
tests, assertions, failures = md.captures # => ["55", "77", "3"]
# md[0]はマッチ全体を得る。
md[0]    # => "55 tests, 77 assertions, 3 failures"
# ((:MatchData#to_a:))はマッチ全体と後方参照の配列。
md.to_a  # => ["55 tests, 77 assertions, 3 failures", "55", "77", "3"]
# ((:String#=~:))や((:Regexp#=~:))でマッチしてもMatchDataはセットされる。
result =~ /\A(\d+) tests, (\d+) assertions, (\d+) failures\Z/
$~ # => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# (?:〜)は後方参照されない。
re = /(.) Status:(?:Success|Failure)/
"o Status:Success".match re     # => #<MatchData "o Status:Success" 1:"o">
"F Status:Failure".match re     # => #<MatchData "F Status:Failure" 1:"F">
# 正規表現中の後方参照は「\数字」と書く。
"RubyかわいいよRuby".match(/\A(.+)かわいいよ\1\z/)
# => #<MatchData "RubyかわいいよRuby" 1:"Ruby">
"FilefileFILE".match(/(file)\1\1/i) # => #<MatchData "FilefileFILE" 1:"File">
