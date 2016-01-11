open("taint.rb") do |io|
# �ե��������Ȥϱ�������Ƥ��롣
  s = io.read
  s.tainted?         # => true
# �����Υ��֥������Ȥϱ�������Ƥ��ʤ���
  t = "!"
  t.tainted?         # => false
# ���������Ť��롣
  (s + t).tainted?   # => true
end
# �Ķ��ѿ��ϱ�������Ƥ��롣
ENV['USER'].tainted? # => true
# �Ķ��ѿ�PATH���������̤ǡ�ï�Ǥ�񤭹����ǥ��쥯�ȥ꤬�ޤޤ�Ƥ��ʤ����ϱ�������Ƥ��ʤ���
ENV['PATH'].tainted? # => false
# ��������ï�Ǥ�񤭹����ǥ��쥯�ȥ��ޤ᤿���������롣�ٹ��Ф롣
ENV['PATH'] += ":/tmp" # !> Insecure world writable dir /tmp in PATH, mode 041777
ENV['PATH'].tainted? # => true
# ((:Object#taint:))�ǥ��֥������Ȥ���������롣
s = "xxx".taint      # => "xxx"
s.tainted?           # => true
# ((:Object#untaint:))�ǥ��֥������Ȥ�����ʱ����ޡ�����������ˤ��롣
s.untaint            # => "xxx"
s.tainted?           # => false
# freeze���줿���֥������Ȥϱ����ޡ������ѹ���Ǥ��ʤ���
s.freeze             # => "xxx"
s.taint rescue $!    # => #<TypeError: can't modify frozen object>
