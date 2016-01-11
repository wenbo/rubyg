require 'pathname'
# 相対パスを得る
usr = Pathname "/usr"
ubin = Pathname "/usr/bin"
ubin.relative_path_from usr                 # => #<Pathname:bin>
# パスをきれいにする
Pathname("/path//to/foo/../bar").cleanpath  # => #<Pathname:/path/to/bar>
