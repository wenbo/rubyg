$s = 0
while $_ = ARGF.gets
  $F = $_.split
  $s += $F[4].to_i
end
puts $s
