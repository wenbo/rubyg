# ディレクトリ名を得る。
# ディレクトリ名を得る。
File.dirname "/tmp/arbitrary.txt"          # => "/tmp"
# 「/」を含まない場合はカレントディレクトリを返す。
File.dirname "arbitrary.txt"               # => "."
# 末尾の「/」は無視される。
File.dirname "/tmp/dir/"                   # => "/tmp"
File.dirname "/tmp//dir/"                  # => "/tmp"
# ディレクトリを除いたファイル名を得る。
# ファイル名を得る。
File.basename "/tmp/arbitrary.txt"         # => "arbitrary.txt"
# 末尾の「/」は無視される。
File.basename "/tmp/dir/"                  # => "dir"
File.basename "/tmp//dir/"                 # => "dir"
# 拡張子が一致している場合は拡張子を取り除いたファイル名を得る。
File.basename "/tmp/arbitrary.txt", ".txt" # => "arbitrary"
# 拡張子を取り除いたファイル名を得る。
File.basename "/tmp/arbitrary.txt", ".*"   # => "arbitrary"
# 拡張子が一致しない場合は拡張子を取り除かない。
File.basename "/tmp/arbitrary.txt", ".rb"  # => "arbitrary.txt"
#5 拡張子を得る。
# 拡張子を得る。
File.extname "/tmp/arbitrary.txt"          # => ".txt"
# これらは拡張子とはみなさない。
File.extname ".emacs"                      # => ""
File.extname ".."                          # => ""
# ディレクトリ名、ファイル名のペアを得る。
File.split "/tmp/arbitrary.txt"            # => ["/tmp", "arbitrary.txt"]
# 絶対パス（フルパス）を得る。
# ~ をホームディレクトリに置き換える。
File.expand_path "~/.emacs"                # => "/m/home/rubikitch/.emacs"
# ~USER を USER のホームディレクトリに置き換える。
File.expand_path "~root/.bashrc"           # => "/root/.bashrc"
# 省略可能な第2引数をつけた場合はそこを基準にして絶対パスを得る。
File.expand_path "vmlinuz", "/"            # => "/vmlinuz"
# すでに絶対パスであればそのまま。
File.expand_path "/bin/sh", "/boot"        # => "/bin/sh"
# 引数をパス区切り文字（/）でつなげる。
File.join "/path", "to", "ruby"            # => "/path/to/ruby"
