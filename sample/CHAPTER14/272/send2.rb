# ���ޥ�ɥ饤�����1������print����ꤷ�����˼¹Ԥ���᥽�åɡ�
def do_print(*args)
  puts "Print:#{args.join ', '}"
end

# ���ޥ�ɥ饤�����1������list����ꤷ�����˼¹Ԥ���᥽�åɡ�
def do_list(*args)
  puts "List:#{args.join ', '}"
end

# �Ƥ֥᥽�åɤ򥳥ޥ�ɥ饤�����1������ʬ�����롣��1������Ƭ�ˡ�do_�פ�Ĥ����᥽�åɤ�Ƥ֡��Ĥ�Υ��ޥ�ɥ饤������򤽤Υ᥽�åɤ��Ϥ���
case ARGV.first
when 'print' then do_print *ARGV[1..-1]
when 'list' then do_list *ARGV[1..-1]
end

