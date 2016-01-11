# 連続する文字の並びを1文字にまとめる。
"aaabbccdefgg".squeeze                    # => "abcdefg"
"aaabaaa".squeeze                         # => "aba"
"abc".squeeze                             # => "abc"
# 対象文字は1〜3。
"1122334455".squeeze("1-3")               # => "1234455"
# 対象文字は1〜3以外、すなわち4と5。
"1122334455".squeeze("^1-3")              # => "11223345"
# 対象文字は1と3以外、すなわち2と4と5。
"1122334455".squeeze("^13")               # => "1123345"
# 対象文字は1と4〜5。
"1122334455".squeeze("14-5")              # => "1223345"
# 対象文字は1〜4かつ4〜5、すなわち4のみ。
"1122334455".squeeze("1-4", "4-5")        # => "112233455"
# 対象文字は-とc。
"a--bcc".squeeze("-c")                    # => "a-bc"
"a--bcc".squeeze("c-")                    # => "a-bc"
# 対象文字はcと-とb。-そのものにマッチさせるにはエスケープが必要。
"a--bcc".squeeze('c\-b')                  # => "a-bc"
# 複数のスペースをひとつにする。
"This    is a   pen.".squeeze(" ")        # => "This is a pen."
# 複数の改行をひとつにする。すなわち空行を取り除く。
"Paragraph1\n\nParagraph2".squeeze("\n")  # => "Paragraph1\nParagraph2"
# 破壊的バージョン。
a = "112233"
a.squeeze!("1")                           # => "12233"
a.squeeze!("2")                           # => "1233"
a.squeeze!("2")                           # => nil
a                                         # => "1233"
