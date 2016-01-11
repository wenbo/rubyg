require 'kconv'
s = "�Ҥ餬�� / ��������"
hiragana = NKF.nkf("-h1e", s)  # => "�Ҥ餬�� / ��������"
NKF.nkf("-e --hiragana", s)    # => "�Ҥ餬�� / ��������"
katakana = NKF.nkf("-h2e", s)  # => "�ҥ饬�� / ��������"
NKF.nkf("-e --katakana", s)    # => "�ҥ饬�� / ��������"
invert   = NKF.nkf("-h3e", s)  # => "�ҥ饬�� / ��������"
