# Integer��String��Hash��Array��Struct�����Ȥ߹��ߥ��饹�ˤ����ƥ�����Ʊ�ͤʥ��֥������Ȥ���ꤹ��ȡ��б������ͤ���Ф����Ȥ��Ǥ��롣
{1 => :ok}[1]                      # => :ok
{"a_string" => :ok}["a_string"]    # => :ok
{{:a=>1} => :ok}[:a => 1]          # => :ok
{[1] => :ok}[[1]]                  # => :ok
S = Struct.new :a
{S.new(1) => :ok}[S.new(1)]        # => :ok

class A
  def initialize(a, b) @a, @b = a, b end
  attr_reader :a, :b
end
# Ʊ�ͤʥ桼��������֥������Ȥ�դ��ĺ������롣
a1 = A.new 1, 2
a2 = A.new 1, 2
# �桼��������֥������Ȥξ��ϡ�Ʊ��Ǥʤ����б������ͤ���Ф��ʤ���
{a1 => :ok}[a1]                    # => :ok
{a1 => :ok}[a2]                    # => nil

# ����������б�����ˤϡ�A#eql?��A#hash��������롣
class A
# x��A���饹�ǡ����󥹥����ѿ���eql?�Ǥ�����ʤ�п���������롣
  def eql?(x) x.instance_of?(A) and @a.eql?(x.a) and @b.eql?(x.b) end
# ���󥹥����ѿ�@a��@b�Υϥå����ͤ���¾Ū�����¤�������롣
  def hash()  @a.hash ^ @b.hash                                   end
end
# ̵���˼��Ф����Ȥ��Ǥ�����
{a1 => :ok}[a2]                    # => :ok

# @b���ͤ�̵�뤹����ϡ����Τ褦�ˤ��롣
class A
  def eql?(x) x.instance_of?(A) and @a.eql?(x.a) end
  def hash()  @a.hash                            end
end
{A.new(1,2) => :ok}[A.new(1, 10)]  # => :ok
