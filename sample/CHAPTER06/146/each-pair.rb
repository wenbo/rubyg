hash = { "one"=>1, "two"=>2 }

# �������ͤǥ롼�פ��롣
hash.each do |key,value|
  puts "#{key}�Ȥ�#{value}�Ȥ�����̣�Ǥ���" 
end

# �����Τߤǥ롼�פ��롣
hash.each_key do |key|
  puts "key:#{key}" 
end

# �ͤΤߤǥ롼�פ��롣
hash.each_value do |value|
  puts "value:#{value}" 
end
# >> one�Ȥ�1�Ȥ�����̣�Ǥ���
# >> two�Ȥ�2�Ȥ�����̣�Ǥ���
# >> key:one
# >> key:two
# >> value:1
# >> value:2
