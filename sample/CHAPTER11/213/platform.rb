# Windowsであるか判別する関数。
def windows?(platform = RUBY_PLATFORM)
  platform =~ /win/i and platform !~ /darwin/
end
# 筆者のマシンはPentium 4でGNU/Linux。
RUBY_PLATFORM       # => "i686-linux"
windows?            # => nil
windows? "mswin32"  # => true
# darwinはMac OS Xなので「win」という文字列が含まれていてもWindowsではない。
windows? "darwin"   # => false
