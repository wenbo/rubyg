open("sample.txt") do |f|
# IO#lines��1�Ԥ��Ȥ˥롼�פ���Enumerator��������롣
  enumerator = f.lines       # => #<Enumerable::Enumerator:0xb7d3ffc4>
# ������each�ǥ롼�פ��롣
  enumerator.each {|line| puts "lines: #{line}" }
end
# >> lines: ���ܸ�
# >> lines: �ˤۤ�
