# ��?�פϤɤ줫1ʸ���˥ޥå����롣
Dir["file?.rb"]      # => ["file1.rb", "file2.rb", "file3.rb"]
# 1��3�˥ޥå����롣
Dir["file[13].rb"]   # => ["file1.rb", "file3.rb"]
# 2��9�˥ޥå����롣
Dir["file[2-9].rb"]  # => ["file2.rb", "file3.rb"]
# 3��9�ʳ��˥ޥå����롣
Dir["file[^3-9].rb"] # => ["file1.rb", "file2.rb"]
Dir["file[!3-9].rb"] # => ["file1.rb", "file2.rb"]
