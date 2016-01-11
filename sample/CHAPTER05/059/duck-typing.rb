def add(obj)
  obj << "hoge"
end

str = "xx:"; add(str)           # => "xx:hoge"
str                             # => "xx:hoge"
ary = ["xx:"]; add(ary)         # => ["xx:", "hoge"]
ary                             # => ["xx:", "hoge"]
io = $stdout; add(io)           # => #<IO:<STDOUT>>
# >> hoge
