ARGV.replace %w[ab.txt cd.txt] # ARGVを強引に ["ab.txt", "cd.txt"] に 書き換える
ARGF.gets                      # ab.txtを読む
[ARGF.filename, ARGV]          # => ["ab.txt", ["cd.txt"]]
ARGF.skip                      # ((:ARGF.skip:))は現在のファイルを閉じ、次のファイルを開く
ARGF.gets                      # cd.txtを読む
[ARGF.filename, ARGV]          # => ["cd.txt", []]
