hash = { "one"=>1, "two"=>2 }

# キーと値でループする。
hash.each do |key,value|
  puts "#{key}とは#{value}という意味です。" 
end

# キーのみでループする。
hash.each_key do |key|
  puts "key:#{key}" 
end

# 値のみでループする。
hash.each_value do |value|
  puts "value:#{value}" 
end
# >> oneとは1という意味です。
# >> twoとは2という意味です。
# >> key:one
# >> key:two
# >> value:1
# >> value:2
