# 「Time」オブジェクトの場合。
t = Time.now                   # => 2008-11-11 04:26:44 +0900
[ t.year, t.month, t.day ]     # => [2008, 11, 11]
[ t.hour, t.min, t.sec ]       # => [4, 26, 44]
# dateライブラリにDateとDateTimeが定義されているので読み込む
require 'date'
# 「Date」オブジェクトの場合。
d = Date.today
[ d.year, d.month, d.day ]     # => [2008, 11, 11]
# 「DateTime」オブジェクトの場合。
dt = DateTime.now
[ dt.year, dt.month, dt.day ]  # => [2008, 11, 11]
[ dt.hour, dt.min, dt.sec ]    # => [4, 26, 44]
