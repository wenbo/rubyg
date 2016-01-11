require 'kconv'
NKF.nkf("-re", "I love Ruby!")               # => "V ybir Ehol!"
NKF.nkf("-re", "V ybir Ehol!")               # => "I love Ruby!"
"I love Ruby!".tr("A-Za-z", "N-ZA-Mn-za-m")  # => "V ybir Ehol!"
NKF.nkf("-re", "�Ź椴�ä�")                 # => "���������"
NKF.nkf("-re", "���������")                 # => "�Ź椴�ä�"
