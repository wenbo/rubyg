i = 0
begin
  raise if i == 0
  p i
rescue
  # i == 0のときに飛ばされる
  i = 1
  retry
end
# >> 1
