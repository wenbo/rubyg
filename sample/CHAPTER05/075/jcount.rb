#!/usr/local/bin/ruby -Ke
# Ruby 1.8.6����
"�롼��".scan(/./).grep("��").length  # => 2
# Ruby 1.8.7�ʹ�
"�롼��".chars.count("��")            # => 2
