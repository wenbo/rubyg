# ��Time�ץ��֥������Ȥξ�硣
t = Time.now                   # => 2008-11-11 04:26:44 +0900
[ t.year, t.month, t.day ]     # => [2008, 11, 11]
[ t.hour, t.min, t.sec ]       # => [4, 26, 44]
# date�饤�֥���Date��DateTime���������Ƥ���Τ��ɤ߹���
require 'date'
# ��Date�ץ��֥������Ȥξ�硣
d = Date.today
[ d.year, d.month, d.day ]     # => [2008, 11, 11]
# ��DateTime�ץ��֥������Ȥξ�硣
dt = DateTime.now
[ dt.year, dt.month, dt.day ]  # => [2008, 11, 11]
[ dt.hour, dt.min, dt.sec ]    # => [4, 26, 44]
