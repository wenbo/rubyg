title = "08ǯ�ο��ؤ�����"
if title =~ /(\d+)ǯ��(.+?)������/
  subject = $2                          # => "����"
  year = 2000 + $1.to_i                 # => 2008
  year = 2000 + Integer($1) rescue $!
  # => #<ArgumentError: invalid value for Integer: "08">
end
