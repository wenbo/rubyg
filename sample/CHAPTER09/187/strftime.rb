#!/usr/local/bin/ruby -Ke
t = Time.local 1993,2,24,18,33,55
# 西暦/月/日 時:分:秒 タイムゾーン。
t.strftime "%Y/%m/%d %H:%M:%S %Z"          # => "1993/02/24 18:33:55 JST"
# 西暦2桁/月/日(曜日の省略名) 午前午後 時:分。
t.strftime "%y/%m/%d(%a) %p%I:%M"          # => "93/02/24(Wed) PM06:33"
# 曜日の名称と省略名。
t.strftime "%A(%a)"                        # => "Wednesday(Wed)"
# 日曜日からの日数。
t.strftime "日曜日から数えて%w日目"        # => "日曜日から数えて3日目"
# 月の名称と省略名。
t.strftime "%B(%b)"                        # => "February(Feb)"
# 年始から通算日、週。
t.strftime "今日は年始から%j日目、%U週目"  # => "今日は年始から055日目、08週目"
# 日付と時刻（デフォルトのフォーマット）
t.strftime "%c"                            # => "Wed Feb 24 18:33:55 1993"
# 時刻
t.strftime "現在時刻：%X"                  # => "現在時刻：18:33:55"
# 日付
t.strftime "今日の日付：%x"                # => "今日の日付：02/24/93"
