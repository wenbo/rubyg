#!/usr/local/bin/ruby
# ARGF�ϥ��ޥ�ɥ饤��ǻ��ꤵ�줿�ե������ɸ�����Ϥ�������Ϥ򰷤�IO���֥������ȡʤ�ɤ��ˡ�
ARGF.each_with_index do |line, i|
# ����ǥå�����0����Ϥޤꡢ���ֹ��1����Ϥޤ�Τǥ���ǥå�����1�ä��롣
  printf "%4d:%s", i+1, line
end
