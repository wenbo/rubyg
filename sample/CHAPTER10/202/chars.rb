# 「?」はどれか1文字にマッチする。
Dir["file?.rb"]      # => ["file1.rb", "file2.rb", "file3.rb"]
# 1と3にマッチする。
Dir["file[13].rb"]   # => ["file1.rb", "file3.rb"]
# 2〜9にマッチする。
Dir["file[2-9].rb"]  # => ["file2.rb", "file3.rb"]
# 3〜9以外にマッチする。
Dir["file[^3-9].rb"] # => ["file1.rb", "file2.rb"]
Dir["file[!3-9].rb"] # => ["file1.rb", "file2.rb"]
