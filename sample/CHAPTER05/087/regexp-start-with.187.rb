errmsg = "Error: out of memory"
# ��Ƭʸ����Υ����å���
errmsg.start_with? "Warning"  # => false
errmsg.start_with? "Error"    # => true
# ����ʸ����Υ����å���
errmsg.end_with? "memory"     # => true
