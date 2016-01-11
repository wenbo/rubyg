"abcdef¤¢¤ó_!\"'#%&~=-`@:;".match(/f¤¢¤ó_!"'#%&~=-`@:;/)
# => #<MatchData "f¤¢¤ó_!\"'#%&~=-`@:;">

"abc".match(/^a/)            # => #<MatchData "a">
"0123\nabc".match(/^a/)      # => #<MatchData "a">
"0abc".match(/^a/)           # => nil

"abc".match(/\Aa/)           # => #<MatchData "a">
"0123\nabc".match(/\Aa/)     # => nil
"0abc".match(/\Aa/)          # => nil

"abc".match(/c$/)            # => #<MatchData "c">
"abc\n".match(/c$/)          # => #<MatchData "c">
"abcd".match(/c$/)           # => nil
"abc\ndef".match(/c$/)       # => #<MatchData "c">

"abc".match(/c\Z/)           # => #<MatchData "c">
"abc\n".match(/c\Z/)         # => #<MatchData "c">
"abcd".match(/c\Z/)          # => nil
"abc\ndef".match(/c\Z/)      # => nil

"abc".match(/c\z/)           # => #<MatchData "c">
"abc\n".match(/c\z/)         # => nil
"abcd".match(/c\z/)          # => nil
"abc\ndef".match(/c\z/)      # => nil
"abcd".match(/\Aabcd\z/)     # => #<MatchData "abcd">

"abcd".match(/b./)           # => #<MatchData "bc">
"ab\nd".match(/b./)          # => nil

"!¤¢!".match(/!.!/)          # => #<MatchData "!¤¢!">

"a7".match(/a[0123456789]/)  # => #<MatchData "a7">

"a7".match(/a[0-9]/)         # => #<MatchData "a7">

"E-".match(/E[-=]/)          # => #<MatchData "E-">
"E-".match(/E[=-]/)          # => #<MatchData "E-">

"\t\n\r\f\b\a\e\s\001\0\x2\C-f".match(/[\t\n\r\f\b\a\e\s\001\0\x2\C-f]+/)
# => #<MatchData "\t\n\r\f\b\a\e \x01\x00\x02\x06">

"12ab3".match(/[\da-z]+/)    # => #<MatchData "12ab3">

"ab".match(/a[^0-9]/)        # => #<MatchData "ab">
"a7".match(/a[^0-9]/)        # => nil

"a[0]".match(/a[\[{]0\]/)    # => #<MatchData "a[0]">

"^[]{1}/*.+$".match(/^\^\[\]\{1\}\/\*\.\+\$$/)  # => #<MatchData "^[]{1}/*.+$">

"3.1".match(/3[*.]1/)        # => #<MatchData "3.1">
"3.1".match(/3[\*\.]1/)      # => #<MatchData "3.1">

"xy".match(/xa+y/)           # => nil
"xay".match(/xa+y/)          # => #<MatchData "xay">
"xaay".match(/xa+y/)         # => #<MatchData "xaay">

"xy".match(/xa*y/)           # => #<MatchData "xy">
"xay".match(/xa*y/)          # => #<MatchData "xay">
"xaay".match(/xa*y/)         # => #<MatchData "xaay">

"xy".match(/xa?y/)           # => #<MatchData "xy">
"xay".match(/xa?y/)          # => #<MatchData "xay">
"xaay".match(/xa?y/)         # => nil

"xaay".match(/xa{3}y/)       # => nil
"xaaay".match(/xa{3}y/)      # => #<MatchData "xaaay">
"xaaaay".match(/xa{3}y/)     # => nil
"xaaaaaa".match(/xa{3}/)     # => #<MatchData "xaaa">

"xaay".match(/xa{3,}y/)      # => nil
"xaaay".match(/xa{3,}y/)     # => #<MatchData "xaaay">
"xaaaay".match(/xa{3,}y/)    # => #<MatchData "xaaaay">

"xaay".match(/xa{3,4}y/)     # => nil
"xaaay".match(/xa{3,4}y/)    # => #<MatchData "xaaay">
"xaaaay".match(/xa{3,4}y/)   # => #<MatchData "xaaaay">
"xaaaaay".match(/xa{3,4}y/)  # => nil

"Class".match(/\A[A-Z]\w*\z/)            # => #<MatchData "Class">
"local_variable".match(/\A[a-z_]\w*\z/)  # => #<MatchData "local_variable">
"@ivar".match(/\A@[A-Za-z_]\w+\z/)       # => #<MatchData "@ivar">

"¤¢¤ó".match(/\w+/)          # => #<MatchData "¤¢¤ó">

"a = !b".match(/\W+/)        # => #<MatchData " = !">

"a = \nb".match(/=\s+/)      # => #<MatchData "= \n">
"Á´³Ñ¶õÇò¢ª¡¡".match(/\s+/)  # => nil

"¤¢¤ó".match(/\S+/)          # => #<MatchData "¤¢¤ó">
"Á´³Ñ¶õÇò¢ª¡¡".match(/\S+/)  # => #<MatchData "Á´³Ñ¶õÇò¢ª¡¡">

"a123".match(/\d+/)          # => #<MatchData "123">
"£±£²£³".match(/\d+/)        # => nil

"a123".match(/\D+/)          # => #<MatchData "a">
"£±£²£³".match(/\D+/)        # => #<MatchData "£±£²£³">

"!abc!".match(/\b\w+/)       # => #<MatchData "abc">

"\b".match(/[\b]/)           # => #<MatchData "\b">

"filename".match(/\Bname/)   # => #<MatchData "name">
"file-name".match(/\Bname/)  # => nil
"file name".match(/\Bname/)  # => nil

s = "foo"
"foobar".match(/#{s}b/)      # => #<MatchData "foob">
