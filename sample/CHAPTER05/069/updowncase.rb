s = "tiTlE"
# ��ʸ���ˤ��롣
s.upcase       # => "TITLE"
# ��ʸ���ˤ��롣
s.downcase     # => "title"
# ��Ƭ��ʸ������ʸ���ˡ��Ĥ��ʸ���ˤ��롣
s.capitalize   # => "Title"
# ��ʸ���Ⱦ�ʸ���������ؤ��롣
s.swapcase     # => "TItLe"
# �������˲�Ū�С������ʸ�����ѹ�����ʤ����nil���֤���
s.upcase!      # => "TITLE"
s.upcase!      # => nil
s.downcase!    # => "title"
s.capitalize!  # => "Title"
s.swapcase!    # => "tITLE"
s              # => "tITLE"
