Dir.glob('*.RB', File::FNM_CASEFOLD)
# => ["file1.rb", "file2.rb", "file.rb", "file3.rb"]
Dir["*1*","*2*"]  # => ["file1.rb", "file2.rb"]
Dir.glob('*.txt') {|fn| puts fn }
# >> test.txt
# >> bar.txt
# >> foo.txt
