require 'scanf'
"a difficult problem".scanf '%s%*c%[ \S]'   # => ["a", "difficult problem"]
"a difficult problem".scanf "%s%*c%[ \\S]"  # => ["a", "difficult problem"]
# ¼ºÇÔÎã
"a difficult problem".scanf "%s%*c%[ \S]"   # => ["a"]
