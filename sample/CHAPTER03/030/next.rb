CODE = <<'EOC'
# comment
a = 1+2
b = "B"
EOC

CODE.each_line do |line|
  next if line =~ /^#/
  puts line
end
# >> a = 1+2
# >> b = "B"
