RUBY_VERSION                  # => "1.9.0"
"abc\ndef\n".grep(/d/) rescue $!
# => #<NoMethodError: undefined method `grep' for "abc\ndef\n":String>
"abc\ndef\n".lines            # => #<Enumerator:0x9845d74>
"abc\ndef\n".lines.grep(/d/)  # => ["def\n"]
