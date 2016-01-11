ary1 = [1,2,3]                  # nodisp
ary2 = [4,5,6]                  # nodisp
ary3 = [7,8,9]                  # nodisp
[ary1, ary2, ary3].inject([]) {|al,a| al.concat a} # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
