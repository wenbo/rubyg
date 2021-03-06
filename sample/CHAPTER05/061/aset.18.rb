#!/usr/local/bin/ruby -Ke
RUBY_VERSION                                    # => "1.8.7"
euc = "わかめごはん"
euc2 = euc.dup; euc2[0,6] = ""                  # => ""
euc2                                            # => "ごはん"
euc3 = euc.dup; euc3[6..12] = ""                # => ""
euc3                                            # => "わかめ"
euc4 = euc.dup; euc4[/わかめ/] = ""             # => ""
euc4                                            # => "ごはん"
euc5 = euc.dup; euc5["ごはん"] = ""             # => ""
euc5                                            # => "わかめ"
euc6 = euc.dup; euc6[/わかめ(ごはん)/, 1] = ""  # => ""
euc6                                            # => "わかめ"
