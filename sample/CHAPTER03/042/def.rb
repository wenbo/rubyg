def f
  raise 
rescue
  puts "rescued"
end
f
# >> rescued
