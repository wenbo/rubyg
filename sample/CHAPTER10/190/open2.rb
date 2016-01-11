begin
  f = open("sample.txt", "r") # => #<File:sample.txt>
  f.gets                      # => "abc\n"
ensure
  f.close
end
