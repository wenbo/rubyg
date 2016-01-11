require 'date'
# Time、Date、DateTimeで1993/2/24を表す。
time = Time.local   1993, 2, 24                    # => 1993-02-24 00:00:00 +0900
date = Date.new     1993, 2, 24; date.to_s         # => "1993-02-24"
datm = DateTime.new 1993, 2, 24; datm.to_s         # => "1993-02-24T00:00:00+00:00"
# Timeの加減算は秒単位。
ten_secs_later = time + 10                         # => 1993-02-24 00:00:10 +0900
# Date/DateTimeの加減算は日単位。
ten_days_later = date + 10; ten_days_later.to_s    # => "1993-03-06"
(datm + 10).to_s                                   # => "1993-03-06T00:00:00+00:00"
# Date/DateTimeの<<と>>で月単位の加減算をする。
one_month_ago = date << 1; one_month_ago.to_s      # => "1993-01-24"
two_month_later = date >> 2; two_month_later.to_s  # => "1993-04-24"
# 年単位の加減算は年数を12倍して月単位で計算する。
ten_years_later = datm >> 10*12; ten_years_later.to_s         # => "2003-02-24T00:00:00+00:00"
# DateTimeの加減算にRationalを指定して時刻も設定できる。
one_hour_later = datm + Rational(1, 24); one_hour_later.to_s  # => "1993-02-24T01:00:00+00:00"
# 1993/2/24から今日までの日数を数える。
days_since = Date.today - date  # => (5739/1)
days_since.to_s                 # => "5739/1"
# 1993/2/24から現在までの秒数を数える。
secs_since = Time.now - time    # => 495923690.738798
