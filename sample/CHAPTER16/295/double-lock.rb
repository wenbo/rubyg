require 'monitor'
m = Monitor.new
m.synchronize do
  m.synchronize do
    # ฝ่อý
  end
end
