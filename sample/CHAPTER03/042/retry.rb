i = 0
begin
  raise if i == 0
  p i
rescue
  # i == 0�ΤȤ������Ф����
  i = 1
  retry
end
# >> 1
