require 'monitor'
m = Monitor.new
m.synchronize do
  m.synchronize do
    # ����
  end
end
