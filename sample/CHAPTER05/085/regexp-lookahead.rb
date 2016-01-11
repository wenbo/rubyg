# 先読み
# 位置      1          2
tag = "<img src='1.jpg' alt='1'>"
tag.match(/<img .*src='(.+?)'/) # => #<MatchData "<img src='1.jpg'" 1:"1.jpg">
tag.match(/<img .*alt='(.+?)'/) # => #<MatchData "<img src='1.jpg' alt='1'" 1:"1">

tag.match(/<img (?=.*alt='(.+?)').*src='(.+?)'/)
# => #<MatchData "<img src='1.jpg'" 1:"1" 2:"1.jpg">

"<img alt='1' src='1.jpg'>".match(/<img (?=.*alt='(.+?)').*src='(.+?)'/)
# => #<MatchData "<img alt='1' src='1.jpg'" 1:"1" 2:"1.jpg">

tag3 = "<img src='1.jpg'>"
tag3.match(/<img (?=.*alt='(.+?)').*src='(.+?)'/) # => nil
tag3.match(/<img .*src='(.+?)'/) # => #<MatchData "<img src='1.jpg'" 1:"1.jpg">

re = /<img (?=.*alt='(.+?)')(?=.*title='(.+?)')(?=.*src='(.+?)')/
"<img title='one' alt='1' src='1.jpg'>".match re
# => #<MatchData "<img " 1:"1" 2:"one" 3:"1.jpg">
"<img alt='1' src='1.jpg' title='one'>".match re
# => #<MatchData "<img " 1:"1" 2:"one" 3:"1.jpg">

# 否定先読み
"@aA_" =~ /\A@(?!\d)\w+\z/  # => 0
"@1"   =~ /\A@(?!\d)\w+\z/  # => nil
"@1"   =~ /\A@\w+\z/        # => 0
