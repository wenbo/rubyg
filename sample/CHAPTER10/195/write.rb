# ���ϥ᥽�åɤ�Ȥ��ˤϽ񤭹����Ѥ˥ե�����򳫤�ɬ�פ����롣
open("output.txt", "w") do |f|
# write�ϤҤȤĤ�����������Ƥʤ���
  f.write "write: "
  f.write 123
  f.write "\n"
# print��ʣ���Ĥΰ�������Ƥơ����Τޤ�Ϣ�뤷�ƽ��Ϥ��롣
  f.print "print: ", 456, "\n"
# puts�Ϥ��줾��ΰ�����ɽ��������˲��Ԥ�����롣
  f.puts "<puts>", 789, "</puts>"
# puts�˰�����Ĥ��ʤ��ȶ��Ԥ�����롣
  f.puts
# <<��self���֤����ᡢϢ��Ǥ��롣
  f << "<<: " << 0 << "\n"
# printf�Ͻ��դ����ϡ�
  f.printf "printf: %d\n", 999
# putc��1ʸ����ʸ�����������б�����ʸ�������ɤ�ʸ������Ϥ���
  f.putc "C"
  f.putc 97                     # 'a' ��ʸ��������
  f.puts
end
# ɸ����Ϥ�output.txt�����Ƥ�ɽ�����롣������Kernel#print�Ǥ⹽��ʤ���
$stdout.print File.read("output.txt")
# >> write: 123
# >> print: 456
# >> <puts>
# >> 789
# >> </puts>
# >> 
# >> <<: 0
# >> printf: 999
# >> Ca
