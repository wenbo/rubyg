i = 0
begin
  p(i+=1)
  raise
rescue
  retry if i == 1
end
# >> 1
# >> 2
