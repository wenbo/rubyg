Dir['*.txt']                     # => ["test.txt", "bar.txt", "foo.txt"]
Dir['{foo,bar}.txt']             # => ["foo.txt", "bar.txt"]

Dir['{{foo,bar}.txt,test.txt}']  # => ["foo.txt", "bar.txt", "test.txt"]
