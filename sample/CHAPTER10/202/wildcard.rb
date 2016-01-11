# �����ե�����ʳ��Τ��٤ƤΥե���������롣
Dir["*"]    # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb"]
# �����ե���������롣
Dir[".*"]   # => ["..", ".emacs", ".bashrc", "."]
# ��ĥ���դ��Υե���������롣
Dir["*.*"]  # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "file3.rb"]
# ��ĥ�Ҥ�.rb�Υե���������롣
Dir["*.rb"]     # => ["file1.rb", "file2.rb", "file.rb", "file3.rb"]
# ��Ƭ��file�ǳ�ĥ�Ҥ�.rb�Υե���������롣
Dir["file*.rb"] # => ["file1.rb", "file2.rb", "file.rb", "file3.rb"]
Dir["file?.rb"] # => ["file1.rb", "file2.rb", "file3.rb"]
# ʣ���Υ磻��ɥ����ɤ���ꤹ��ˤϡ�\0�פǶ��ڤ롣
Dir["*.rb\0*.txt"]  # => ["file1.rb", "file2.rb", "file.rb", "file3.rb", "test.txt", "bar.txt", "foo.txt"]
# �����ե������ޤ᤿���٤ƤΥե���������롣
Dir["*\0.*"]        # => ["test.txt", "file1.rb", "bar.txt", "foo.txt", "file2.rb", "file.rb", "noext", "file3.rb", "..", ".emacs", ".bashrc", "."]
