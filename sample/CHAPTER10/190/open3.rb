begin
  f = open("sample.txt", "r")
  raise    # �㳰��������
  f.close
rescue     # ��ª�����
end
# ���λ����ǥե�����ϳ����줿�ޤ�
f.closed?  # => false
