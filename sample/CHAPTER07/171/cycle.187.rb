#!/usr/local/bin/ruby -Ke
# ñ�����
# �֥�å���Ĥ��ʤ���̵�¥롼�פ�ɽ��Enumerator�ˤʤ롣
(1..3).cycle          # => #<Enumerator:0x8695f84>
# 3�������֤���
(1..3).cycle(3).to_a  # => [1, 2, 3, 1, 2, 3, 1, 2, 3]
# ̵�¥롼�פʤΤ�((:Enumerable#take:))���Ȥ߹�碌��10�Ĥ���ȴ���Ф���
(1..3).cycle.take(10) # => [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# ����������
# <%= require_description 'Date', "date" %>
require 'date'
# 2008/1/10�����7���֤Τ�������������������դ����롣((:Date#wday:))�����������������롣��������0��
start = Date.new 2008, 1, 10
ndays = 7
dates = (start...start+ndays).reject{|d| [0,6].include? d.wday }
# 3�͸�������֤���ꤹ�롣
dates.zip(%w[���� �� ����].cycle.take(ndays)).map{|d,n| d.strftime("%y/%m/%d(%a) #{n}")}
# => ["08/01/10(Thu) ����",
#     "08/01/11(Fri) ��",
#     "08/01/14(Mon) ����",
#     "08/01/15(Tue) ����",
#     "08/01/16(Wed) ��"]

# ����åɤ�̵�¥롼�פ���
# 0.1�ä��Ȥ�dog, cat, dog, ...��ɽ�����Ƥ�������åɡ�����åɤʤΤ�̵�¥롼�פǤ⹽��ʤ���
Thread.start do 
  %w[dog cat].cycle {|animal| puts animal; sleep 0.1 }
end
# 0.21���ԤĴ֤�ɽ������롣�ᥤ�󥹥�åɤ���λ�����̵�¥롼�ץ���åɤ⶯����λ���롣
sleep 0.21
# >> dog
# >> cat
# >> dog
