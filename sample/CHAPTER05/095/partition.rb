s = "one\ntwo\nthree"
s.partition("\n")               # => ["one", "\n", "two\nthree"]
s.rpartition("\n")              # => ["one\ntwo", "\n", "three"]
"no-separator".partition("\n")  # => ["no-separator", "", ""]
"first\n=======\nsecond".partition(/\n=+\n/) # => ["first", "\n=======\n", "second"]
