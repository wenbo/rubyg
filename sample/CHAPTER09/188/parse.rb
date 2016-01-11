# date�饤�֥���Date.parse��DateTime.parse���������Ƥ���Τ��ɤ߹���
require 'date'
#��time�饤�֥���Time.parse���������Ƥ���Τ��ɤ߹���
require 'time'
s = "1993/2/24 10:30"
# ʸ�������Ϥ���Time��Date��DateTime��������롣
Time.parse s            # => 1993-02-24 10:30:00 +0900
Date.parse(s).to_s      # => "1993-02-24"
DateTime.parse(s).to_s  # => "1993-02-24T10:30:00+00:00"
# ������ʷ������б����Ƥ��롣
Time.parse "Mon, 28 Jan 2008 01:23:31 +0900"        # => 2008-01-28 01:23:31 +0900
Time.parse "Mon, 28 Jan 2008 01:23:31 -00"          # => 2008-01-28 01:23:31 UTC
Time.parse "Sun, 27 Jan 2008 17:41:20 GMT"          # => 2008-01-28 02:41:20 +0900
Time.parse "Tuesday, July 6th, 2007, 18:35:20 GMT"  # => 2007-07-07 03:35:20 +0900
Time.parse "Tuesday, July 6th, 2007, 18:35:20 UTC"  # => 2007-07-06 18:35:20 UTC
Time.parse "07-01-07 09:16:24+09"                   # => 2007-01-07 09:16:24 +0900
Time.parse "Mon Dec 25 00 06:53:24 UTC"             # => 2000-12-25 06:53:24 UTC
Time.parse "2008-01-24T23:55:42Z"                   # => 2008-01-24 23:55:42 UTC
# ����η����Τߤ�����դ��륯�饹�᥽�åɤ⤢�롣
Time.rfc2822 "Mon, 28 Jan 2008 01:23:31 +0900"  # => 2008-01-28 01:23:31 +0900
Time.xmlschema "2008-01-24T23:55:42Z"           # => 2008-01-24 23:55:42 UTC
tms = "Sun, 27 Jan 2008 17:41:20 GMT"
Time.httpdate tms                               # => 2008-01-28 02:41:20 +0900
# �����Ȱۤʤ����ArgumentError�ˤʤ롣
Time.xmlschema tms rescue $!
# => #<ArgumentError: invalid date: "Sun, 27 Jan 2008 17:41:20 GMT">
# ���顼�������ƺǽ����ʤȤ���Time.parse����Ѥ��롣
Time.xmlschema tms rescue Time.parse tms  # => 2008-01-28 02:41:20 +0900
# ¸�ߤ��ʤ����դ���ꤷ������ArgumentError�ˤʤ롣
Time.parse "2008-13-14" rescue $! # => #<ArgumentError: argument out of range>
