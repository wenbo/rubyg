# -*- coding: euc-jp -*-
x = "ab".encode("Shift_JIS") + "cd".encode("UTF-8")  # => "abcd"
x.encoding                                           # => #<Encoding:Shift_JIS>
"ab".encode("ISO-2022-JP") + "cd" rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: ISO-2022-JP and EUC-JP>
