# �ϰϤ˴ޤޤ�Ƥ��뤫�����å����롣
2.between?(1,10)                 # => true
2.between?(4,10)                 # => false
(1..10).include? 2               # => true
(4..10).include? 2               # => false
# ��Comparable#between?�פϡ�..�פˤ���ϰϥ��֥�������Ʊ�ͽ�ü��ޤ�Τ�true�ˤʤ롣
10.between?(2,10)                # => true
(2..10).include? 10              # => true
# ��...�פˤ���ϰϥ��֥������ȤϽ�ü��ޤޤʤ��Τ�false�ˤʤ롣
(2...10).include? 10             # => false
# ɬ�����������򺸤˻��ꤷ�ʤ��Ȥ����ʤ���
2.between?(10,1)                 # => false
(10..1).include? 2               # => false
# ʸ����ˤ�Ŭ�ѤǤ��롣��������Range#include?��Ruby 1.9�ǤϤȤƤ��٤��ʤ롣
"elf".between?("air","fairy")    # => true
"elf".between?("end","fairy")    # => false
("air".."fairy").include? "elf"  # => true
("end".."fairy").include? "elf"  # => false
# ��Range#===�פϡ�Range#include?�פ��������Ƥ���Τ�case���ǻȤ��롣
case 2
when 1..10
  puts "OK"
end
# >> OK
