th = Thread.start { sleep 0.1; raise "Error in th" }
th.join rescue $!  # => #<RuntimeError: Error in th>
