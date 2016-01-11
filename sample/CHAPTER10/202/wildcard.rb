# 隠しファイル以外のすべてのファイルを得る。
Dir["*"]    # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb"]
# 隠しファイルを得る。
Dir[".*"]   # => ["..", ".emacs", ".bashrc", "."]
# 拡張子付きのファイルを得る。
Dir["*.*"]  # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "file3.rb"]
# 拡張子が.rbのファイルを得る。
Dir["*.rb"]     # => ["file1.rb", "file2.rb", "file.rb", "file3.rb"]
# 先頭がfileで拡張子が.rbのファイルを得る。
Dir["file*.rb"] # => ["file1.rb", "file2.rb", "file.rb", "file3.rb"]
Dir["file?.rb"] # => ["file1.rb", "file2.rb", "file3.rb"]
# 複数のワイルドカードを指定するには「\0」で区切る。
Dir["*.rb\0*.txt"]  # => ["file1.rb", "file2.rb", "file.rb", "file3.rb", "test.txt", "bar.txt", "foo.txt"]
# 隠しファイルも含めたすべてのファイルを得る。
Dir["*\0.*"]        # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb", "..", ".emacs", ".bashrc", "."]
