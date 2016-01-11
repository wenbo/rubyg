require 'kconv'
NKF.nkf("-re", "I love Ruby!")               # => "V ybir Ehol!"
NKF.nkf("-re", "V ybir Ehol!")               # => "I love Ruby!"
"I love Ruby!".tr("A-Za-z", "N-ZA-Mn-za-m")  # => "V ybir Ehol!"
NKF.nkf("-re", "°Å¹æ¤´¤Ã¤³")                 # => "ßôè·ÓãÓòÓâ"
NKF.nkf("-re", "ßôè·ÓãÓòÓâ")                 # => "°Å¹æ¤´¤Ã¤³"
