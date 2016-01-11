begin
  f = open("sample.txt", "r")
  raise    # 例外が起きる
  f.close
rescue     # 捕捉される
end
# この時点でファイルは開かれたまま
f.closed?  # => false
