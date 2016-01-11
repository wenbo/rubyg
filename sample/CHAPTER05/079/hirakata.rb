require 'kconv'
s = "ひらがな / カタカナ"
hiragana = NKF.nkf("-h1e", s)  # => "ひらがな / かたかな"
NKF.nkf("-e --hiragana", s)    # => "ひらがな / かたかな"
katakana = NKF.nkf("-h2e", s)  # => "ヒラガナ / カタカナ"
NKF.nkf("-e --katakana", s)    # => "ヒラガナ / カタカナ"
invert   = NKF.nkf("-h3e", s)  # => "ヒラガナ / かたかな"
