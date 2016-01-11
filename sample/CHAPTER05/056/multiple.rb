first, second = <<'FIRST', <<'SECOND'
first here-document
FIRST
second here-document
SECOND
first   # => "first here-document\n"
second  # => "second here-document\n"
