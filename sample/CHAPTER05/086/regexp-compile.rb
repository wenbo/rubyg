#!/usr/local/bin/ruby -Ke
restr = "̾��:.+����̾:.+"
# ����ɽ��ʸ�����Regexp���Ѵ����롣ξ�Ԥ�������
Regexp.new(restr)   # => /̾��:.+����̾:.+/
/#{restr}/          # => /̾��:.+����̾:.+/
# ��ʸ����ʸ������̤���������ʣ���ԥ⡼�ɡ������EUC-JPʸ�������ɤ�Regexp��������롣ξ�Ԥ�������
re_im = Regexp.new(restr, Regexp::IGNORECASE | Regexp::MULTILINE, "e") # => /̾��:.+����̾:.+/mie
/#{restr}/mie       # => /̾��:.+����̾:.+/mie
# Regexp.new��Regexp��Ϳ�����Ȥ���ʣ�����롣���ץ�����ʸ�������ɤϤ��Τޤޡ�
Regexp.new(re_im)   # => /̾��:.+����̾:.+/mie
