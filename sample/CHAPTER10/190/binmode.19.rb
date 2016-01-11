RUBY_VERSION               # => "1.9.1"
open("utf16le.txt", "r:UTF-16LE") rescue $!
# => #<ArgumentError: ASCII incompatible encoding needs binmode>
open("utf16le.txt", "rb:UTF-16LE") do |io|
  io.external_encoding     # => #<Encoding:UTF-16LE>
  io.read.encode("UTF-8")  # => "バイナリモードです。\n"
  io.binmode
  io.external_encoding     # => #<Encoding:ASCII-8BIT>
end
