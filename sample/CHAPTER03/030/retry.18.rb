retried = false
[1,2].each do |n|
  p n
  if n == 2 and !retried
    # �롼�פ��ľ��
    retried = true; retry
  end
end
# >> 1
# >> 2
# >> 1
# >> 2
