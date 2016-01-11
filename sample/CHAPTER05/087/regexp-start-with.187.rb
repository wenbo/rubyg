errmsg = "Error: out of memory"
# 先頭文字列のチェック。
errmsg.start_with? "Warning"  # => false
errmsg.start_with? "Error"    # => true
# 末尾文字列のチェック。
errmsg.end_with? "memory"     # => true
