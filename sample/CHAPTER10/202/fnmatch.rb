File.fnmatch '*.rb', 'test.rb'  # => true
File.fnmatch '*', '.emacs'      # => false
File.fnmatch '*', 'ruby'        # => true
File.fnmatch '*', 'hello.c'     # => true
