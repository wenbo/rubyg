s1 = File.stat "abc.txt"          # abc.txt���̾�Υե�����
s2 = File.stat "link.to.abc.txt"  # link.to.abc.txt�ϥ���ܥ�å����
# s2 �� link.to.abc.txt �ǤϤʤ��� abc.txt �ξ���
s2 == s1                          # => true
s2.symlink?                       # => false
s3 = File.lstat "link.to.abc.txt" # => #<File::Stat dev=0x302, ino=22746761, mode=0120777, nlink=1, uid=1001, gid=100, rdev=0x0, size=7, blksize=4096, blocks=0, atime=2008-03-15 19:34:14 +0900, mtime=2008-03-15 19:30:47 +0900, ctime=2008-03-15 19:30:47 +0900>
s3.symlink?                       # => true
