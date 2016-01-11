heredoc = <<EOF     # => "first\nsecond\n"
first
second
EOF

len = <<EOF.length  # => 9
Receiver
EOF

p <<EOF
p
print
printf
EOF
# >> "p\nprint\nprintf\n"
