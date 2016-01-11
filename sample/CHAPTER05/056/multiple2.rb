first, second = <<'EOF', <<'EOF'
first here-document
EOF
second here-document
EOF
first   # => "first here-document\n"
second  # => "second here-document\n"
