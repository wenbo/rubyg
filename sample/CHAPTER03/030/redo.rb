CODE = <<'EOC'
a = 1 # one
b = 2
EOC

CODE.each_line do |line|
  # あくまでサンプルなので条件はいいかげん
  if line =~ /^(.+)#/
    line = $1; redo
  end
  puts line
end
# >> a = 1 
# >> b = 2
