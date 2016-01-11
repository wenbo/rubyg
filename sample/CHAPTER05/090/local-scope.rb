def other_match()  "sub".match(/([a-z]+)/); $1  end
"main".match(/([a-z]+)/)
[ other_match, $1 ]  # => ["sub", "main"]
