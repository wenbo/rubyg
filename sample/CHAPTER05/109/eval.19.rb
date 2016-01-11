def result(bind)  eval %q!"こんにちは、#{name}さん"!, bind  end
name = "るびきち"
result(binding)  # => "こんにちは、るびきちさん"
