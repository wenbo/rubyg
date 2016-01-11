class FibonacciTest  # �ե��ܥʥå������memoize�θ��̤򸡾ڤ��륯�饹
  def initialize() @fib_calls = @fib_memoized_block_calls = 0 end
  attr_reader :fib_calls, :fib_memoized_block_calls  # �����󥿡�
  def fib(n)                    # memoize���ʤ����
# �ƤФ줿����򥫥���ȥ��åפ��롣
    @fib_calls += 1
    case n
    when 1,2 then 1
    else fib(n-1) + fib(n-2)    # �Ƶ�
    end
  end
  def fib_memoized(m)           # memoize������
# �᥽�åɤ��ƤӸƤФ줿�Ȥ���Ʊ���ϥå��������Ѥ��뤿�ᡢ�ٱ��������롣
    @memoize_hash ||= Hash.new do |h,n|
# �ƤФ줿����򥫥���ȥ��åפ��롣
      @fib_memoized_block_calls += 1
# ¸�ߤ��ʤ������ξ�硢�����˥������ͤ��Ϣ�դ��롣fib������Ȥ�����������ܡ�
      h[n] = case n
             when 1,2 then 1
             else h[n-1] + h[n-2]
             end
    end
    @memoize_hash[m]
  end
end
fib = FibonacciTest.new
fib.fib 30                    # => 832040
fib.fib_memoized 30           # => 832040
# �ե��ܥʥå�����׻��롼�����Ƥ���������Ӥ��롣
fib.fib_calls                 # => 1664079
fib.fib_memoized_block_calls  # => 30
# 10���ܤޤǤ����Ǥ���󤹤롣
(1..10).map {|i| fib.fib_memoized(i) }  # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
# ����å�����������������ä����֤���Ӥ��롣
require 'benchmark'
Benchmark.bm(20) do |b|
  fib = FibonacciTest.new
  b.report("not memoized") { fib.fib 30 } 
  b.report("memoized") { fib.fib_memoized 30 } 
end
# >>                           user     system      total        real
# >> not memoized          0.740000   0.000000   0.740000 (  0.871795)
# >> memoized              0.000000   0.000000   0.000000 (  0.000107)
