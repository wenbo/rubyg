File.read "abc.txt"     # => "abc\n"
# ファイルが存在するときtrue。
File.exist? "abc.txt"           # => true
# ファイルの情報を質問するためにFile::Statオブジェクトを得る。
s = File.stat "abc.txt"         # => #<File::Stat dev=0x302, ino=24776410, mode=0100644, nlink=1, uid=1001, gid=100, rdev=0x0, size=4, blksize=4096, blocks=8, atime=2008-10-05 11:27:45 +0900, mtime=2008-03-15 14:41:04 +0900, ctime=2009-10-05 08:06:42 +0900>
# これらはFileのクラスメソッドとして使える。
# 最終アクセス時刻。
s.atime               # => 2008-10-05 11:27:45 +0900
# 最終状態変更時刻（Unix系OSではchmodなどi-nodeの変更）。
s.ctime               # => 2009-10-05 08:06:42 +0900
# 最終更新時刻。
s.mtime               # => 2008-03-15 14:41:04 +0900
# ファイルのタイプ。「"file"、"directory"、"characterSpecial"、"blockSpecial"、
# "fifo"、"link"、"socket"、"unknown"」のどれかを返す。
s.ftype               # => "file"
# 以下はFileのクラスメソッドとしてもFileTestのメソッドとしても使える。
# ディレクトリのときtrue。
s.directory?          # => false
# 通常のファイルのときtrue。
s.file?               # => true
# パイプのときtrue。
s.pipe?               # => false
# シンボリックリンクのときtrue。
s.symlink?            # => false
# ソケットのときtrue。
s.socket?             # => false
# ブロックスペシャルファイルのときtrue。
s.blockdev?           # => false
# キャラクタスペシャルファイルのときtrue。
s.chardev?            # => false
# 読み込み可能のときtrue。
s.readable?           # => true
# 実ユーザ・実グループで読み込み可能のときtrue。
s.readable_real?      # => true
# 書き込み可能のときtrue。
s.writable?           # => true
# 実ユーザ・実グループで書き込み可能のときtrue。
s.writable_real?      # => true
# 実行可能のときtrue。
s.executable?         # => false
# 実ユーザ・実グループで実行可能のときtrue。
s.executable_real?    # => false
# サイズが0バイトのときtrue。
s.zero?               # => false
# ファイルのサイズを返す。size?は0バイトのファイルに対しては偽を返す。
s.size?               # => 4
s.size                # => 4
# 自分が所有者であるときtrue。
s.owned?              # => true
# グループIDが実効グループIDと等しいときtrue。
s.grpowned?           # => true
# setuid/setgidされているときtrue。
s.setuid?             # => false
s.setgid?             # => false
# stickyビットが立っているときtrue。
s.sticky?             # => false
# Fileのクラスメソッドは引数にファイル名を指定する。
File.file? "abc.txt"  # => true
