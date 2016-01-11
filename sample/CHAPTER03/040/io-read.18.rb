File.ancestors       # => [File, IO, File::Constants, Enumerable, Object, Kernel]
IO.read "foo.txt"    # => "abracadabra\n"
File.read "foo.txt"  # => "abracadabra\n"
