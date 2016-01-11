deletes = "<<delete delete_if add delete_at>>"
# delete����Ϥޤ�ñ��򤹤٤�ȴ���Ф���
deletes.scan(/\bdelete\w*/)     # => ["delete", "delete_if", "delete_at"]
# delete����Ϥޤ�ñ���ҤȤĤ���ȴ���Ф���
deletes[ /\bdelete\w*/ ]        # => "delete"
deletes[ /\bdelete\w*/, 0 ]     # => "delete"
# ����ɽ���ޥå��ʤΤǡ�$~�פȤȤ��MatchData�����åȤ���롣����¾���ü��ѿ��⡣
Regexp.last_match               # => #<MatchData "delete">
# �ޥå����ʤ�����ɽ������ꤹ���nil���֤롣
deletes[ /remove\w*/ ]          # => nil

header = <<EOH
From: rubikitch@ruby-lang.org
To: test@example.com
EOH
# �ǽ�Υ���ץ����ȴ���Ф���
header[ /^From: (.+)$/, 1 ]     # => "rubikitch@ruby-lang.org"
Regexp.last_match
# => #<MatchData "From: rubikitch@ruby-lang.org" 1:"rubikitch@ruby-lang.org">
$1                              # => "rubikitch@ruby-lang.org"
header[ /^Subject: (.+)$/, 1 ]  # => nil
