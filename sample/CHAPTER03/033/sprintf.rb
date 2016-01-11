def tsprintf(fmt, *args)
  sprintf "[%s]#{fmt}", Time.now, *args
end
tsprintf "i=%d s=%s", 100, "hoge" # => "[2008-02-26 06:56:53 +0900]i=100 s=hoge"
