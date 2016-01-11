require 'date'
# Time��Date��DateTime��1993/2/24��ɽ����
time = Time.local   1993, 2, 24                    # => 1993-02-24 00:00:00 +0900
date = Date.new     1993, 2, 24; date.to_s         # => "1993-02-24"
datm = DateTime.new 1993, 2, 24; datm.to_s         # => "1993-02-24T00:00:00+00:00"
# Time�βø�������ñ�̡�
ten_secs_later = time + 10                         # => 1993-02-24 00:00:10 +0900
# Date/DateTime�βø�������ñ�̡�
ten_days_later = date + 10; ten_days_later.to_s    # => "1993-03-06"
(datm + 10).to_s                                   # => "1993-03-06T00:00:00+00:00"
# Date/DateTime��<<��>>�Ƿ�ñ�̤βø����򤹤롣
one_month_ago = date << 1; one_month_ago.to_s      # => "1993-01-24"
two_month_later = date >> 2; two_month_later.to_s  # => "1993-04-24"
# ǯñ�̤βø�����ǯ����12�ܤ��Ʒ�ñ�̤Ƿ׻����롣
ten_years_later = datm >> 10*12; ten_years_later.to_s         # => "2003-02-24T00:00:00+00:00"
# DateTime�βø�����Rational����ꤷ�ƻ��������Ǥ��롣
one_hour_later = datm + Rational(1, 24); one_hour_later.to_s  # => "1993-02-24T01:00:00+00:00"
# 1993/2/24���麣���ޤǤ�����������롣
days_since = Date.today - date  # => (5739/1)
days_since.to_s                 # => "5739/1"
# 1993/2/24���鸽�ߤޤǤ��ÿ�������롣
secs_since = Time.now - time    # => 495923690.738798
