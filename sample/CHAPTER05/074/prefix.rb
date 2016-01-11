title = "08年の数学の成績"
if title =~ /(\d+)年の(.+?)の成績/
  subject = $2                          # => "数学"
  year = 2000 + $1.to_i                 # => 2008
  year = 2000 + Integer($1) rescue $!
  # => #<ArgumentError: invalid value for Integer: "08">
end
