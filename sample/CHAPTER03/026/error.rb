1/0 rescue [$!, $@]
# => [#<ZeroDivisionError: divided by 0>, ["-:1:in `/'", "-:1:in `<main>'"]]

def error_test
  begin
    raise NameError, "ERR!!"
  rescue NameError => err
    err   # => #<NameError: ERR!!>
    $!    # => #<NameError: ERR!!>
    $@    # => ["-:4:in `error_test'", "-:12:in `<main>'"]
  end
end

error_test
