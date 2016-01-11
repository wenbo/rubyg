"Unix newline\n".gsub( /\r\n?/, "\n" )              # => "Unix newline\n"
"Windows\r\n newline\r\n".gsub( /\r\n?/, "\n" )     # => "Windows\n newline\n"
"Macintosh newline\r".gsub( /\r\n?/, "\n" )         # => "Macintosh newline\n"

require 'nkf'
NKF.nkf("--windows -e", "Unix newline\n")           # => "Unix newline\r\n"
NKF.nkf("--mac -e", "Windows newline\r\n")          # => "Windows newline\r"
NKF.nkf("--unix -e", "Macintosh newline\r")         # => "Macintosh newline\n"

[ "Unix\n".chop, "Win\r\n".chop, "Mac\r".chop ]     # => ["Unix", "Win", "Mac"]
[ "Unix\n".chomp, "Win\r\n".chomp, "Mac\r".chomp ]  # => ["Unix", "Win", "Mac"]
