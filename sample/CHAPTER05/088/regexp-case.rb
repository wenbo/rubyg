def message_type__case(msg)
  case msg
  when /^Error/   then :error   # 「Error」で始まるメッセージは :error を返す。
  when /^Warning/ then :warning # 「Warning」で始まるメッセージは :warning を返す。
  else                 :info    # その他のメッセージは :info を返す。
  end
end
message_type__case "Error: file not found"   # => :error
message_type__case "Warning: use fallback"   # => :warning
message_type__case "set verbose mode"        # => :info

# Ruby 1.9ではハッシュにしても構わない。
MESSAGE_TYPE = [ [ /^Error/,   :error],
                 [ /^Warning/, :warning],
                 [ //,         :info] ]
#1 正規表現とシンボルの連想リストから、メッセージが正規表現にマッチする最初のペアを取り出す。
def message_type__alist(msg)  MESSAGE_TYPE.find {|re,sym| msg =~ re }.last  end
message_type__alist "Error: file not found"  # => :error
message_type__alist "Warning: use fallback"  # => :warning
message_type__alist "set verbose mode"       # => :info
