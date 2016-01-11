t = Time.local 1993,2,24,12,33,0          # => 1993-02-24 12:33:00 +0900
[t.yday, t.zone, t.wday]                  # => [55, "JST", 3]
require 'date'
d = DateTime.new 1993,2,24,12,33,0,"JST"
[d.yday, d.zone, d.wday]                  # => [55, "+09:00", 3]
