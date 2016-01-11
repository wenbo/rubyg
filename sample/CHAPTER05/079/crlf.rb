require 'kconv'
unix = "first\nsecond\n"
# CRLF
dos = NKF.nkf("-eLw", unix)          # => "first\r\nsecond\r\n"
dos = NKF.nkf("-e --msdos", unix)    # => "first\r\nsecond\r\n"
dos = NKF.nkf("-e --windows", unix)  # => "first\r\nsecond\r\n"
# LF
unix = NKF.nkf("-eLu", dos)          # => "first\nsecond\n"
unix = NKF.nkf("-e --unix", dos)     # => "first\nsecond\n"
# CR
mac = NKF.nkf("-eLm", unix)          # => "first\rsecond\r"
mac = NKF.nkf("-e --mac", dos)       # => "first\rsecond\r"
