system "sh", "-c", "exit 0";  $?.exitstatus # => 0
system "sh -c 'exit 1'";      $?.exitstatus # => 1
IO.popen("sh -c 'exit 2'"){}; $?.exitstatus # => 2
open("| sh -c 'exit 3'"){};   $?.exitstatus # => 3
`sh -c 'exit 4'`;             $?.exitstatus # => 4
