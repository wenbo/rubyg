RUBY_VERSION                                           # => "1.9.0"
File.read("euc.txt").encoding                          # => #<Encoding:EUC-JP>
open("euc.txt") {|f| f.read(4).encoding }              # => #<Encoding:ASCII-8BIT>
open("euc.txt", "r:EUC-JP") {|f| f.read(4).encoding }  # => #<Encoding:ASCII-8BIT>
s = File.read("euc.txt", 4)                            # => "\xC6\xFC\xCB\xDC"
s.encoding                                             # => #<Encoding:ASCII-8BIT>
