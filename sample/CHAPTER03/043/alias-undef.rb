def original() "orig" end
alias copy original
original # => "orig"
copy     # => "orig"
def original() "REDEFINED: #{copy}" end
original # => "REDEFINED: orig"
copy     # => "orig"
alias copy2 original
original # => "REDEFINED: orig"
copy     # => "orig"
copy2    # => "REDEFINED: orig"
