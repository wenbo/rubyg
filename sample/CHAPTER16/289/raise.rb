th1 = Thread.start do
  raise "Error in th1"
  p "OK"                   # th1�μ¹Ԥ��Ǥ��ڤ��뤿��ɽ������ʤ���
end
th2 = Thread.start do
  # th2���㳰��rescue����ª��
  raise "Error in th2" rescue $!  # => #<RuntimeError: Error in th2>
end
sleep 0.1
puts "End of program."
# >> End of program.
