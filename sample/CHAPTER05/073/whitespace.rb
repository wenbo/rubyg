s = "This    is a  pen.\n\nThat  is\t\t a pencil."
s.tr("\n\t", " ").squeeze(" ")   # => "This is a pen. That is a pencil."
s.gsub(/[ \n\t]+/, ' ')          # => "This is a pen. That is a pencil."
