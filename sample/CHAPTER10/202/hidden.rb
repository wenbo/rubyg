Dir[".*"]                  # => ["..", ".emacs", ".bashrc", "."]

Dir[".*\0*"]               # => ["..", ".emacs", ".bashrc", ".", "test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb"]
Dir.glob("*", File::FNM_DOTMATCH) # => ["..", ".emacs", ".bashrc", ".", "test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb"]
Dir[".*\0*"] - [".", ".."] # => [".emacs", ".bashrc", "test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb"]
