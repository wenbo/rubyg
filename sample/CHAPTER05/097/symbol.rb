:symbol          # => :symbol
:"foo"           # => :foo
:'bar'           # => :bar
:"33"            # => :"33"
:"#{1+3}!hoge?"  # => :"4!hoge?"
:'with space'    # => :"with space"
:'xml:lang'      # => :"xml:lang"
%s!:symbol:!     # => :":symbol:"
:"newline\n"     # => :"newline\n"
