"abc\ndef\n".count "\n"           # => 2
"abc\ndef".count "\n"             # => 1
# Ruby 1.8.7�ʹ�
"abc\ndef\n".lines.count          # => 2
"abc\ndef".lines.count            # => 2
# Ruby 1.8.6����
"abc\ndef\n".split(/\n/).length   # => 2
"abc\ndef".split(/\n/).length     # => 2
