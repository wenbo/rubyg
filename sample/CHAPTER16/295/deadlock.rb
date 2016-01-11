require 'monitor'
require 'thread'
class DeadLockTest
  def initialize
    @mutex = Monitor.new        # *1
    # @mutex = Mutex.new
  end
  def crit_a
    @mutex.synchronize do
      puts "In critical section A"
      crit_b
    end
  end
  def crit_b
    @mutex.synchronize do
      puts "In critical section B"
    end
  end
end
Thread.start { sleep 1 }        # *2
DeadLockTest.new.crit_a
# >> In critical section A
# >> In critical section B
