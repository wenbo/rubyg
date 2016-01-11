def message_type__case(msg)
  case msg
  when /^Error/   then :error   # ��Error�פǻϤޤ��å������� :error ���֤���
  when /^Warning/ then :warning # ��Warning�פǻϤޤ��å������� :warning ���֤���
  else                 :info    # ����¾�Υ�å������� :info ���֤���
  end
end
message_type__case "Error: file not found"   # => :error
message_type__case "Warning: use fallback"   # => :warning
message_type__case "set verbose mode"        # => :info

# Ruby 1.9�Ǥϥϥå���ˤ��Ƥ⹽��ʤ���
MESSAGE_TYPE = [ [ /^Error/,   :error],
                 [ /^Warning/, :warning],
                 [ //,         :info] ]
#1 ����ɽ���ȥ���ܥ��Ϣ�ۥꥹ�Ȥ��顢��å�����������ɽ���˥ޥå�����ǽ�Υڥ�����Ф���
def message_type__alist(msg)  MESSAGE_TYPE.find {|re,sym| msg =~ re }.last  end
message_type__alist "Error: file not found"  # => :error
message_type__alist "Warning: use fallback"  # => :warning
message_type__alist "set verbose mode"       # => :info
