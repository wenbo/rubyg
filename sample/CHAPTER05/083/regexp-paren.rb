result = "55 tests, 77 assertions, 3 failures\n"
# ����ץ����դ�����ɽ���ޥå�����MatchData�����롣
md = result.match(/\A(\d+) tests, (\d+) assertions, (\d+) failures\Z/)
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# MatchData���ѿ����������ʤ��Ƥ�((:Regexp.last_match:))��((:$~:))�����뤳�Ȥ�Ǥ��롣
Regexp.last_match
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
$~
# => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# ��$�����פ�((:MatchData#[]:))�Ǹ������ȡ�
$1     # => "55"
$2     # => "77"
$3     # => "3"
md[1]  # => "55"
md[2]  # => "77"
md[3]  # => "3"
# �������Ȥ���������롣�褯¿��������ʻ�Ѥ���롣
tests, assertions, failures = md.captures # => ["55", "77", "3"]
# md[0]�ϥޥå����Τ����롣
md[0]    # => "55 tests, 77 assertions, 3 failures"
# ((:MatchData#to_a:))�ϥޥå����Τȸ������Ȥ�����
md.to_a  # => ["55 tests, 77 assertions, 3 failures", "55", "77", "3"]
# ((:String#=~:))��((:Regexp#=~:))�ǥޥå����Ƥ�MatchData�ϥ��åȤ���롣
result =~ /\A(\d+) tests, (\d+) assertions, (\d+) failures\Z/
$~ # => #<MatchData "55 tests, 77 assertions, 3 failures" 1:"55" 2:"77" 3:"3">
# (?:��)�ϸ������Ȥ���ʤ���
re = /(.) Status:(?:Success|Failure)/
"o Status:Success".match re     # => #<MatchData "o Status:Success" 1:"o">
"F Status:Failure".match re     # => #<MatchData "F Status:Failure" 1:"F">
# ����ɽ����θ������Ȥϡ�\�����פȽ񤯡�
"Ruby���襤����Ruby".match(/\A(.+)���襤����\1\z/)
# => #<MatchData "Ruby���襤����Ruby" 1:"Ruby">
"FilefileFILE".match(/(file)\1\1/i) # => #<MatchData "FilefileFILE" 1:"File">
