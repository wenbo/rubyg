class MinimalLogger
  def initialize
    @bolp = true                # 行頭の場合に真
  end
  def write(obj)
    # 本物の標準出力を指定する必要がある
    STDOUT.write Time.now.strftime("%Y/%m/%d %H:%M:%S:") if @bolp
    STDOUT.write obj
    @bolp = (obj.to_s =~ /\n\z/)
  end
end
$stdout = MinimalLogger.new

print "one!", "two!!", "three!!!", "\n"
sleep 1
puts 1,2,3
sleep 1
p $stdout
# >> 2008/03/15 12:14:24:one!two!!three!!!
# >> 2008/03/15 12:14:25:1
# >> 2008/03/15 12:14:25:2
# >> 2008/03/15 12:14:25:3
# >> 2008/03/15 12:14:26:#<MinimalLogger:0xb7bbeb78 @bolp=0>
