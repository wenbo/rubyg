class Adder
# �����Ͽ��ͤ�����ǻ��ꤹ�륳�󥹥ȥ饯����
  def initialize(numbers) @nums = numbers.map{|s| s.to_f } end
  def sum()               @nums.inject{|s,x| s + x } end
# ���ڡ����Ƕ��ڤ�줿���ͤ��ɼ�ä�Adder��������롣
  def self.parse(string)  new string.split end
# IO�ʼºݤ�read�᥽�åɤ�����դ��륪�֥������ȡˤ���Adder��������롣
  def self.for_io(io)     parse(io.read) end
# �ե�����̾�ǻ��ꤵ�줿�ե����뤫��Adder��������롣
  def self.load(filename) open(filename){|io| for_io io } end
end
# �̾�Υ��󥹥ȥ饯������Ѥ�����硣
a1 = Adder.new([1,2,3])
[ a1, a1.sum ]  # => [#<Adder:0x819be0c @nums=[1.0, 2.0, 3.0]>, 6.0]
# ʸ�������Ϥ�����硣
a2 = Adder.parse("1.1 2.2 3.3")
[ a2, a2.sum ]  # => [#<Adder:0x826e6cc @nums=[1.1, 2.2, 3.3]>, 6.6]
# �ե��������Ϥ�����硣
a3 = Adder.load("nums.dat")
[ a3, a3.sum ]  # => [#<Adder:0x826e348 @nums=[2.0, 3.0, 4.0]>, 9.0]
