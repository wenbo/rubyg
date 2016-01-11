require 'date'
Time.local 1993, 2, 24                             # => 1993-02-24 00:00:00 +0900
Time.local 1993, 2, 24, 12, 34, 56                 # => 1993-02-24 12:34:56 +0900
Time.gm 1993, 2, 24, 12, 34, 56                    # => 1993-02-24 12:34:56 UTC
Date.new(1993, 2, 24).to_s                         # => "1993-02-24"
DateTime.new(1993, 2, 24, 12, 34, 56, "JST").to_s  # => "1993-02-24T12:34:56+09:00"
