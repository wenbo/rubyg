"Tom-cat".match(/(?<=-)cat/)  # => #<MatchData "cat">
"concat".match(/(?<=-)cat/)   # => nil
"cat".match(/(?<=-)cat/)      # => nil

"!foo".match(/(?<=%%|!|&&&)foo/)  # => #<MatchData "foo">

"#include".match(/(?<!#|!)include/)  # => nil
"%include".match(/(?<!#|!)include/)  # => #<MatchData "include">
