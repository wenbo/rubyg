# -*- coding: utf-8 -*-    # nodisp
"\u3042\u3044"       # => "あい"
"\u{3042}\u{3044}"   # => "あい"
s = "\u{3042 3044}"  # => "あい"
s.encoding           # => #<Encoding:UTF-8>
