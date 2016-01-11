#!/usr/local/bin/ruby -Ke
# Ruby 1.8.6以前
"ルール".scan(/./).grep("ル").length  # => 2
# Ruby 1.8.7以降
"ルール".chars.count("ル")            # => 2
